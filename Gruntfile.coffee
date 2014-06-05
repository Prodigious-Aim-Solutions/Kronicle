module.exports = (grunt) ->
     grunt.initConfig
        pkg: grunt.file.readJSON('package.json'),
        coffeelint:
            app: ['./src/*.coffee', './test/*.coffee']
            options:
                'indentation':
                    "level" : "error",
                    "value" : 4
        jsonlint:
            src: ['./kron.json', './bower.json', './package.json']
        concat:
            dist:
                src: ['./src/Routes.coffee', './src/View.coffee', './src/DataSource.coffee', './src/Core.coffee', './src/Kronicle.coffee'],
                dest: './.tmp/Kronicle.coffee'
        coffee:
            compile:
                files:
                    './build/Kronicle.js': './.tmp/Kronicle.coffee'
            test:
                files:
                    './test/test.js': './test/test.coffee'
        clean: 
            tmp: ['./.tmp']
            build: ['./build']
        mochaTest:
            test:
                options:
                    reporter: 'spec',
                    mocha: require('mocha')
            src: ['./test/test.js']
      grunt.loadNpmTasks('grunt-coffeelint')
      grunt.loadNpmTasks('grunt-jsonlint')
      grunt.loadNpmTasks('grunt-contrib-concat')
      grunt.loadNpmTasks('grunt-contrib-coffee')
      grunt.loadNpmTasks('grunt-contrib-clean')
      grunt.loadNpmTasks('grunt-mocha-test')
    
      grunt.registerTask('default', ['coffeelint', 'jsonlint', 'clean:build', 'concat', 'coffee', 'clean:tmp', 'coffee:test', 'mochaTest'])
    
      return