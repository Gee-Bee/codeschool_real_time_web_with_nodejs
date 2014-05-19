http = require 'http'

makePostRequest = (message) ->
  request = http.request
    host: 'localhost'
    port: 3000
    path: '/'
    method: 'POST'
    # optional listener for the 'response' event
    (response) ->
      response.pipe process.stdout, end: false
      # response.on 'data', (chunk) ->
      #   console.log chunk.toString()

  request.write message
  request.end()

module.exports = makePostRequest
