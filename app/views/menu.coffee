ToggleView = require('views/toggle_view')
Subject = zooniverse.models.Subject
User = zooniverse.models.User
Classification = zooniverse.models.Classification

class Menu extends ToggleView 
  el: 'nav'

  events: {
    'click a' : 'hide'
  }

  initialize: ->
    Subject.on('select', => @setSocialButtons(Subject.current))

  setSocialButtons: (subject) ->
    @facebook or= @$('#facebook')
    @twitter or= @$('#twitter')
    @pinterest or= @$('#pinterest')

    @facebook.attr('href', subject.facebookHref())
    @twitter.attr('href', subject.twitterHref())
    @pinterest.attr('href', subject.pinterestHref())

  updateCounts: ->
    @$('.session-count').text(Classification.sentThisSession || 0)
    totalCount = (User.current?.project?.classification_count + Classification.sentThisSession) || 0

    if User.current?
      @$('.total').show()
      @$('.total-count').text totalCount
    else
      @$('.total').hide()

  hide: ->
    super
    @trigger 'hidden'

  show: ->
    super
    @updateCounts()

module.exports = Menu
