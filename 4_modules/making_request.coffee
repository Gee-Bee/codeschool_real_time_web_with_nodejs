http = require 'http'
makePostRequest = require './modules/make_post_request'

echoServer = http.createServer().listen 3000
echoServer.on 'request', (request, response) -> request.pipe(response)

makePostRequest 'Message in POST body'
makePostRequest 'Message in POST body'
makePostRequest 'Message in POST body'
