#define ['Routes', 'View', 'lodash'], (Routes, View, _) ->
class Core
    constructor: (args) ->
        routes = []
        views = []
        if !args or !args.dataSources?
            throw "Error: Kronicle requires a datasource."
        else
            if args.routes
                for route, view of args.routes
                    #newView = new View(view)
                    if _.contains(views, views.id)
                        existingView = _.find(views, view.id)
                        routes[route] = existingView
                    else
                        routes[route] = view
                        views[view.id] = view
                r = new Routes(routes: routes)
            if args.dataSources
                @dataSources = args.dataSources
        return @