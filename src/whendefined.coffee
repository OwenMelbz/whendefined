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