http = require 'http'
fs   = require 'fs'

server = new http.Server()
server.on 'request', (request, response) ->
  response.writeHead 200, 'Content-Type': 'text/html'
  file = fs.createReadStream("#{__dirname}/../1_intro_to_nodejs/pages/hello.html")
  file.pipe(response)
.listen 3000
