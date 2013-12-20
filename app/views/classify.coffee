ToggleView = require('views/toggle_view')
ImageViewer = require('views/image_viewer')
Subject = zooniverse.models.Subject
Classification = zooniverse.models.Classification
User = zooniverse.models.User
ExampleGuide = require('views/example_guide')
KeyboardGuide = require('views/keyboard_guide')
tutorialSubject = require('lib/tutorial_subject')
{Tutorial} = zootorial
tutorial = require('lib/tutorial')

class Classify extends ToggleView
  el: '#classify'

  initialize: ->
    @guideButton = @$('#guide')
    @keyboardButton = @$('#keyboard')
    @viewer = new ImageViewer({el: "#canvas-container", controls: true})
    @exampleGuide = new ExampleGuide()
    @keyboardGuide = new KeyboardGuide()

    @listenTo(@viewer.model, 'change:index', @unlock)
    @listenTo(@exampleGuide, 'shown', => @guideButton.addClass('active'))
    @listenTo(@exampleGuide, 'hidden', => @guideButton.removeClass('active'))
    @listenTo(@keyboardGuide, 'shown', => @keyboardButton.addClass('active'))
    @listenTo(@keyboardGuide, 'hidden', => @keyboardButton.removeClass('active'))

    User.on('change', @onUserChange) 
    Subject.on('select', @onNextSubject)

  onUserChange: =>
    return Subject.next() if User.current?.project?.tutorial_done
    @startTutorial()

  onNextSubject: =>
    @exampleGuide.updateTarget(Subject.current)
    @classification = new Classification({subject: Subject.current})
    @viewer.setupSubject(Subject.current)
    @setTalkLink(Subject.current)
    @favorite.removeClass('active') if @favorite
    @lock()
    console.log("Current Subject: ", Subject.current.id, Subject.current.metadata.set)

  events: {
    'click button.answer' : 'onChangeAnnotate'
    'click button#finish' : 'onClickNext'
    'click button#favorite' : 'toggleFavorite'
    'click button#guide' : 'showGuide'
    'click button#tutorial' : 'startTutorial'
    'click button#keyboard' : 'showKeyboardGuide'
  }

  keyboardEvents: {
    'space' : 'togglePlayback'
    'f' : 'toggleFavorite'
    't' : 'startTutorial'
    'g' : 'showGuide'
    '1 2 3 4 5 6' : 'markAnswer'
    'enter' : 'onClickNext'
    'l' : 'toggleLoop'
    'up' : 'nextImage'
    'down': 'prevImage'
  }

  toggleLoop: ->
    @viewer.model.toggleLoop()

  togglePlayback: -> 
    if @viewer.model.isPlaying()
      @viewer.model.pause()
    else
      @viewer.model.play()

  nextImage: ->
    @viewer.model.incrementIndex()

  prevImage: ->
    @viewer.model.decrementIndex()

  markAnswer: (ev, key) -> 
    return if @locked
    answers = {
      '1': 'multi'
      '2': 'shift'
      '3': 'extended'
      '4': 'empty'
      '5': 'oval'
      '6': 'good'
    }
    if key is '6'
      @$('.selected:NOT(#good)').removeClass("selected")
    else
      @$("#good").removeClass("selected")
    @$("[data-val=#{answers[key]}]").toggleClass('selected')

  onChangeAnnotate: (e) =>
    if e.target.id is "good"
      @$('.selected:NOT(#good)').removeClass('selected')
    else
      @$("#good").removeClass('selected')
    @$(e.target).toggleClass('selected')

  unlock: (m, index) ->
    return unless index is 9
    @locked = false
    @$('.answer, #finish').prop('disabled', false)

  lock: =>
    @locked = true
    @$('.answer, #finish').prop('disabled', true)

  onClickNext: =>
    return if @locked
    @$('.selected').each((i, b) =>
      @classification.annotate({classified_as: $(b).data('val')}))
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
    @exampleGuide.toggle()

  showKeyboardGuide: ->
    @keyboardGuide.toggle()

  startTutorial: (ev) =>
    if @tut? and ev?
      @tut.end()
      return @endTutorial()
    else if @tut? or !@visible
      return
    Subject.current = new Subject(tutorialSubject)
    @onNextSubject()
    @tut or= new Tutorial(tutorial)
    @tut.el.bind('end-tutorial', @endTutorial)
    @$('button#tutorial').addClass('active')
    @tut.start()

  endTutorial: =>
    delete @tut
    @$('button#tutorial').removeClass('active')
    if User.current
      User.current.setPreference('tutorial_done', true)

  show: ->
    super
    _.defer(=> @onUserChange())

  hide: ->
    super
    @tut?.end()

module.exports = Classify
