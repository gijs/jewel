/*global module:false*/
module.exports = function(grunt) {

  // Project configuration.
  grunt.initConfig({
    meta: {
      version: '0.1.0',
      banner: '/*! Jewel - v<%= meta.version %> - ' +
        '<%= grunt.template.today("yyyy-mm-dd") %>\n' +
        '* http://github.com/vdemedes/jewel/\n' +
        '* Copyright (c) <%= grunt.template.today("yyyy") %> ' +
        'Vadim Demedes; Licensed MIT */'
    },
    concat: {
      dist: {
        src: ['<banner:meta.banner>', '<file_strip_banner:lib/jewel.js>'],
        dest: 'dist/jewel.js'
      }
    },
    min: {
      dist: {
        src: ['<banner:meta.banner>', '<config:concat.dist.dest>'],
        dest: 'dist/jewel.min.js'
      }
    },
	watch: {
		scripts: {
			files: ['lib/jewel.js'],
			tasks: 'concat min'
		}
	},
    uglify: {}
  });

  // Default task.
  grunt.registerTask('default', 'concat min');
};
