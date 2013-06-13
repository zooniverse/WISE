{Controller} = require 'spine'

class ImageViewer extends Controller
  events:
    'change input[type="range"]' : 'scrub'
    'mousedown input[type="range"]' : 'scrub'
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

  constructor: ->
    super

  preloadImages: (subject, cb) =>
    @images = []
    loadedImages = 0

    inc = =>
      loadedImages = loadedImages + 1
      if (loadedImages is subject.metadata.files.length)
        cb()

    for src in @subjectWavelengths(subject) 
      img = new Image
      img.src = src
      img.onload = inc
      @images.push img

  subjectWavelengths: (subject) =>
    srcs = []
    for wavelength in @wavelengths when subject.location[wavelength]?
      srcs.push subject.location[wavelength] 
    srcs

  drawImage: (img) =>
    canvas = document.getElementById('viewer')
    ctx = canvas.getContext('2d')
    ctx.clearRect(0, 0, canvas.width, canvas.height)
    ctx.drawImage(img, 0, 0, canvas.width, canvas.height)

  animate: =>
    if @animateImages
      imageNo = parseInt(@$('input[type="range"]').val())
      if imageNo + 1 >= @images.length 
        imageNo = 0 
      else 
        imageNo = imageNo + 1
      @drawImage(@images[imageNo])
      @$('input[type="range"]').val(imageNo)
      setTimeout(@animate, 500)

  stop: =>
    $('button.stop').text('play').removeClass('stop').addClass('play')
    @animateImages = false

  play: (e) =>
    @$('button.play').text('stop').removeClass('play').addClass('stop')
    @animateImages = true
    @animate()

  scrub: (e) =>
    if (e.type is 'mousedown') 
      @$('input[type="range"]').on('mousemove', @scrub)
        .on('mouseup', => @$('input[type="range"]').off('mousemove mouseup'))
    imageNo = $('input[type="range"]').val()
    @drawImage(@images[imageNo])

  activateControls: =>
    @$('button.play').removeAttr 'disabled'
    @$('input[type="range"]').removeAttr 'disabled'

  deactivateControls: =>
    @$('button.play').attr 'disabled', 'disabled'
    @$('input[type="range"]').attr 'disabled', 'disabled'

  renderInfo: (subject) =>
    @$('.ra').text subject.coords[0]
    @$('.dec').text subject.coords[1]
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
      @drawImage(@images[0])) if subject? 


  finderChartUrl: (subject) ->
    """
      http://irsa.ipac.caltech.edu/applications/finderchart/#id=Hydra_finderchart_finder_chart&DoSearch=true&subsize=0.08333333400000001&thumbnail_size=medium&sources=DSS,SDSS,twomass,WISE&UserTargetWorldPt=#{subject.coords[0]};#{subject.coords[1]};EQ_J2000&TargetPanel.field.targetName=HIP%20#{subject.metadata.hip_id}&SimpleTargetPanel.field.resolvedBy=nedthensimbad&dss_bands=poss1_blue,poss1_red,poss2ukstu_blue,poss2ukstu_red,poss2ukstu_ir&SDSS_bands=u,g,r,i,z&twomass_bands=j,h,k&wise_bands=1,2,3,4&projectId=finderchart&searchName=finder_chart&startIdx=0&pageSize=0&shortDesc=Finder%20Chart&isBookmarkAble=true&isDrillDownRoot=true&isSearchResult=true
    """
module.exports = ImageViewer
