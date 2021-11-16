return {
    {
        type = "nlua",
        request = "attach",
        name = "Attach to running Neovim instance",
        host = function() return "127.0.0.1" end,
        port = function()
            local val = 54231
            return val
        end
    }
}
