module.exports = (grunt) ->
  grunt.initConfig {
    coffee: {
      compile: {
        options: {
          bare: true
        }
        files: {
          'src/main.js': 'src/main.coffee'
        }
      }
    }
    mochaTest: {
      test: {
        options: {
          reporter: 'spec'
          colors: true
          require: [
            'coffee-script'
            'coffee-script/register'
            'test/test_helper.coffee'
          ]
        }
        src: [ 'test/*.coffee' ]
      }
    }
    coffeelint: {
      src: {
        files: {
          src: [ 'src/*.coffee' ]
        }
      }
      test: {
        files: {
          src: [ 'test/*.coffee' ]
        }
      }
      buildTools: {
        files: {
          src: [ 'Gruntfile.coffee' ]
        }
      }
      options: {
        configFile: 'coffeelint.json'
      }
    }
    docco: {
      debug: {
        src: [ 'src/*.coffee', 'test/*.coffee']
        options: {
          output: 'docs/'
        }
      }
    }
    mocha_istanbul: {
      coveralls: {
        src: 'test'
        options: {
          coverage: true
          check: {
            lines: 50
            statements: 50
            funtions: 50
          }
          root: './src'
          reportFormats: ['lcovonly', 'html']
        }
      }
    }
  }

  grunt.loadNpmTasks 'grunt-mocha-test'
  grunt.loadNpmTasks 'grunt-coffeelint'
  grunt.loadNpmTasks 'grunt-contrib-coffee'
  grunt.loadNpmTasks 'grunt-docco'
  grunt.loadNpmTasks 'grunt-mocha-istanbul'

  grunt.registerTask 'docs', ['docco']
  grunt.registerTask 'coveralls', ['mocha_istanbul:coveralls']
  grunt.registerTask 'test', ['coffeelint', 'coffee', 'coveralls']
  grunt.registerTask 'default', ['test', 'docs']
  grunt.registerTask 'travis', ['default', 'coveralls']

  grunt.event.on 'coverage', (lcov, done) ->
    require('coveralls').handleInput lcov, (err) ->
      if (err?)
        return done(err)
      do done
