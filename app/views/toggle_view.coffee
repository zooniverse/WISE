class ToggleView extends Backbone.View
  constructor: ->
    super
    @visible = false

  _keydispatch: (events) -> 
    events = _.chain(events)
      .reduce(((m, v, k) -> 
        m.concat(_.map(k.split(" "), ((k) -> [k, _.bind(@[v], @)]), @))
      ), [], @)
      .object()
      .value()
    (ev) -> 
      return if ev.target.tagName is 'INPUT'
      if ev.keyCode is 13
        key = "enter"
      else if ev.which is 32
        ev.preventDefault()
        key = "space"
      else if ev.keyCode is 38
        ev.preventDefault()
        key = "up"
      else if ev.keyCode is 40
        ev.preventDefault()
        key = "down"
      else
        key = String.fromCharCode(ev.charCode)
      if events[key]?
        events[key](ev, key)

  delegateKeyEvents: ->
    $(document).on("keypress", @_keydispatch(@keyboardEvents))

  undelegateKeyEvents: ->
    $(document).off("keypress")

  hide: ->
    @undelegateKeyEvents() if @keyboardEvents?
    @visible = false
    @$el.removeClass('active')
    @trigger("hidden")

  show: ->
    @delegateKeyEvents() if @keyboardEvents?
    @visible = true 
    @$el.addClass('active')
    @trigger("shown")

  toggle: ->
    if @visible then @hide() else @show()

module.exports = ToggleView
