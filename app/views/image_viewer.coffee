Controls = require('views/controls')
Overlay = require('views/overlay')
Timeline = require('views/timeline')

class ImageViewer extends Backbone.View
  el: '#canvas-container'
  wavelengths: [
    'dssdss2blue',
    'dssdss2red',
    'dssdss2ir',
    '2massj',
    '2massh',
    '2massk',
    'wise1',
    'wise2',
    'wise3',
    'wise4'
  ]

  initialize: ->
    @index = 0

    @timeline = new Timeline()
    @controls = new Controls()

    @listenTo(@timeline, 'scrub', @goTo)

    @listenTo(@controls, 'play', @play)
    @listenTo(@controls, 'pause', @pause)

    @overlay = new Overlay()

    @setupCanvas()

  setupCanvas: ->
    @canvas = @$('canvas')[0]
    @ctx = @canvas.getContext('2d')

  preloadImages: (subject) =>
    @images = []
    loadedImages = 0
    promise = new $.Deferred()

    inc = =>
      loadedImages = loadedImages + 1
      if (loadedImages is @wavelengths.length)
        promise.resolve()

    for source in @subjectWavelengths(subject)
      img = new Image
      img.src = source.src
      img.onload = inc
      @images.push {img: img, wavelength: source.wavelength}

    return promise

  subjectWavelengths: (subject) =>
    srcs = []
    for wavelength in @wavelengths when subject.location[wavelength]?
      srcs.push {src: subject.location[wavelength], wavelength: wavelength}
    srcs

  drawImage: =>
    img = @images[@index]
    @ctx.clearRect(0, 0, @canvas.width, @canvas.height)
    @ctx.drawImage(img.img, 0, 0, @canvas.width, @canvas.height)
    @overlay.wavelength(img.wavelength)

  animate: =>
    if @animateImages
      if @index + 1 >= @images.length
        if @controls.loop
          @index = 0
        else
          @controls.pause()
        @trigger 'played'
      else
        @index = @index + 1
      @drawImage()
      @trigger('next', @index)
      setTimeout(@animate, 500)

  pause: =>
    @animateImages = false

  play: =>
    @index = -1 if @index + 1 >= @images.length
    @animateImages = true
    setTimeout(@animate, 250)

  goTo: (index) =>
    @index = index
    @drawImage()

  setupSubject: (subject) =>
    return if !subject
    @index = 0
    @controls.reset()

    @preloadImages(subject).then(@postloadImages)

  postloadImages: =>
    @$('.loading').hide()
    @timeline.render(@images)
    @drawImage()

module.exports = ImageViewer
