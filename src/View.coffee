#define () ->
(exports) ->
    
    class View
        constructor: (el) ->
            if !el?
                throw "Error: Must pass view a DOM element."
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
        
    return

exports.View = View
(if typeof exports is "undefined" then @["View"] = {} else exports)
    
if typeof define is "function" and define.amd
  define "View", [], ->
    View