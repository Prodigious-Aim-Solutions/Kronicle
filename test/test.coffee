blanket = require('blanket')
should = require('should')
Kronicle = require('../build/Kronicle').Kronicle

describe 'Kronicle', ->
    it 'should have a property Core', ->
        Kronicle.should.have.property('Core')
        return
    it 'should have a property DataSource', ->
        Kronicle.should.have.property('DataSource')
        return
    it 'should have a property View', ->
        Kronicle.should.have.property('View')
        return
    it 'should have a property Routes', ->
        Kronicle.should.have.property('Routes')
        return
    return

describe 'Kronicle Core', ->
    testCore = new Kronicle.Core(dataSources: [[]])
    ## add dataSources test
    it 'should contain an array of views', ->
        testCore.should.have.property('views')
        return
    it 'should contain an array of routes', ->
        testCore.should.have.property('routes')
        return
    return
