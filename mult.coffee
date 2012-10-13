prompt = require('prompt')

maxcount = 20
count = maxcount
points = 0
operations = []
erreurs = []

tableToWork=[6,7,8,9]
operandeToWork=[2,3,4,5,6,7,8,9]

class Operation
  constructor: ->
    @operande = operandeToWork[random(0,operandeToWork.length)]
    @table = tableToWork[random(0,tableToWork.length)]
  result:->
    @operande * @table
  toString:->
    "#{@operande} x #{@table}"

random = (min,max) ->
  Math.floor (Math.random() * max ) + min

ask = -> 
  operation = new Operation()
  while operation.toString() in operations
    operation = new Operation()
  operations.push operation.toString()
  console.log ""
  console.log "================================"
  console.log "Combien fait : #{operation} ?"
  prompt.start()
  prompt.get ['reponse'], (err, result) ->
    if (err) 
      return onErr(err)
    if operation.result() == +result.reponse
      console.log 'BRAVO !'
      points++
    else
      console.log '<<<<<<<<<<<<<<<<<< FAUX ! >>>>>>>>>>>>>>>>>>>>>>'
      erreurs.push operation
      console.log "#{operation} ca fait #{operation.result()}"
      console.log '                                                    Retiens le !'
    console.log "================================"
    if (--count > 0)
      ask()
    else 
      end()

end = ->
  console.log ""
  console.log "================================"
  console.log "Ta note : #{points}/#{maxcount}"
  if (erreurs.length > 0)
    console.log 'Il faut encore que tu révises les multiplications suivantes'
    for operation in erreurs
      console.log "    #{operation} = #{operation.result()}"
  console.log "================================"

onErr = (err) ->
    console.log(err);
    return 1;

ask()


