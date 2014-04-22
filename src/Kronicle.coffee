# #Welcome to Kronicle
# Kronicle is a HTML5 SPA used for blogging and content management

(exports) ->
    
    # Main Kronicle class
    class Kronicle
        # constructor: takes no arguments
        constructor: () ->
            # if a kron.json file is found, use it's configuration data in pkg
            if pkg?
                # check for the dataSource
                dsType = pkg.dataSource
                if dsType?
                    require ["../app/DataSource/#{ dsType }"], (dsType) ->
                        dataSource = dsType
                        # create new core instance, pass it routes and data source from configuration package
                        c = new Core(
                            routes: pkg.routes
                            dataSource: dataSource
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
        
    return

    exports.Kronicle = Kronicle
(if typeof exports is "undefined" then @["Kronicle"] = {} else exports)
    #return Kronicle
if typeof define is "function" and define.amd
  define "Kronicle", [], ->
    Kronicle

    