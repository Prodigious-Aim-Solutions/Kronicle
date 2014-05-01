#define () ->

class View
    constructor: (el) ->
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
    show: () =>
        @$el.show()
        return
    hide: () =>
        @$el.hide()
        return
    initialize: () ->
        return @
