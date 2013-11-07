class ImageViewer extends Backbone.Model
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

  defaults: {
    index: 0
    animate: false
    loop: false
    images: []
  }

  preloadImages: (subject) =>
    imgs = []
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
      imgs.push {img: img, wavelength: source.wavelength}

    @set('images', imgs)

    return promise

  subjectWavelengths: (subject) =>
    srcs = []
    for wavelength in @wavelengths when subject.location[wavelength]?
      srcs.push {src: subject.location[wavelength], wavelength: wavelength}
    srcs

  isPlaying: ->
    @get('animate')

  play: ->
    @set('index', 0) if @get('index') + 1 is @get('images').length
    setTimeout((=> @set('animate', true)), 500)

  pause: ->
    @set('animate', false)

  currentImage: ->
    @get('images')[@get('index')]

  incrementIndex: ->
    i = @get('index') + 1
    l = @get('loop')
    imgs = @get('images')

    if i >= imgs.length
      unless l
        @set('animate', false) 
        @trigger('played')
        i = i - 1
      else
        i = 0

    @set('index', i) 

  reset: ->
    _.each(@defaults, ((v, k) -> @set(k, v)), @)

  toggleLoop: ->
    @set('loop', not @get('loop'))

module.exports = ImageViewer
