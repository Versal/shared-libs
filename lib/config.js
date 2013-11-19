(function() {
  var aliases, config;

  aliases = {
    'cdn.lodash': 'cdn.underscore',
    'cdn.mustache': 'cdn.hogan'
  };

  config = {
    waitSeconds: 120,
    paths: {
      'cdn.backbone': 'lib/core.min',
      'cdn.marionette': 'lib/core.min',
      'cdn.jquery': 'lib/core.min',
      'cdn.underscore': 'lib/core.min',
      'cdn.underscore.mixins': 'lib/core.min',
      'cdn.processing': 'lib/processing-1.4.1',
      'cdn.raphael': 'lib/raphael-2.1.2',
      'cdn.hogan': 'lib/hogan-2.0.0',
      'cdn.jqueryui': 'lib/jquery.ui-1.9.2',
      'cdn.mathjax': 'https://c328740.ssl.cf1.rackcdn.com/mathjax/latest/MathJax.js?config=TeX-AMS-MML_SVG&amp;delayStartupUntil=configured',
      'cdn.youtube': 'https://www.youtube.com/iframe_api?'
    },
    map: {
      '*': aliases
    },
    shim: {
      'cdn.backbone': {
        deps: ['cdn.underscore', 'cdn.jquery'],
        exports: 'Backbone'
      },
      'cdn.marionette': {
        deps: ['cdn.backbone'],
        exports: 'Backbone.Marionette'
      },
      'cdn.jquery': {
        exports: '$'
      },
      'cdn.underscore': {
        exports: '_',
        deps: ['cdn.underscore.mixins'],
        init: function(mixins) {
          return _.mixin(mixins);
        }
      },
      'cdn.processing': {
        exports: 'Processing'
      },
      'cdn.raphael': {
        exports: 'Raphael'
      },
      'cdn.jqueryui': {
        deps: ['cdn.jquery'],
        exports: '$'
      },
      'cdn.mathjax': {
        exports: 'MathJax',
        init: function() {
          MathJax.Hub.Config({
            config: ["MMLorHTML.js"],
            jax: ["input/TeX", "input/MathML", "input/AsciiMath", "output/HTML-CSS", "output/NativeMML"],
            extensions: ["tex2jax.js", "mml2jax.js", "asciimath2jax.js", "MathMenu.js", "MathZoom.js", "Safe.js"],
            TeX: {
              extensions: ["AMSmath.js", "AMSsymbols.js", "noErrors.js", "noUndefined.js"]
            },
            SVG: {
              scale: 110,
              blacker: 2
            },
            skipStartupTypeset: true,
            delayStartupUntil: 'configured',
            messageStyle: 'none'
          });
          MathJax.Hub.Configured();
          return MathJax;
        }
      },
      'cdn.hogan': {
        exports: 'Hogan'
      },
      'cdn.youtube': {
        exports: 'YT',
        deps: ['cdn.jquery'],
        init: function() {
          var dfd;
          dfd = $.Deferred();
          window.onYouTubeIframeAPIReady = function() {
            return dfd.resolve(YT);
          };
          return dfd;
        }
      }
    }
  };

  if (typeof window !== 'undefined' && typeof (typeof require !== "undefined" && require !== null ? require.config : void 0) === 'function') {
    require.config(config);
  }

}).call(this);
