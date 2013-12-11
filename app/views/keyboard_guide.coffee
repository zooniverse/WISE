ToggleView = require('views/toggle_view')

class KeyboardGuide extends ToggleView
  el: "#keyboard-guide"

  events: {
    "click .close" : 'hide'
  }

module.exports = KeyboardGuide
