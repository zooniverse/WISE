class ToggleView extends Backbone.View

  constructor: ->
    super
    @visible = false

  hide: ->
    @visible = false
    @$el.removeClass('active')

  show: ->
    @visible = true 
    @$el.addClass('active')

  toggle: ->
    if @visible then @hide() else @show()

module.exports = ToggleView
