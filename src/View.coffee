#define () ->

class View
    dataSources: {}
    components: []
    constructor: (el) ->
        if window?
            if !el?
                throw new Error("Error: Must pass view a DOM element.")
            else if typeof el == 'string'
                domEl = document.getElementById(el)
                if !domEl then domEl = document.getElementsByClassName(el)[0]
                @$el = $(domEl)
                @id = el
            else
                @$el = $(el)
                @id = el.id or el.className
        else
            ##TODO: replace this with a proper view generator for server side
            @$el =
                show: () -> return,
                hide: () -> return
            @id = ""
    show: () =>
        @$el.show()
        return
    hide: () =>
        @$el.hide()
        return
    initialize: () ->
        return @
    addComponent: (component) =>
        #@components.push(component)
        if @components[component.id] == undefined
            @components[component.id] = component
        else
            throw new Error("Error: A component with id already exits in view")
        component.dataSources = @dataSources
        return @
