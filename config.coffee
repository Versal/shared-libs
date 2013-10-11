define [], ->

  (path = 'cdn') ->
    # Core dependencies go here
    coreDeps = [
      'cdn.jquery'
      'cdn.underscore'
      'cdn.backbone'
      'cdn.marionette'
      'cdn.underscore.mixins'
    ]

    # Raw paths go here
    paths =
      'cdn.backbone': 'backbone-1.0.0'
      'cdn.marionette': 'backbone.marionette-1.1.0'
      'cdn.jquery': 'jquery-1.10.2'
      'cdn.processing': 'processing-1.4.1'
      'cdn.raphael': 'raphael-2.1.2'
      'cdn.underscore': 'underscore-1.5.2'
      'cdn.underscore.mixins': 'underscore.mixins'
      'cdn.jqueryui': 'jquery.ui-1.9.2' # Unfortunately stuck this way due to
                                        # http://bugs.jqueryui.com/ticket/9381

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
          deps: ['cdn.underscore.mixins']
          init: (mixins) -> _.mixin mixins

        'cdn.jqueryui':
          deps: ['cdn.jquery']
          exports: '$'


    for k, v of paths
      if coreDeps.indexOf(k) > -1
        v = 'core.min'
      config.paths[k] = "#{path}/lib/dist/#{v}"

    if typeof window != "undefined" && window.location.protocol == "https:"
      mathjax = "https://c328740.ssl.cf1.rackcdn.com/mathjax/latest/MathJax.js?config=TeX-MML-AM_HTMLorMML.js"
    else
      mathjax = "http://cdn.mathjax.org/mathjax/2.0-latest/MathJax.js?config=TeX-MML-AM_HTMLorMML.js"
    config.paths['cdn.mathjax'] = mathjax

    require.config config if require.config
    config.rawPaths = paths
    config.coreDeps = coreDeps
    config

