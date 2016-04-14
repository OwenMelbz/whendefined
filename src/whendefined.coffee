#
# Inspired by http://fokkezb.nl/2016/04/14/how-to-wait-for-a-javascript-variable-to-be-defined/
#

window.whenDefined = ($context, $variable, $callback) ->
  if $context[$variable]
    $callback()
  else
    Object.defineProperty $context, $variable,
      configurable: true
      enumerable: true
      writeable: true
      get: ->
        @['_' + $variable]
      set: (val) ->
        @['_' + $variable] = val
        $callback()
        return
  return