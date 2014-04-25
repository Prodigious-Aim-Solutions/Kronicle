class Core
    constructor: (args) ->
        @routes = {}
        @views = {}
        if !args or !args.dataSources?
            throw new Error("Error: Kronicle requires a datasource.")
        else
            if args.routes
                for route, view of args.routes
                    #newView = new View(view)
                    if @views.length and _.contains(@views, view.id)
                        existingView = _.find(@views, view.id)
                        @routes[route] = existingView
                    else
                        @routes[route] = view
                        @views[view.id] = view
                r = new Routes(routes: @routes)
            if args.dataSources
                @dataSources = args.dataSources
        return @