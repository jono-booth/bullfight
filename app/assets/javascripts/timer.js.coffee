class @Timer
  constructor: (args)->
    @time = 0
    @clock = new PIXI.Text(@time)
    @clock.x = args.position.x
    @clock.y = args.position.y
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
