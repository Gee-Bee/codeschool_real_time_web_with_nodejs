http = require 'http'

http.createServer (req,res) ->
  # res.writeHead 200
  res.write 'Dog is running'
  res.write ' very fast'
  res.end()
  res.on 'finish', () -> console.log 'Sent'
.listen 3000

console.log 'Listening on 3000'
