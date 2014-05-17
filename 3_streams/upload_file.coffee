http = require 'http'
fs   = require 'fs'

http.createServer (request, response) ->
  newFile = fs.createWriteStream("#{__dirname}/files/uploaded.txt")
  fileBytes = request.headers['content-length']
  uploadedBytes = 0

  request.pipe newFile
  ### pipe solves back pressure
  request.on 'data', (chunk) ->
    buffer_good = newFile.write chunk
    request.pause() unless buffer_good
  newFile.on 'drain', -> request.resume()
  request.on 'end', -> newFile.end()
  ###
  request.on 'data', (chunk) ->
    uploadedBytes += chunk.length
    progress = uploadedBytes / fileBytes * 100
    response.write "progress: #{parseInt progress, 10}%\n"

  request.on 'end', -> response.end 'File uploaded!'
.listen 3000

# curl --upload-file files/sample.txt localhost:3000
