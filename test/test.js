(function() {
  var Kronicle, should, _;

  should = require('should');

  Kronicle = require('../build/Kronicle').Kronicle;

  _ = require('lodash');

  describe('Kronicle', function() {
    it('should have a property Core', function() {
      Kronicle.should.have.property('Core');
    });
    it('should have a property DataSource', function() {
      Kronicle.should.have.property('DataSource');
    });
    it('should have a property View', function() {
      Kronicle.should.have.property('View');
    });
    it('should have a property Routes', function() {
      Kronicle.should.have.property('Routes');
    });
    it('should have a property Component', function() {
      return Kronicle.should.have.property('Component');
    });
  });

  describe('Kronicle Core', function() {
    var testCore;
    testCore = new Kronicle.Core({
      dataSources: [[]]
    });
    it('should contain an array of views', function() {
      testCore.should.have.property('views');
    });
    it('should contain an array of routes', function() {
      testCore.should.have.property('routes');
    });
    it('should contain an object dataSources', function() {
      return testCore.should.have.property('dataSources');
    });
  });

  describe('Kronicle.DataSource', function() {
    var dataSource;
    dataSource = new Kronicle.DataSource();
    it('should contain an object source', function() {
      dataSource.should.have.property('_source');
    });
  });

  describe('Kronicle.View', function() {
    var view;
    view = new Kronicle.View();
    it('should contain an object dataSources', function() {
      view.should.have.property('dataSources');
    });
    it('should contain an array components', function() {
      view.should.have.property('components');
    });
    it('should allow components to be accessed by id', function() {
      view.addComponent(new Kronicle.Component('testCom'));
      view.components['testCom'].should.exist;
    });
    it('should contain an object $el', function() {
      view.should.have.property('$el');
    });
    it('should contain an object id', function() {
      view.should.have.property('id');
    });
  });

}).call(this);
