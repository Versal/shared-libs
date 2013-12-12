define([], function() {
  var cloneDeep = function (obj) {
    if (console && console.warn)
      console.warn('_.cloneDeep is not part of underscore and will be deprecated');
    if (obj === null || typeof obj !== 'object') return obj;

    var tmp = obj.constructor();

    for (var k in obj) {
      tmp[k] = cloneDeep(obj[k]);
    }
    return tmp;
  };

  return {
    cloneDeep: cloneDeep
  };
});
