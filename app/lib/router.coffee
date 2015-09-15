class Router extends Backbone.Router

  routes: {
    '' : 'index'
    'classify(/)' : 'classify'
    'science(/)' : 'science'
    'about(/)' : 'about'
    'team(/)' : 'team'
    'faq(/)' : 'faq'
  }

  initialize: (appView) ->
    @appView = appView

  index: ->
    @appView.activate('index')

  classify: ->
    @appView.activate('classify')

  science: ->
    @appView.activate('science')

  about: ->
    @appView.activate('about')

  team: ->
    @appView.activate('team')

  faq: ->
    @appView.activate('faq')

module.exports = Router
