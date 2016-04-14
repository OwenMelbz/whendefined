(function() {
  window.whenDefined = function($context, $variable, $callback) {
    if ($context[$variable]) {
      $callback();
    } else {
      Object.defineProperty($context, $variable, {
        configurable: true,
        enumerable: true,
        writeable: true,
        get: function() {
          return this['_' + $variable];
        },
        set: function(val) {
          this['_' + $variable] = val;
          $callback();
        }
      });
    }
  };

}).call(this);
