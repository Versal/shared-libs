_ = require 'underscore'

configurator = null
global.define = (deps, method) ->
  configurator = method()
require './config.coffee'

module.exports = (grunt) ->

  [
    'grunt-contrib-coffee'
    'grunt-contrib-requirejs'
    'grunt-contrib-uglify'
  ].forEach grunt.loadNpmTasks

  grunt.registerTask 'list', 'List paths in generated config', ->
    fields = configurator()
    console.log paths: fields.paths, shim: fields.shim

  config = configurator 'lib'

  grunt.initConfig
    coffee:
      config:
        src: ['config.coffee']
        dest: 'config.js'

    requirejs:
      dist:
        options:
          mainConfigFile: './config.js'
          optimize: 'uglify2'
          include: _.keys(config.coreDependencies)
          paths: config.coreDependencies
          shim: config.shim
          out: 'lib/dist/core.min.js'

    uglify:
      options:
        mangle: true
        report: true

      config:
        files:
          'config.js': ['config.js']

      libs:
        expand: true
        flatten: true
        src: ['lib/src/*.js']
        dest: 'lib/dist/'

    list:
      options:
        basePath: '/path/to'

  grunt.registerTask 'default', ['coffee', 'requirejs', 'uglify', 'list']

