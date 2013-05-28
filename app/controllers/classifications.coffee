{Controller} = require 'spine'
Subject = require 'zooniverse/models/subject'
Classification = require 'zooniverse/models/classification'
User = require 'zooniverse/models/user'
ImageViewer = require 'controllers/image_viewer'

class Classifier extends Controller
  events:
    'click button[name="classify"]' : 'onChangeAnnotate'
    'click button[name="next"]' : 'onClickNext'

  constructor: ->
    super
    @imageViewer = new ImageViewer {el: '.image-viewer'}
    User.on 'change', => Subject.next()
    Subject.on 'select', =>
      @classification = new Classification subject: Subject.current
      @imageViewer.setupSubject(Subject.current)

  onChangeAnnotate: (e) =>
    @selected?.removeClass 'selected'
    @selected = $(e.target).addClass 'selected'
    value = @selected.data('val')
    @classification.removeAnnotation @classification.annotations[0]
    @classification.annotate classified_as: value 

  onClickNext: =>
    if !@classification.annotations[0]
      @$('.classification-error').show()
    else
      @$('.classification-error').hide()
      @$('.selected').removeClass 'selected'
      @classification.send()
      Subject.next() 

module.exports = Classifier
