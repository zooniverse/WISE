{Controller} = require 'spine'
Timeline = require 'controllers/timeline'
Info = require 'controllers/info'
Controls = require 'controllers/controls'
Overlay = require 'controllers/overlay'

class ImageViewer extends Controller
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

  constructor: ->
    super
    @index = 0

    @timeline = new Timeline {el: '.timeline'}
    @timeline.on 'scrub', @goTo

    @controls = new Controls {el: ".controls"}
    @controls.on 'play', @play
    @controls.on 'pause', @pause

    @overlay = new Overlay {el: '#viewer' }

    @info = new Info {el: ".info"}
    @setupCanvas()

  setupCanvas: ->
    @canvas = document.getElementById('viewer')
    @ctx = @canvas.getContext('2d')

  preloadImages: (subject) =>
    @images = []
    loadedImages = 0
    promise = new $.Deferred()

    inc = =>
      loadedImages = loadedImages + 1
      if (loadedImages is subject.metadata.files.length)
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
      @timeline.updateTimeline(@index)
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
    @$('input[type="range"]').val 0
    @info.setupSubject(subject)

    @preloadImages(subject).then(@postloadImages)

  postloadImages: =>
    @$('.loading').hide()
    @timeline.render(@images)
    @drawImage()

module.exports = ImageViewer
