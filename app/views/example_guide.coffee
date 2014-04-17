ToggleView = require('views/toggle_view')
exampleSubjects = require('lib/examples')
ImageViewer = require('views/image_viewer')
wavelengthKeys = require('lib/wavelength_keys')
headerTemplate = require('templates/comparison_header')
rowTemplate = require('templates/comparison_row')

class ExampleGuide extends ToggleView
  el: "#classification-guide"

  events: {
    "click .close" : "hide"
    "click .btn-compare" : "selectComparison"
    "click .hide-compare" : 'hideCompare'
  }

  viewers: {}

  examples: ["good", "good_artifact", "multiple", "galaxy", "nebula", "multi", "shift"]

  selected: []

  initialize: ->
    _.each(@examples, @render, @)

  play: (ev) ->
    iv = @viewers[ev.target.parentNode.id]
    iv.model.set('loop', true)
    iv.model.play()

  pause: (ev) ->
    iv = @viewers[ev.target.parentNode.id]
    iv.model.pause()

  render: (ex) ->
    id = "#{ex}-example"
    return if @viewers[id]?
    iv = new ImageViewer({el: ("#" + id + "> .column.half:first-child"), controls: true, timeline: false})
    iv.setupSubject(exampleSubjects[ex])
    @viewers[id] = iv

  removeExample: (v) ->
    @viewers["#{v}-example"].model.pause()

  hide: ->
    super
    _.each(@examples, @removeExample, @)

  updateTarget: (target) ->
    @hideCompare()
    @target = target
    @targetWavelengths = _.filter(_.keys(wavelengthKeys), (w) -> 
      w in (target.metadata.bands || target.metadata.image_bands))
    @$('thead').html(headerTemplate({waves: @targetWavelengths}))
    @compare()

  selectComparison: (ev) ->
    @$('.compare').addClass('active')
    @$(ev.target).toggleClass('active')
    target = ev.target.dataset.ex
    if target in @selected
      @selected = _.without(@selected, target)
      @hideCompare() if _.isEmpty(@selected)
    else
      @selected = @selected.concat(target)
    @compare()

  compare: ->
    imgs = _.values(_.pick(@target.location, @targetWavelengths))
    @$('tbody').html(rowTemplate({name: 'Subject', imgs: imgs})) 
    _.chain(@selected)
      .map((s) -> exampleSubjects[s].location)
      .each(((ex, i) -> 
        imgs = _.values(_.pick(ex, @targetWavelengths))

        if @targetWavelengths.length > imgs.length
          pad = @targetWavelengths.length - imgs.lengths
          pad = _.chain(0).range(5).map((n) -> "").value()
          imgs = pad.concat(imgs)

        name =  @selected[i].replace(/^./, (c) -> 
          c.toLocaleUpperCase())
        @$('tbody').append(rowTemplate({
          name: name, 
          imgs: imgs
        }))), @)

  hideCompare: ->
    @$('.compare').removeClass('active')
    
module.exports = ExampleGuide
