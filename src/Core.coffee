#define ['Routes', 'View', 'lodash'], (Routes, View, _) ->
(exports) ->
    class Core
        constructor: (args) ->
            routes = []
            views = []
            if !args or !args.dataSource?
                throw "Error: Kronicle requires a datasource."
            else
                if args.routes
                    for route, view of args.routes
                        newView = new View(view)
                        if _.contains(views, newView.id)
                            existingView = _.find(views, newView.id)
                            routes[route] = existingView
                        else
                            routes[route] = newView
                            views[newView.id] = newView
                    r = new Routes(routes: routes)
            return @
        
    return

exports.Core = Core
(if typeof exports is "undefined" then @["Core"] = {} else exports)
    
if typeof define is "function" and define.amd
  define "Core", [], ->
    Core