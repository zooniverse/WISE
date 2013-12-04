class Timeline extends Backbone.View
  el: '#timeline'
  readableWavelengths: require('lib/wavelength_keys')

  initialize: ->
    @names = _.values(@readableWavelengths)
    @listenTo(@model, "change:index", @updateTimeline)
    @range = @$('input')
    @currentWavelength = @$('p:NOT(.pull-left, .pull-right)')
    @updateTimeline(@model, @model.get('index'))

  events:
    'mousedown input' : 'startScrub'
    'touchdown input' : 'startScrub'

  updateTimeline: (m, index) ->
    @range.val(index)
    @currentWavelength.text(@names[index])

  startScrub: =>
    if parseInt(@range.val()) isnt @model.get('index')
      @model.set('index', parseInt(@range.val()))
    @$el.on('mousemove', @scrub)
    @$el.on('mosueup', @endScrub)
    @$el.on('touchmove', @scrub)
    @$el.on('touchup', @endScrub)

  endScrub: =>
    @$el.off('mousemove')
    @$el.off('mouseup')
    @$el.on('touchmove', @scrub)
    @$el.on('touchup', @endScrub)

  scrub: =>
    @model.set('index', parseInt(@range.val()))

module.exports = Timeline
