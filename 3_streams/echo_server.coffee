http = require 'http'

server = new http.Server()
server
.on 'request', (request, response) ->
  # same as request.pipe(response)
  request.on 'data', (chunk) ->
    buffer_good = response.write chunk
    request.pause() unless buffer_good
  response.on 'drain', -> request.resume()
  request.on 'end', -> response.end()
  ####
.on 'request', ->
  process.stdout.write 'New request coming in...'
.on 'close', ->
  process.stdout.write 'Closing down the server...'
.listen 3000

# curl -d 'hello' localhost:3000
