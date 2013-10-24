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
    'click #global-menu' : 'toggleMenu'
  }

  constructor: ->
    @active = @views.classify
    @menu = new Menu()

  toggleMenu: ->

  activate: (view) ->
    if view
      @active.hide()
      @active = @views[view]
    @active.show()


module.exports = AppView
