require 'lib/setup'
Api = require 'zooniverse/lib/api'
TopBar = require 'zooniverse/controllers/top-bar'
User = require 'zooniverse/models/user'
Classifications = require 'controllers/classifications'

{Controller} = require('spine')

class App extends Controller
  constructor: ->
    super
    new Api project: 'wise'
    topBar = new TopBar
    topBar.el.appendTo document.body
    User.fetch()
    classify = new Classifications {el: "#app"}

module.exports = App
