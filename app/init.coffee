AppView = require('views/app_view')
Router = require('lib/router')
enUS = require('lib/en-us')

module.exports = ->
  t7e.load(enUS)

  languageManager = new zooniverse.LanguageManager({
    translations: {
      en: { label: "English", strings: enUS }
      zh_cn: { label: "简体中文", strings: "./translations/zh-cn.json" }
      zh_tw: { label: "繁體中文", strings: "./translations/zh-tw.json" }
      es: { label: "Español", strings: "./translations/es.json" }
      ru: { label: "русский", strings: "./translations/ru.json" }
      ja: { label: "日本語", strings: "./translations/ja.json" }
      de: { label: "Deutsch", strings: "./translations/de.json" }
      id: { label: "Bahasa Indonesia", strings: "./translations/id.json" }
      pl: { label: 'Polski', strings: './translations/pl.json' }
      ro: { label: "Româna", strings: "./translations/ro.json" }
      hu: { label: "Magyar", strings: "./translations/hu.json" }
    }
  })

  languageManager.on('change-language', (e, code, languageStrings) ->
    t7e.load(languageStrings)
    t7e.refresh()
  )

  api = if location.hostname is 'localhost'
    new zooniverse.Api({
      project: 'wise'
      host: 'https://dev.zooniverse.org'
    })
  else
    new zooniverse.Api({
      project: 'wise'
      host: 'https://api.zooniverse.org'
    })

  ga = new zooniverse.GoogleAnalytics({account: 'UA-1224199-50'})

  topBar = new zooniverse.controllers.TopBar()
  topBar.el.appendTo(document.body)

  zooniverse.models.User.fetch()

  appView = new AppView()
  router = new Router(appView)

  Backbone.history.start()
