{Controller} = require 'spine'
Subject = require 'zooniverse/models/subject'
Classification = require 'zooniverse/models/classification'
User = require 'zooniverse/models/user'
ImageViewer = require 'controllers/image_viewer'

class Classifier extends Controller
  events:
    'click button.classify' : 'onChangeAnnotate'
    'click button.next' : 'onClickNext'

  constructor: ->
    super
    @imageViewer = new ImageViewer {el: '.image-viewer'}
    @imageViewer.on 'played', @unlock
    User.on 'change', => Subject.next()
    Subject.on 'select', =>
      @classification = new Classification subject: Subject.current
      @imageViewer.setupSubject(Subject.current)
      @lock()

  onChangeAnnotate: (e) =>
    @selected?.removeClass 'selected'
    @selected = $(e.target).addClass 'selected'
    value = @selected.data('val')
    @classification.removeAnnotation @classification.annotations[0]
    @classification.annotate classified_as: value 

  unlock: =>
    @$('.answers button').removeAttr 'disabled'

  lock: =>
    @$('.answers button').attr 'disabled', 'disabled'

  onClickNext: =>
    if !@classification.annotations[0]
      @$('.classification-error').show()
    else
      @$('.classification-error').hide()
      @$('.selected').removeClass 'selected'
      @classification.send()
      Subject.next() 

module.exports = Classifier
