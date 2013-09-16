#!/usr/bin/env coffee

prompt = require('prompt')

cow = """
         (__)  | Meuhhhhh |
         (oo) /
  /-------\\/ 
 / |     ||
* ||----||
   ~~    ~~
"""

prompt.message = ''
prompt.delimiter = ''
prompt.colors = false

class Range
  constructor: (@operandes, @tables) ->
  random: (min,max) ->
    Math.floor (Math.random() * max ) + min
  randomOperande : ->
    return @operandes[@random(0, @operandes.length)]
  randomTable : ->
    return @tables[@random(0, @tables.length)]
  possibleOperations : ->
    return @operandes.length * @tables.length

class Operation
  constructor: (@range) ->
    @operande = @range.randomOperande()
    @table = @range.randomTable()
  result:->
    @operande * @table
  toString:->
    "#{@operande} x #{@table}"

class Exercice
  constructor: (@maxOperation, @range) ->    
    possibleOps = @range.possibleOperations()
    #console.log "Nombre d'opération maximum : #{possibleOps}" 
    if possibleOps < @maxOperation
      console.log "Je vais de poser #{@range.possibleOperations()} opérations."
      @maxOperation = possibleOps
    @count = @maxOperation
    @points = 0
    @operations = []
    @errors = []
    @properties =
      name: 'reponse'
      pattern: '^[0-9]+$'
      required: true
      description : '>> '
      message : 'Cette réponse ne peut pas convenir, ré-essaye'

  onErr : (err) ->
      console.log(err)
      return 1

  end : ->
    console.log ""
    console.log "================================"
    console.log "Ta note : #{@points}/#{@maxOperation}"
    if @errors.length > 0
      console.log @errors.length
      console.log 'Il faut encore que tu révises les multiplications suivantes'
      for operation in @errors
        console.log "    #{operation} = #{operation.result()}"
    if (@maxOperation is @range.possibleOperations())
      console.log "Je t'ai posé toutes les opérations possibles."
    else
      console.log "Je t'ai posé #{@maxOperation} sur les #{@range.possibleOperations()} possibles."
    console.log "================================"
    console.log cow

# possibleOperations = 100% = 32
# 32/100*27
# maxOperation = 27

  run : ->
    operation = new Operation(@range)
    while operation.toString() in @operations
      operation = new Operation(@range)
    @operations.push operation.toString()
    console.log ""
    console.log "================================"
    console.log "Combien fait : #{operation} ?"
    prompt.start()
    prompt.get @properties, (err, result) =>
      if (err) 
        return @onErr(err)
      if operation.result() == +result.reponse
        console.log 'BRAVO !'
        @points++
      else
        console.log '<<<<<<<<<<<<<<<<<< FAUX ! >>>>>>>>>>>>>>>>>>>>>>'
        @errors.push operation
        console.log "#{operation} ca fait #{operation.result()}"
        console.log '                                                    Retiens le !'
      console.log "================================"
      if (--@count > 0)
        @run()
      else 
        @end()

# new Exercice(48, new Range [4,5,6,7,8,9], [2,3,4,5,6,7,8,9]).run()
new Exercice(48, new Range [7], [2,3,4,5,6,7,8,9]).run()

