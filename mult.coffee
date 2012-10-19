#!/usr/bin/env coffee

prompt = require('prompt')

class Range
  constructor: (@operandes, @tables) ->
  random: (min,max) ->
    Math.floor (Math.random() * max ) + min
  randomOperande : ->
    return @operandes[@random(0, @operandes.length)]
  randomTable : ->
    return @tables[@random(0, @tables.length)]

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
    @count = @maxOperation
    @points = 0
    @operations = []
    @errors = []

  onErr : (err) ->
      console.log(err)
      return 1

  hasErrors : ->
    @errors.length > 0

  end : ->
    console.log ""
    console.log "================================"
    console.log "Ta note : #{@points}/#{@maxOperation}"
    if (@hasErrors)
      console.log 'Il faut encore que tu révises les multiplications suivantes'
      for operation in @errors
        console.log "    #{operation} = #{operation.result()}"
    console.log "================================"

  run : ->
    operation = new Operation(@range)
    while operation.toString() in @operations
      operation = new Operation(@range)
    @operations.push operation.toString()
    console.log ""
    console.log "================================"
    console.log "Combien fait : #{operation} ?"
    prompt.start()
    prompt.get ['reponse'], (err, result) =>
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

new Exercice(20, new Range [6,7,8,9], [2,3,4,5,6,7,8,9]).run()


