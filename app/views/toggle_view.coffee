class ToggleView extends Backbone.View

  constructor: ->
    super
    @visible = false

  hide: ->
    @visible = false
    @$el.addClass('active')

  show: ->
    @visible = true 
    @$el.addClass('active')

  toggle: ->
    @visible = not @visible
    @$el.toggleClass('active')

module.exports = ToggleView
