AppView = require('views/app_view')
Router = require('lib/router')

module.exports = ->
  api = new zooniverse.Api({
    project: 'wise'
    host: 'https://dev.zooniverse.org'
  })

  topBar = new zooniverse.controllers.TopBar()
  topBar.el.appendTo(document.body)

  zooniverse.models.User.fetch()

  appView = new AppView()
  router = new Router(appView)

  Backbone.history.start()