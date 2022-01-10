return function(callback, config)
  callback({ type = 'server', host = config.host, port = config.port })
end
