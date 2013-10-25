ToggleView = require('views/toggle_view')
ImageViewer = require('views/image_viewer')
Subject = zooniverse.models.Subject
Classification = zooniverse.models.Classification
User = zooniverse.models.User

class Classify extends ToggleView
  el: '#classify'

  initialize: ->
    @viewer = new ImageViewer()
    @listenTo(@viewer, 'played', @unlock)

    User.on('change', => Subject.next())
    Subject.on('select', =>
      @classification = new Classification({subject: Subject.current})
      @viewer.setupSubject(Subject.current)
      @lock())

  events:
    'click button.answer' : 'onChangeAnnotate'
    'click button#finish' : 'onClickNext'

  onChangeAnnotate: (e) =>
    @selected?.removeClass('selected')
    @selected = $(e.target).addClass('selected')
    value = @selected.data('val')
    @classification.removeAnnotation(@classification.annotations[0])
    @classification.annotate({classified_as: value})

  unlock: =>
    @$('.answer').removeAttr('disabled')

  lock: =>
    @$('.answer').attr('disabled', 'disabled')

  onClickNext: =>
    if !@classification.annotations[0]
      @$('.classification-error').show()
    else
      @$('.classification-error').hide()
      @$('.selected').removeClass('selected')
      @classification.send()
      Subject.next() 

module.exports = Classify
