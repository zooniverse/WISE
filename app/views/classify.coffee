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
      @setTalkLink(Subject.current)
      @favorite.removeClass('active') if @favorite
      @lock())

  events:
    'click button.answer' : 'onChangeAnnotate'
    'click button#finish' : 'onClickNext'
    'click button#favorite' : 'toggleFavorite'

  onChangeAnnotate: (e) =>
    @selected?.removeClass('selected')
    @selected = $(e.target).addClass('selected')
    value = @selected.data('val')
    @classification.removeAnnotation(@classification.annotations[0])
    @classification.annotate({classified_as: value})

  unlock: =>
    @$('.answer, #finish').prop('disabled', false)

  lock: =>
    @$('.answer, #finish').prop('disabled', true)

  onClickNext: =>
    if !@classification.annotations[0]
      console.log('here')
      @$('.classification-error').show()
    else
      console.log('here')
      @$('.classification-error').hide()
      @$('.selected').removeClass('selected')
      @classification.send()
      Subject.next() 

  toggleFavorite: (ev) ->
    @favorite or= @$('#favorite')
    return unless @classification
    @classification.favorite = not @classification.favorite
    @favorite.toggleClass('active')

  setTalkLink: (subject) ->
    @talkLink or= @$("#talk")
    @talkLink.attr('href', subject.talkHref())

module.exports = Classify
