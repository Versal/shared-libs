define [], ->

  (path = 'cdn') ->
    config =
      coreDependencies: # Used in Gruntfile
        'cdn.jquery': 'lib/src/jquery-1.10.2'
        'cdn.backbone': 'lib/src/backbone-1.0.0'
        'cdn.marionette': 'lib/src/backbone.marionette-1.1.0'
        'cdn.underscore.mixins': 'lib/src/underscore.mixins'
        'cdn.underscore': 'lib/src/underscore-1.5.2'

      paths:
        'cdn.backbone':          "#{path}/lib/dist/core.min"
        'cdn.marionette':        "#{path}/lib/dist/core.min"
        'cdn.jquery':            "#{path}/lib/dist/core.min"
        'cdn.underscore':        "#{path}/lib/dist/core.min"
        'cdn.underscore.mixins': "#{path}/lib/dist/core.min"
        'cdn.processing':        "#{path}/lib/dist/processing-1.4.1"
        'cdn.raphael':           "#{path}/lib/dist/raphael-2.1.2"

        # Unfortunately stuck this way due to http://bugs.jqueryui.com/ticket/9381
        'cdn.jqueryui': "#{path}/lib/dist/jquery.ui-1.9.2"

        'cdn.mathjax': "https://c328740.ssl.cf1.rackcdn.com/mathjax/latest/MathJax.js?config=TeX-AMS-MML_SVG&amp;delayStartupUntil=configured"

      map:
        '*':
          'cdn.lodash': 'cdn.underscore'

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
              extensions: ["tex2jax.js","mml2jax.js","asciimath2jax.js","MathMenu.js","MathZoom.js"]
              TeX: extensions: ["AMSmath.js","AMSsymbols.js","noErrors.js","noUndefined.js"]
              skipStartupTypeset: true
              delayStartupUntil: 'configured'
              messageStyle: 'none'

            MathJax.Hub.Configured()

            MathJax

    require.config config if require.config

    config
