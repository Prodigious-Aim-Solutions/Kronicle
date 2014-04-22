module.exports = (grunt) ->
     grunt.initConfig
        pkg: grunt.file.readJSON('package.json'),
        concat:
            dist:
                src: ['./src/View.coffee', './src/Routes.coffee', './src/DataSource.coffee', './src/Core.coffee', './src/Kronicle.coffee'],
                dest: './.tmp/Kronicle.coffee'
        coffee:
            compile:
                files:
                    './build/Kronicle.js': './.tmp/Kronicle.coffee'
      grunt.loadNpmTasks('grunt-contrib-concat')
      grunt.loadNpmTasks('grunt-contrib-coffee')
    
      grunt.registerTask('default', ['concat', 'coffee']);
    
      return