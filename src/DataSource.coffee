#define ['PubSub'], (PubSub) ->

class DataSource
    constructor: (@_source = {}) ->
        return @
    login: (user, pass, cb) =>
        @_source.login user, pass
        return
    create: (item, cb)  =>
        @_source.create(item, cb)
    update: (item, cb) =>
        @source.update(item, cb)
    remove: (item, cb) =>
        @_source.remove(item, cb)
    get: (item, cb) =>
        if item and cb
            return @_source.get(item, cb)
        else if cb and !item
            return @_source.getAll(cb)
            