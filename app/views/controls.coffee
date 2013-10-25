class Controls extends Backbone.View
  el: '#canvas-container'

  events:
    'click #play': 'play'
    'click #pause' : 'pause'
    'click #loop' : 'toggleLoop'

  loop: false
   
  reset: =>
    @$('#play').show()
    @$('#pause').hide()

  play: (e) =>
    @$('#play').hide()
    @$('#pause').show()
    @trigger 'play'

  pause: (e) =>
    @$('#pause').hide()
    @$('#play').show()
    @trigger 'pause'

  toggleLoop: (e) =>
    @loop = not @loop
    @$('#loop').toggleClass('active')

module.exports = Controls
