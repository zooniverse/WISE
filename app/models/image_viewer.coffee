class ImageViewer extends Backbone.Model
  wavelengths: [
    'sdssu',
    'sdssg',
    'sdssr',
    'sdssi',
    'sdssz',
    'dss2blue',
    'dss2red',
    'dss2ir',
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
    loadedImages = 0
    promise = new $.Deferred()
    
    locs = @subjectWavelengths(subject)
    inc = =>
      loadedImages = loadedImages + 1
      if (loadedImages is locs.length)
        promise.resolve()

    imgs = _.map(locs, (source) ->
      img = new Image
      img.src = source.src
      img.onload = inc
      {img: img, wavelength: source.wavelength})

    @set('images', imgs)

    return promise

  subjectWavelengths: (subject) =>
    srcs = []
    for wavelength in @wavelengths when subject.location[wavelength]?
      srcs.push {src: subject.location[wavelength], wavelength: wavelength}

    if _.find(srcs, (s) -> s.wavelength is 'sdssu')
      srcs = _.filter(srcs, (s) -> 
        s.wavelength in ['dss2blue', 'dss2red', 'dss2ir'])
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

  decrementIndex: ->
    i = @get('index') - 1
    l = @get('loop')
    imgs = @get('images')

    if i < 0
      unless l
        @set('animate', false) 
        i = 0
      else
        i = imgs.length - 1

    @set('index', i) 

  incrementIndex: ->
    i = @get('index') + 1
    l = @get('loop')
    imgs = @get('images')

    if i >= imgs.length
      unless l
        @set('animate', false) 
        i = i - 1
      else
        i = 0

    @set('index', i) 

  reset: ->
    _.each(@defaults, ((v, k) -> @set(k, v)), @)

  toggleLoop: ->
    @set('loop', not @get('loop'))

module.exports = ImageViewer
