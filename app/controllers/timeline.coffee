{Controller} = require 'spine'
radioTemplate = require 'views/radio'

class Timeline extends Controller
  events: 
    'click input[type="radio"]' : 'scrub'

  readableWavelengths:
    'dssdss2blue': 'DSS2 Blue'
    'dssdss2red': 'DSS2 Red'
    'dssdss2ir': 'DSS2 IR'
    '2massj': '2MASS J'
    '2massh': '2MASS H'
    '2massk' : '2MASS K'
    'wise1' : 'WISE 1'
    'wise2' : 'WISE 2'
    'wise3' : 'WISE 3'
    'wise4' : 'WISE 4'

  render: (images) =>
    @$el.empty()
    for {wavelength}, index in images 
      @$el.append radioTemplate
        band: @readableWavelengths[wavelength]
        index: index

    @$('li:first-child input').prop('checked', true)

  updateTimeline: (index) =>
    @$('input[checked="checked"]').removeProp('checked')
    @$("input[data-index=\"#{index}\"]").prop('checked', true)

  scrub: (e) =>
    @trigger 'scrub', e.target.dataset.index

module.exports = Timeline
