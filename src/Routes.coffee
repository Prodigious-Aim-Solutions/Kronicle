#define ['PubSub'], (PubSub) ->
(exports) ->
    
    class Routes
        constructor: (args) ->
            if args
                if args.routes
                    @_registerRoutes(args.routes)
            return
        _registerRoutes: (routes) =>
            funRoutes = {}
            _.forIn(routes, (obj, route) -> funRoutes[route] = obj.show)
            @router = new Router(funRoutes)    
            @router.configure(before: () => $(".row > div").hide())
            @router.init()
            @_addEvents(route, view) for route, view of routes
            return @
        _addEvents:(route, view) =>
            @router.on(route, () => 
                       PubSub.publish('kronRoute', route)
                       return
                       )
            return @
        
    return

exports.Routes = Routes
(if typeof exports is "undefined" then @["Routes"] = {} else exports)
    
if typeof define is "function" and define.amd
  define "Routes", [], ->
    Routes