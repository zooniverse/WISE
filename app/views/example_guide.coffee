ToggleView = require('views/toggle_view')
exampleSubjects = require('lib/examples')
ImageViewer = require('views/image_viewer')
wavelengthKeys = require('lib/wavelength_keys')
explodedTemplate = require('templates/exploded')

class ExampleGuide extends ToggleView
  el: "#classification-guide"

  events: {
    "click .close" : "hide"
    "mouseover .example canvas" : "play"
    "mouseout .example canvas" : "pause"
    "click .example" : "explode"
    "click .close-ex" : "closeExplode"
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

  removeExample: (v) ->
    @viewers[v].remove()

  show: ->
    super
    _.each(@examples, @render, @)

  hide: ->
    super
    _.each(@examples, @removeExample, @)

  explode: (ev) ->
    box = @$(ev.target).siblings(".exploded").addClass("active")
    type = @$(ev.target).parent().attr('id').split('-')[0]
    _.each(_.keys(wavelengthKeys), (w) ->
      src = exampleSubjects[type].location[w]
      box.append(explodedTemplate({src: src, wavelength: wavelengthKeys[w]})))

  closeExplode: (ev) ->
    if ev.target.tagName is 'IMG'
      box = @$(ev.target).parent().parent()
    else
      box = @$(ev.target).parent()
    box.children(":NOT(.close-ex)").remove()
    box.removeClass('active')

module.exports = ExampleGuide