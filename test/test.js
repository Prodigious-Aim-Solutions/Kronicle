(function() {
  var Kronicle, should;

  should = require('should');

  Kronicle = require('../build/Kronicle').Kronicle;

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
  });

}).call(this);
