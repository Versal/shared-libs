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

  relativePaths = {}
  for k, v of config.rawPaths
    relativePaths[k] = "lib/#{v}"

  grunt.initConfig
    coffee:
      config:
        src: ['config.coffee']
        dest: 'config.js'

    requirejs:
      dist:
        options:
          mainConfigFile: './config.js'
          optimize: 'none'
          include: config.coreDeps
          paths: relativePaths
          shim: config.shim
          out: 'lib/core.min.js'

    uglify:
      options:
        mangle: true
        report: true
        preserveComments: true

      config:
        files:
          'config.js': ['config.js']

    list:
      options:
        basePath: '/path/to'

  grunt.registerTask 'default', ['coffee', 'requirejs', 'uglify', 'list']

