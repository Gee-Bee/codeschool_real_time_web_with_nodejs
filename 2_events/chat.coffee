chat = new (require('events').EventEmitter)()
users = []; chatlog = []

chat
.on 'message', (message) ->
  chatlog.push message
.on 'join', (nickname) ->
  users.push nickname

chat.emit 'join', 'Greg'
chat.emit 'message', 'Hello all!'
