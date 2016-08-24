Classify = require('views/classify')
Science = require('views/science')
About = require('views/about')
Team = require('views/team')
Index = require('views/index')
Menu = require('views/menu')
Authors = require('views/authors')

class AppView extends Backbone.View
  el: 'body'

  views: {
    classify: new Classify()
    science: new Science()
    about: new About()
    team: new Team()
    authors: new Authors()
    index: new Index()
  }

  events: {
    'click .menu' : 'toggleMenu'
    'click' : 'maybeToggleMenu'
  }

  initialize: ->
    @active = @views.index
    @menu = new Menu()
    @listenTo(@menu, 'hidden', => @$('.menu').removeClass('active'))

  toggleMenu: ->
    @$('.menu').toggleClass('active')
    @menu.toggle()
    return false

  maybeToggleMenu: (ev) ->
    tag = ev.target.tagName
    if @menu.visible and ((tag isnt "A") and (tag isnt "IMG"))
      @toggleMenu()

  activate: (view) ->
    if view
      @active.hide()
      @active = @views[view]
    @active.show()

module.exports = AppView
