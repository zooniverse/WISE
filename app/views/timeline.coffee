class Timeline extends Backbone.View
  el: '#timeline'
  template: require('templates/radio')

  initialize: ->
    @names = _.values(@readableWavelengths)
    @listenTo(@model, "change:index", @updateTimeline)
    @range = @$('input')
    @currentWavelength = @$('p:NOT(.pull-left, .pull-right)')
    @updateTimeline(@model, @model.get('index'))

  events:
    'mousedown input' : 'startScrub'

  readableWavelengths:
    'dssdss2blue': 'DSS2 Blue (0.665 μm)'
    'dssdss2red': 'DSS2 Red (0.975 μm)'
    'dssdss2ir': 'DSS2 IR (1.15 μm)'
    '2massj': '2MASS J (1.24 μm)'
    '2massh': '2MASS H (1.66 μm)'
    '2massk' : '2MASS K (2.16 μm)'
    'wise1' : 'WISE 1 (3.4 μm)'
    'wise2' : 'WISE 2 (4.6 μm)'
    'wise3' : 'WISE 3 (12 μm)'
    'wise4' : 'WISE 4 (22 μm)'

  updateTimeline: (m, index) ->
    @range.val(index)
    @currentWavelength.text(@names[index])

  startScrub: =>
    @$el.on('mousemove', @scrub)
    @$el.on('mosueup', @endScrub)

  endScrub: =>
    @$el.off('mousemove')
    @$el.off('mouseup')

  scrub: =>
    @model.set('index', parseInt(@range.val()))
    


module.exports = Timeline
