define [], ->

  (path = 'cdn') ->
    # Core dependencies (packaged into a single bundle in the Gruntfile)
    coreDeps = [
      'cdn.jquery'
      'cdn.underscore'
      'cdn.backbone'
      'cdn.marionette'
      'cdn.underscore.mixins'
    ]

    # Raw paths to dependencies, optionally with a remote location
    paths =
      'cdn.backbone':
        local: 'backbone-1.0.0'
      'cdn.marionette':
        local: 'backbone.marionette-1.1.0'
      'cdn.jquery':
        local: 'jquery-1.10.2'
      'cdn.processing':
        remote: '//cdnjs.cloudflare.com/ajax/libs/processing.js/1.4.1/processing-api.min'
        local: 'processing-1.4.1'
      'cdn.raphael':
        local:'raphael-2.1.2'
      'cdn.underscore':
        local: 'underscore-1.5.2'
      'cdn.underscore.mixins':
        local: 'underscore.mixins'
      'cdn.jqueryui':
        local: 'jquery.ui-1.9.2' # Unfortunately stuck on 1.9.2 due to
                                 # http://bugs.jqueryui.com/ticket/9381

    aliases =
      'cdn.lodash': 'cdn.underscore'

    config =
      waitSeconds: 120
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
      localName = if coreDeps.indexOf(k) > -1 then 'core.min' else v.local
      localPath = "#{path}/lib/dist/#{localName}"
      config.paths[k] = if v.remote then [v.remote, localPath] else localPath

    config.paths['cdn.mathjax'] = 'https://c328740.ssl.cf1.rackcdn.com/mathjax/latest/MathJax.js?config=TeX-AMS-MML_SVG&amp;delayStartupUntil=configured'

    require.config config if require.config
    config.rawPaths = paths
    config.coreDeps = coreDeps
    config

