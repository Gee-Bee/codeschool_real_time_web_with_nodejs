http = require 'http'

server = http.createServer()
server.on 'request', (req,res) ->
  res.writeHead 200
  res.write 'Dog is running...'
  setTimeout ->
    res.write 'Dog is done.'
    res.end()
  , 5000

server.listen 3000
