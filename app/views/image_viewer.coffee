Controls = require('views/controls')
Overlay = require('views/overlay')
Timeline = require('views/timeline')
IVModel = require('models/image_viewer')

class ImageViewer extends Backbone.View
  initialize: (opts) ->
    @setupCanvas()

    @model = new IVModel()

    if opts.controls?
      @timeline = new Timeline({model: @model})
      @controls = new Controls({model: @model, el: @el})
      @controls.render()

    @overlay = new Overlay({model: @model, el: @canvas})

    @listenTo(@model, 'change:index', @drawImage)
    @listenTo(@model, 'change:animate', @animate)

  setupCanvas: ->
    @canvas = @$('canvas')[0]
    @ctx = @canvas.getContext('2d')

  drawImage: =>
    {img, wavelength} = @model.currentImage()

    @ctx.clearRect(0, 0, @canvas.width, @canvas.height)
    @ctx.drawImage(img, 0, 0, @canvas.width, @canvas.height)
    @overlay.wavelength(wavelength)

  animate: =>
    if @model.isPlaying()
      @model.incrementIndex()
      setTimeout(@animate, 500)

  setupSubject: (subject) =>
    return if !subject
    @model.reset()
    @model.preloadImages(subject).then(@postloadImages)

  postloadImages: =>
    @$('.loading').hide()
    @timeline.updateTimeline(@model, @model.get('index'))
    @drawImage()

module.exports = ImageViewer
