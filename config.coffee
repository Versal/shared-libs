require.config
  baseUrl: 'lib'
  paths:
    'cdn.backbone': 'backbone-1.0.0'
    'cdn.marionette': 'backbone.marionette-1.0.2'
    'cdn.jquery': 'jquery-1.9.1'
    'cdn.lodash': 'lodash-1.1.1'
    'cdn.processing': 'processing-1.4.1'
    'cdn.raphael': 'raphael-2.1.0'
    'cdn.underscore': 'underscore-1.4.4'

  shim:
    'cdn.backbone':
      deps: ['cdn.underscore', 'cdn.jquery']
      exports: 'Backbone'

    'cdn.marionette':
      deps: ['cdn.backbone']
      exports: 'Backbone.Marionette'

    'cdn.jquery':
      exports: '$'

    'cdn.lodash':
      exports: '_'

    'cdn.processing':
      exports: 'Processing'

    'cdn.raphael':
      exports: 'Raphael'

    'cdn.underscore':
      exports: '_'
