class @Timer
  constructor: ()->
    @time = 0
    @clock = new PIXI.Text(@time)
    @clock.x = 500
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
      @clock.text = @time / 50

  stop: ()->
    @stopped = true

  reset: ()->
    @time = 0
