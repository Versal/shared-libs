define [], ->

  (path = 'cdn') ->
    # Core dependencies go here
    coreDeps = [
      'cdn.jquery'
      'cdn.underscore'
      'cdn.backbone'
      'cdn.marionette'
    ]

    # Raw paths go here
    paths =
      'cdn.backbone': 'backbone-1.0.0'
      'cdn.marionette': 'backbone.marionette-1.0.2'
      'cdn.jquery': 'jquery-1.9.1'
      'cdn.processing': 'processing-1.4.1'
      'cdn.raphael': 'raphael-2.1.0'
      'cdn.underscore': 'underscore-1.5.2'
      'cdn.jqueryui': 'jquery.ui-1.9.2'

    aliases =
      'cdn.lodash': 'cdn.underscore'

    config =
      paths: {} # set by paths / rawdeps above
      map: '*': aliases
      shim:
        'cdn.backbone':
          deps: ['cdn.underscore', 'cdn.jquery']
          exports: 'Backbone'

        'cdn.marionette':
          deps: ['cdn.backbone']
          exports: 'Backbone.Marionette'

        'cdn.jquery':
          exports: '$'

        'cdn.processing':
          exports: 'Processing'

        'cdn.raphael':
          exports: 'Raphael'

        'cdn.underscore':
          exports: '_'

        'cdn.jqueryui':
          deps: ['cdn.jquery']
          exports: '$'


    for k, v of paths
      if coreDeps.indexOf(k) > -1
        v = 'core.min'
      config.paths[k] = "#{path}/lib/#{v}"

    if typeof window != "undefined" && window.location.protocol == "https:"
      path = "https://c328740.ssl.cf1.rackcdn.com/mathjax/latest/MathJax.js?config=TeX-MML-AM_HTMLorMML.js"
    else
      path = "http://cdn.mathjax.org/mathjax/2.0-latest/MathJax.js?config=TeX-MML-AM_HTMLorMML.js"
    config.paths['cdn.mathjax'] =  path

    require.config config if require.config
    config.rawPaths = paths
    config.coreDeps = coreDeps
    config

