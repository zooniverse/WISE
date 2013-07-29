{Controller} = require 'spine'

class Overlay extends Controller
  constructor: ->
    super
    @canvas = @$el[0]
    @ctx = @canvas.getContext('2d')
    @ctx.lineWidth = 2
    @ctx.strokeStyle = 'red'
    @center = {x: @canvas.width / 2, y: @canvas.height / 2}

  circleLengths: [
    '2massj',
    '2massh',
    '2massk',
    'wise1',
    'wise2',
    'wise3',
    'wise4'
  ]

  circleRadius: 34

  drawCrosshair: =>
    @ctx.beginPath()
    @ctx.moveTo(@center.x - 5, @center.y)
    @ctx.lineTo(@center.x + 5, @center.y)
    @ctx.closePath()
    @ctx.stroke()
    @ctx.beginPath()
    @ctx.moveTo(@center.x, @center.y - 5)
    @ctx.lineTo(@center.x, @center.y + 5)
    @ctx.closePath()
    @ctx.stroke()

  drawCircle: =>
    @ctx.beginPath()
    @ctx.arc(@center.x, @center.y, @circleRadius, 0, Math.PI*2, true)
    @ctx.closePath()
    @ctx.stroke()

  wavelength: (wavelength) =>
    @drawCrosshair()
    if wavelength in @circleLengths
      @drawCircle()

module.exports = Overlay
