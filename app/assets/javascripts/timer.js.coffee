class @Timer
  constructor: (world)->
    @time = 0
    @clock = new PIXI.Text(@time)
    @clock.x = world.width - 90
    @clock.y = 30
    @start()

  start: ()->
    @stopped = false

  time: ()->
    @time

  clock: ()->
    @clock

  count: ()->
    unless @stopped
      @time += 1
      @clock.text = String(@time / 50).replace(".", ":")

  stop: ()->
    @stopped = true

  reset: ()->
    @time = 0
