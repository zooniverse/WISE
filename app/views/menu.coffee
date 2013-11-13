ToggleView = require('views/toggle_view')
Subject = zooniverse.models.Subject

class Menu extends ToggleView 
  el: 'nav'

  events: {
    'click a' : 'closeMenu'
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

  closeMenu: ->
    @hide()

module.exports = Menu
