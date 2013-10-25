Classify = require('views/classify')
Science = require('views/science')
About = require('views/about')
Team = require('views/team')
Menu = require('views/menu')

class AppView extends Backbone.View
  el: 'body'

  views: {
    classify: new Classify()
    science: new Science()
    about: new About()
    team: new Team()
  }

  events: {
    'click .menu' : 'toggleMenu'
    'click' : 'maybeToggleMenu'
  }

  initialize: ->
    @active = @views.classify
    @menu = new Menu()

  toggleMenu: ->
    @$('.menu').toggleClass('active')
    @menu.toggle()
    return false

  maybeToggleMenu: ->
    if @menu.visible
      @toggleMenu()

  activate: (view) ->
    if view
      @active.hide()
      @active = @views[view]
    @active.show()


module.exports = AppView
