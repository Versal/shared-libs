define [], ->
  (path='cdn') ->
    require.config
      paths:
        'cdn.backbone': "#{path}/lib/backbone-1.0.0"
        'cdn.marionette': "#{path}/lib/backbone.marionette-1.0.2"
        'cdn.jquery': "#{path}/lib/jquery-1.9.1"
        'cdn.lodash': "#{path}/lib/lodash-1.1.1"
        'cdn.processing': "#{path}/lib/processing-1.4.1"
        'cdn.raphael': "#{path}/lib/raphael-2.1.0"
        'cdn.underscore': "#{path}/lib/underscore-1.4.4"
        'cdn.jqueryui': "#{path}/lib/jquery.ui-1.10.2"

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

        'cdn.jqueryui':
          deps: ['cdn.jquery']
          exports: '$'

