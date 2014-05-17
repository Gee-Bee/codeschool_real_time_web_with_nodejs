http = require 'http'
fs   = require 'fs'

http.createServer (request, response) ->
  fs.readFile "#{__dirname}/pages/hello.html", (err,data) ->
    response.write data
    response.end()
.listen 3000
