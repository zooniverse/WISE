class Timeline extends Backbone.View
  el: '#timeline'
  template: require('templates/radio')

  initialize: ->
    @nos = _.values(@wavelengthNos)
    @names = _.values(@readableWavelengths)
    @listenTo(@model, "change:index", @updateTimeline)
    @range = @$('input')
    @currentWavelength = @$('p')
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

  wavelengthNos: 
    'dssdss2blue': 0.6 
    'dssdss2red': 0.9 
    'dssdss2ir': 1.1
    '2massj': 1.2
    '2massh': 1.6
    '2massk' : 2.1
    'wise1' : 3.4
    'wise2' : 4.6
    'wise3' : 12
    'wise4' : 22

  updateTimeline: (m, index) ->
    @range.val(@nos[index])
    @currentWavelength.text(@names[index])

  startScrub: =>
    @$el.on('mousemove', @scrub)
    @$el.on('mosueup', @endScrub)

  endScrub: =>
    @$el.off('mousemove')
    @$el.off('mouseup')

  closeTo: (val) =>
    (wave, index) =>
      next = if index + 1 >= @nos.length then -1 else @nos[index+1]
      prev = if index - 1 < 0 then -1 else @nos[index-1]
      ((prev is -1) or (val > ((wave + prev) / 2))) and
        ((next is -1) or (val < ((wave + next) / 2)))

  scrub: =>
    value = _.find(@nos, @closeTo(parseFloat(@range.val())))
    @range.val(value)
    @model.set('index', _.indexOf(@nos, value))
    


module.exports = Timeline
