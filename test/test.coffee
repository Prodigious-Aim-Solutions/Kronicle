should = require('should')
Kronicle = require('../build/Kronicle').Kronicle
_ = require('lodash')

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
    it 'should have a property Component', ->
        Kronicle.should.have.property('Component')
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
    it 'should contain an object dataSources', ->
        testCore.should.have.property('dataSources')
    return

describe 'Kronicle.DataSource', ->
    dataSource = new Kronicle.DataSource()
    it 'should contain an object source', ->
        dataSource.should.have.property('_source')
        return
    return

#describe 'Kronicle.Routes', ->
#    router = new Kronicle.Routes(
#        routes:
#            '/': () -> return
#    )
#    it 'should contain an object router', ->
#        router.should.have.property('router')
#        return
#    return

describe 'Kronicle.View', ->
    view = new Kronicle.View()
    it 'should contain an object dataSources', ->
        view.should.have.property('dataSources')
        return
    it 'should contain an array components', ->
        view.should.have.property('components')
        return
    it 'should allow components to be accessed by id', ->
        view.addComponent(new Kronicle.Component('testCom'))
        view.components['testCom'].should.exist
        return
    it 'should contain an object $el', ->
        view.should.have.property('$el')
        return
    it 'should contain an object id', ->
        view.should.have.property('id')
        return
    return

#describe 'Kronicle Component', ->
    
