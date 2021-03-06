module.exports = (grunt) ->
  [
    'grunt-contrib-clean'
    'grunt-contrib-coffee'
    'grunt-contrib-requirejs'
    'grunt-contrib-uglify'
  ].forEach grunt.loadNpmTasks

  grunt.initConfig
    clean:
      files: 'lib/**/*.*'

    coffee:
      config:
        src: 'src/config.coffee'
        dest: 'lib/config.js'

    requirejs:
      'core.min':
        options:
          mainConfigFile: './lib/config.js'
          cjsTranslate: true
          optimize: 'uglify2'

          paths:
            'cdn.jquery': 'src/jquery-1.10.2'
            'cdn.underscore': 'src/underscore-1.6.0'
            'cdn.backbone': 'src/backbone-1.0.0'
            'cdn.marionette': 'src/backbone.marionette-1.1.0'
            'cdn.underscore.mixins': 'src/underscore.mixins'

          include: [
            'cdn.jquery'
            'cdn.underscore'
            'cdn.backbone'
            'cdn.marionette'
            'cdn.underscore.mixins'
          ]

          shim:
            'cdn.backbone':
              deps: ['cdn.underscore', 'cdn.jquery']
              exports: 'Backbone'

            'cdn.marionette':
              deps: ['cdn.backbone']
              exports: 'Backbone.Marionette'

            'cdn.jquery':
              exports: '$'

            'cdn.underscore':
              exports: '_'
              deps: ['cdn.underscore.mixins']
              init: (mixins) -> _.mixin mixins

            'cdn.processing':
              exports: 'Processing'

            'cdn.raphael':
              exports: 'Raphael'

          out: 'lib/core.min.js'

    uglify:
      options:
        mangle: true
        report: true

      config:
        files:
          'lib/config.js': ['lib/config.js']

      libs:
        expand: true
        flatten: true
        src: 'src/*.js'
        dest: 'lib/'

  grunt.registerTask 'default', ['clean', 'coffee', 'requirejs', 'uglify']
