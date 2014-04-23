# #Welcome to Kronicle
# Kronicle is a HTML5 SPA used for blogging and content management

((exports) ->
    
    # Main Kronicle class
    class Kronicle
        # constructor: takes no arguments
        constructor: (args) ->
            # if a kron.json file is found, use it's configuration data in pkg
            if args?
                # check for the dataSources
                dsTypes = args.dataSources
                if dsTypes?
                        dataSources = dsTypes
                        # create new core instance, pass it routes and data source from configuration package
                        c = new Core(
                            routes: args.routes
                            dataSources: dataSources
                        )
                        return
            return
        # ##Expose Kronicle functinality publically
        # ###Core
        # Contains core Kronicle functionality
        @Core = Core
        # ###DataSource
        # This is the default data source for Kronicle, this should be overriden with a custom implementation for your platform
        @DataSource = DataSource
        # ###Routesx`
        # This is used for registering and handling routing
        @Routes = Routes
        # ###Views
        # This is used to create new Views.
        # Views handle all UI elements.
        @View = View
        

    exports.Kronicle = Kronicle
    #console.log "exports.Kronicle: #{ exports.Kronicle }"
) (if typeof exports is "undefined" then @ else exports)
    #return Kronicle
if typeof define is "function" and define.amd
  define "Kronicle", [], ->
    Kronicle

    