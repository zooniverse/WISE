class Timeline extends Backbone.View
  el: '#timeline'
  wavelengths: require('lib/wavelength_keys')

  initialize: ->
    @listenTo(@model, "change:index", @updateTimeline)
    @range = @$('input')
    @currentWavelength = @$('p:NOT(.pull-left, .pull-right)')
    @updateTimeline(@model, @model.get('index'))

  events:
    'mousedown input' : 'startScrub'
    'touchdown input' : 'startScrub'

  updateTimeline: (m, index) ->
    max = m.get('max')
    if parseInt(@range.attr('max')) isnt max
      @range.attr('max', max - 1)
    @range.val(index)
    @currentWavelength.text(@wavelengths[m.currentImage()?.wavelength])

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
    @$el.off('touchmove')
    @$el.off('touchup')

  scrub: =>
    @model.set('index', parseInt(@range.val()))

module.exports = Timeline
