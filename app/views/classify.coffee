ToggleView = require('views/toggle_view')
ImageViewer = require('views/image_viewer')
Subject = zooniverse.models.Subject
Classification = zooniverse.models.Classification
User = zooniverse.models.User
ExampleGuide = require('views/example_guide')
tutorialSubject = require('lib/tutorial_subject')
{Tutorial} = zootorial
tutorial = require('lib/tutorial')

class Classify extends ToggleView
  el: '#classify'

  initialize: ->
    @viewer = new ImageViewer({el: "#canvas-container", controls: true})
    @exampleGuide = new ExampleGuide()

    @listenTo(@viewer.model, 'played', @unlock)
    @listenTo(@exampleGuide, 'hidden', => @guideButton.removeClass('active'))

    User.on('change', @onUserChange) 
    Subject.on('select', @onNextSubject)

  onUserChange: =>
    return Subject.next() if User.current?.project?.tutorial_done
    @startTutorial()

  onNextSubject: =>
    @classification = new Classification({subject: Subject.current})
    @viewer.setupSubject(Subject.current)
    @setTalkLink(Subject.current)
    @favorite.removeClass('active') if @favorite
    @lock()
    console.log("Current Subject: ", Subject.current.id, Subject.current.metadata.set)

  events:
    'click button.answer' : 'onChangeAnnotate'
    'click button#finish' : 'onClickNext'
    'click button#favorite' : 'toggleFavorite'
    'click button#guide' : 'showGuide'
    'click button#tutorial' : 'startTutorial'

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
      @$('.classification-error').show()
    else
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

  showGuide: ->
    @guideButton or= @$('#guide')
    @exampleGuide.show()
    @guideButton.addClass('active')

  startTutorial: =>
    return if @tut?
    Subject.current = new Subject(tutorialSubject)
    @onNextSubject()
    @tut or= new Tutorial(tutorial)
    @tut.el.bind('end-tutorial', @endTutorial)
    @tut.start()

  endTutorial: =>
    delete @tut
    if User.current
      User.current.setPreference('tutorial_done', true)

  show: ->
    super
    _.defer(=> @onUserChange())

module.exports = Classify
