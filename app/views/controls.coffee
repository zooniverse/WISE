class Controls extends Backbone.View
  template: require("templates/controls")
  initialize: ->
    @listenTo(@model, "change:animate", @reset)

  events:
    'click .play': 'play'
    'click .pause' : 'pause'
    'click .loop' : 'toggleLoop'

  reset: (m, a) ->
    unless a
      @$('.play').show()
      @$('.pause').hide()

  play: (e) ->
    @$('.play').hide()
    @$('.pause').show()
    @model.play()

  pause: (e) ->
    @$('.pause').hide()
    @$('.play').show()
    @model.pause()

  toggleLoop: (e) ->
    @$('.loop').toggleClass('active')
    @model.toggleLoop()

  render: ->
    @$el.append(@template())
    @

module.exports = Controls
