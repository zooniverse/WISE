{Controller} = require 'spine'
radioTemplate = require 'views/radio'

class ImageViewer extends Controller
  events:
    'click input[type="radio"]' : 'scrub'
    'click button.play' : 'play'
    'click button.stop' : 'stop'

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

  circleLengths: [
    '2massj',
    '2massh',
    '2massk',
    'wise1',
    'wise2',
    'wise3',
    'wise4'
  ]

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

  constructor: ->
    super
    @index = 0

  preloadImages: (subject, cb) =>
    @images = []
    loadedImages = 0

    inc = =>
      loadedImages = loadedImages + 1
      if (loadedImages is subject.metadata.files.length)
        cb()

    for source in @subjectWavelengths(subject) 
      img = new Image
      img.src = source.src
      img.onload = inc
      @images.push {img: img, wavelength: source.wavelength}

  subjectWavelengths: (subject) =>
    srcs = []
    for wavelength in @wavelengths when subject.location[wavelength]?
      srcs.push {src: subject.location[wavelength], wavelength: wavelength}
    srcs

  drawTimeline: =>
    @$('.timeline').empty()
    for {wavelength}, index in @images 
      $('.timeline').append radioTemplate
        band: @readableWavelengths[wavelength]
        index: index

    @$('.timeline li:first-child input').attr('checked', 'checked')

  updateTimeline: =>
    @$('input[checked="checked"]').removeProp('checked')
    @$("input[data-index=\"#{@index}\"]").prop('checked', true)
    console.log @$("input[data-index=\"#{@index}\"]")

  drawImage: =>
    img = @images[@index]
    canvas = document.getElementById('viewer')
    ctx = canvas.getContext('2d')
    ctx.clearRect(0, 0, canvas.width, canvas.height)
    ctx.drawImage(img.img, 0, 0, canvas.width, canvas.height)
    @drawCircle(ctx, canvas) if img.wavelength in @circleLengths

  drawCircle: (ctx, canvas) =>
    ctx.lineWidth = 2
    ctx.strokeStyle = 'red'
    ctx.beginPath()
    ctx.arc(canvas.width / 2, canvas.height / 2, 34, 0, Math.PI*2, true)
    ctx.closePath()
    ctx.stroke()

  animate: =>
    if @animateImages
      if @index + 1 >= @images.length 
        @stop()
        @trigger 'played'
        @index = 0 
      else 
        @index = @index + 1
      @drawImage()
      @updateTimeline()
      setTimeout(@animate, 500)

  stop: =>
    @$('button.stop').text('play').removeClass('stop').addClass('play')
    @animateImages = false

  play: (e) =>
    @$('button.play').text('stop').removeClass('play').addClass('stop')
    @animateImages = true
    @animate()

  scrub: (e) =>
    @index = e.target.dataset.index
    @drawImage()

  activateControls: =>
    @$('button.play').removeAttr 'disabled'
    @$('input[type="range"]').removeAttr 'disabled'

  deactivateControls: =>
    @$('button.play').attr 'disabled', 'disabled'
    @$('input[type="range"]').attr 'disabled', 'disabled'

  renderInfo: (subject) =>
    @$('.ra').text subject.coords[0].toFixed(2)
    @$('.dec').text subject.coords[1].toFixed(2)
    @$('.hip').text subject.metadata.hip_id
    @$('.finder-chart').attr 'href', @finderChartUrl(subject)

  setupSubject: (subject) =>
    return if !subject
    @deactivateControls()
    @$('input[type="range"]').val 0
    @renderInfo(subject)
    @preloadImages(subject, =>
      @$('.loading').hide()
      @activateControls()
      if subject? 
        @drawTimeline()
        @drawImage())

  finderChartUrl: (subject) ->
    """
      http://irsa.ipac.caltech.edu/applications/finderchart/#id=Hydra_finderchart_finder_chart&DoSearch=true&subsize=0.08333333400000001&thumbnail_size=medium&sources=DSS,SDSS,twomass,WISE&UserTargetWorldPt=#{subject.coords[0]};#{subject.coords[1]};EQ_J2000&TargetPanel.field.targetName=HIP%20#{subject.metadata.hip_id}&SimpleTargetPanel.field.resolvedBy=nedthensimbad&dss_bands=poss1_blue,poss1_red,poss2ukstu_blue,poss2ukstu_red,poss2ukstu_ir&SDSS_bands=u,g,r,i,z&twomass_bands=j,h,k&wise_bands=1,2,3,4&projectId=finderchart&searchName=finder_chart&startIdx=0&pageSize=0&shortDesc=Finder%20Chart&isBookmarkAble=true&isDrillDownRoot=true&isSearchResult=true
    """
module.exports = ImageViewer
