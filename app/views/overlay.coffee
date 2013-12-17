class Overlay extends Backbone.View
  el: 'canvas'

  initialize: ->
    @ctx = @el.getContext('2d')
    @ctx.lineWidth = 2
    @ctx.strokeStyle = 'red'
    @center = {x: @el.width / 2, y: @el.height / 2}

  circleRadius: 70
  crosshairRadius: 7

  drawCrosshair: =>
    @ctx.beginPath()
    @ctx.moveTo(@center.x - @crosshairRadius, @center.y)
    @ctx.lineTo(@center.x + @crosshairRadius, @center.y)
    @ctx.closePath()
    @ctx.stroke()
    @ctx.beginPath()
    @ctx.moveTo(@center.x, @center.y - @crosshairRadius)
    @ctx.lineTo(@center.x, @center.y + @crosshairRadius)
    @ctx.closePath()
    @ctx.stroke()

  drawCircle: =>
    @ctx.beginPath()
    @ctx.arc(@center.x, @center.y, @circleRadius, 0, Math.PI*2, true)
    @ctx.closePath()
    @ctx.stroke()

  wavelength: (wavelength) =>
    @drawCrosshair()
    @drawCircle()

module.exports = Overlay
