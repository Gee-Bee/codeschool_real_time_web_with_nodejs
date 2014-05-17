logger = new (require('events').EventEmitter)()
logger.on 'error', (message) ->
  console.log "Err: #{message}"
logger.emit 'error', 'Spilled Milk'
logger.emit 'error', 'Eggs Crashed'
