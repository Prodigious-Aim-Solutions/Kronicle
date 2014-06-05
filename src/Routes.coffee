#define ['PubSub'], (PubSub) ->
    
class Routes
    constructor: (args) ->
        if args
            if args.routes
                @_registerRoutes(args.routes)
        return
    _registerRoutes: (routes) =>
        funRoutes = {}
        _.forIn(routes, (obj, route) ->
            obj.initialize()
            funRoutes[route] = obj.show
           )
        @router = new Router(funRoutes)
        @router.configure(before: () -> $("section").hide())
        @router.init()
        @_addEvents(route, view) for route, view of routes
        return @
    _addEvents:(route, view) =>
        @router.on(route, () ->
            PubSub.publish('kronRoute:#{route}', route)
            return
            )
        return @
