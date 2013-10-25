class Timeline extends Backbone.View
  el: '#timeline ul'
  template: require('templates/radio')

  events:
    'click input[type="radio"]' : 'scrub'

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

  render: (images) =>
    @$el.empty()
    for {wavelength}, index in images
      @$el.append @template
        band: @readableWavelengths[wavelength]
        index: index

    @$('li:first-child input').prop('checked', true)

  updateTimeline: (index) =>
    @$('input[checked="checked"]').removeProp('checked')
    @$("input[data-index=\"#{index}\"]").prop('checked', true)

  scrub: (e) =>
    @trigger 'scrub', e.target.dataset.index

module.exports = Timeline
