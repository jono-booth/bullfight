class @StartButton
  constructor: (world)->
    style = {
        font : 'bold italic 36px Arial',
        fill : '#F7EDCA',
        stroke : '#4a1850',
        strokeThickness : 5,
        dropShadow : true,
        dropShadowColor : '#000000',
        dropShadowAngle : Math.PI / 6,
        dropShadowDistance : 6,
        wordWrap : true,
        wordWrapWidth : 440
      }

    @button = new PIXI.Text("Start", style)
    @button.buttonMode = true
    @button.interactive = true
    @button.x = world.width - 100
    @button.y = world.height - 50

  button: ()->
    @button


