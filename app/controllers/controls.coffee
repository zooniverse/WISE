{Controller} = require 'spine'

class Controls extends Controller
  events:
    'click .play': 'play'
    'click .pause' : 'pause'
    'click .loop' : 'toggleLoop'

  loop: false
   
  reset: =>
    @$('.play.big').show()
    @$('.play.small, .pause').hide()

  play: (e) =>
    @$('.play').hide()
    @$('.pause').show()
    @trigger 'play'

  pause: (e) =>
    @$('.pause').hide()
    @$('.play.small').show()
    @trigger 'pause'

  toggleLoop: (e) =>
    @loop = !@loop
    if @loop
      @$('.badge').text('∞')
    else
      @$('.badge').text('1')

module.exports = Controls
