ToggleView = require('views/toggle_view')
exampleSubjects = require('lib/examples')
ImageViewer = require('views/image_viewer')

class ExampleGuide extends ToggleView
  el: "#classification-guide"

  events: {
    "click .close" : "hide"
    "mouseover .example canvas" : "play"
    "mouseout .example canvas" : "pause"
    "mouseup .example" : "explode"
  }

  viewers: {}

  examples: ["good", "multiple", "empty", "galaxy", "nebula", "multi", "shift"]

  play: (ev) ->
    iv = @viewers[ev.target.parentNode.id]
    iv.model.set('loop', true)
    iv.model.play()

  pause: (ev) ->
    iv = @viewers[ev.target.parentNode.id]
    iv.model.pause()

  render: (ex) ->
    id = "#{ex}-example"
    iv = new ImageViewer({el: ("#" + id), controls: false})
    iv.setupSubject(exampleSubjects[ex])
    @viewers[id] = iv

  removeExample: ->
    _.each(@viewers, (v) -> v.undelegateEvents())
    @viewers = {}

  show: ->
    super
    _.each(@examples, @render, @)

  hide: ->
    super
    _.each(@examples, @removeExample, @)
    @trigger "hidden"




module.exports = ExampleGuide