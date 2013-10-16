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

        # https://github.com/mathjax/MathJax-docs/wiki/Integrating-mathjax-into-x%3A-require.js
        'cdn.mathjax':
          exports: 'MathJax'
          init: ->
            MathJax.Hub.Config
              config: ["MMLorHTML.js"]
              jax: ["input/TeX","input/MathML","input/AsciiMath","output/HTML-CSS","output/NativeMML"]
              extensions: ["tex2jax.js","mml2jax.js","asciimath2jax.js","MathMenu.js","MathZoom.js","Safe.js"]
              TeX: extensions: ["AMSmath.js","AMSsymbols.js","noErrors.js","noUndefined.js"]
              skipStartupTypeset: true
              delayStartupUntil: 'configured'
              messageStyle: 'none'
            MathJax.Hub.Configured()
            MathJax


    for k, v of paths
      if coreDeps.indexOf(k) > -1
        v = 'core.min'
      config.paths[k] = "#{path}/lib/dist/#{v}"

    config.paths['cdn.mathjax'] = 'https://c328740.ssl.cf1.rackcdn.com/mathjax/latest/MathJax.js?config=TeX-AMS-MML_SVG&amp;delayStartupUntil=configured'

    require.config config if require.config
    config.rawPaths = paths
    config.coreDeps = coreDeps
    config

