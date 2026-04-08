{
  description = ''
    Uses flake-parts to set up the flake outputs:

    `wrappers`, `wrapperModules` and `packages.*.*`
  '';
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    wrappers = {
      url = "github:BirdeeHub/nix-wrapper-modules";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    flake-parts = {
      url = "github:hercules-ci/flake-parts";
      inputs.nixpkgs-lib.follows = "nixpkgs";
    };
    neovim-nightly-overlay.url = "github:nix-community/neovim-nightly-overlay";
  };

  outputs = inputs:
    inputs.flake-parts.lib.mkFlake {inherit inputs;} {
      systems = inputs.nixpkgs.lib.platforms.all;

      imports = [
        inputs.flake-parts.flakeModules.modules
        inputs.wrappers.flakeModules.wrappers
      ];

      flake.nvimWrapper = {
        config,
        wlib,
        lib,
        pkgs,
        ...
      }: {
        imports = [wlib.wrapperModules.neovim];
        config.package = inputs.neovim-nightly-overlay.packages.${pkgs.stdenv.hostPlatform.system}.neovim;

        options.settings.dev_mode = lib.mkOption {
          type = lib.types.bool;
          default = false;
          description = ''
            If true, use impure config instead for fast edits

            Both versions of the package may be installed simultaneously
          '';
        };

        config.settings.config_directory =
          if config.settings.dev_mode
          then config.settings.unwrapped_config
          else config.settings.wrapped_config;

        options.settings.wrapped_config = lib.mkOption {
          type = wlib.types.stringable;
          default = ./.;
        };

        options.settings.unwrapped_config = lib.mkOption {
          type = lib.types.either wlib.types.stringable lib.types.luaInline;
          default = lib.generators.mkLuaInline "vim.uv.os_homedir() .. '/.config/nvim'";
        };

        config.settings.dont_link = config.binName != "nvim";

        config.binName = lib.mkIf config.settings.dev_mode (lib.mkDefault "vim");

        config.settings.aliases = lib.mkIf (config.binName == "nvim") ["vi" "vim"];

        config.specs.initLua = {
          data = pkgs.vimPlugins.lze;
          before = ["INIT_MAIN"];
          config = ''
            vim.g.skip_pack = true
          '';
        };

        config.extraPackages = [
          # misc
          pkgs.ripgrep
          pkgs.bat
          pkgs.delta
          pkgs.fd
          pkgs.git
          pkgs.typos-lsp

          # bash
          pkgs.bash-language-server
          pkgs.shfmt
          # c/c++
          pkgs.clang-tools
          # cmake
          pkgs.cmake-language-server
          pkgs.cmake-format
          # js/ts
          pkgs.tailwindcss-language-server
          pkgs.prettierd
          # lua
          pkgs.lua-language-server
          pkgs.selene
          pkgs.stylua
          # markdown
          pkgs.markdown-oxide
          # nix
          pkgs.nixd
          pkgs.alejandra
          # openscad
          pkgs.openscad-lsp
          # python
          pkgs.python314Packages.flake8
          pkgs.yapf
          pkgs.isort
          pkgs.python314Packages.vulture
          # qml
          pkgs.kdePackages.qtdeclarative
          # typescript
          pkgs.typescript-language-server
          # vue
          pkgs.vscode-extensions.vue.volar
        ];

        config.specs.opt = let
          p = pkgs.vimPlugins;
        in {
          lazy = true;
          data = [
            p.barbar-nvim
            p.blink-cmp
            p.catppuccin-nvim
            p.nvim-colorizer-lua
            p.conform-nvim
            p.csvview-nvim
            p.nvim-dap
            p.nvim-dap-virtual-text
            p.fidget-nvim
            p.friendly-snippets
            p.fzf-lua
            p.gitsigns-nvim
            p.indent-blankline-nvim
            p.leap-nvim
            p.nvim-lint
            p.nvim-lspconfig
            p.lualine-nvim
            p.luasnip
            p.marks-nvim
            p.mini-nvim
            p.neogit
            p.oil-nvim
            p.plenary-nvim
            p.quicker-nvim
            p.vim-sleuth
            p.snacks-nvim
            p.todo-comments-nvim
            p.nvim-treesitter.withAllGrammars
            p.nvim-treesitter-context
            p.nvim-treesitter-textobjects
            p.treesj
            p.vim-dispatch
            p.vim-dispatch-neovim
            p.nvim-web-devicons
            p.which-key-nvim
          ];
        };
      };

      flake.nixosModules = {
        default = inputs.self.homeModules.neovim;
        neovim = inputs.wrappers.lib.mkInstallModule {
          name = "neovim";
          value = inputs.self.nvimWrapper;
        };
      };

      flake.homeModules = {
        default = inputs.self.homeModules.neovim;
        neovim = inputs.wrappers.lib.mkInstallModule {
          name = "neovim";
          value = inputs.self.nvimWrapper;
          loc = [
            "home"
            "packages"
          ];
        };
      };

      flake.wrappers = {
        default = inputs.self.wrappers.neovim;
        neovim = {...}: {
          imports = [inputs.self.nvimWrapper];
        };
        neovim-dev = {...}: {
          imports = [inputs.self.nvimWrapper];
          settings.dev_mode = true;
        };
      };

      perSystem = {
        pkgs,
        lib,
        self',
        ...
      }: {
        packages.neovim-dynamic = pkgs.writeShellApplication {
          name = "vim";
          text = ''
            if [ -d ~/.config/nvim ]; then
                # start dev mode
                ${lib.getExe self'.packages.neovim-dev} "$@"
            else
                # start normal mode
                ${lib.getExe self'.packages.neovim} "$@"
            fi
          '';
        };
      };
    };
}
