class @BullFighter extends MoveableObject

  constructor: (args)->
    @starting_position = args.position
    super({ texture: window.bull_fighter_texture, x: @starting_position.x, y: @starting_position.y })

    @sprite.interactive = true
    @sprite.buttonMode = true

  enable_drag: ()->
    @sprite.on('mousedown', on_drag_start)
         .on('touchstart', on_drag_start)
         .on('mouseup', on_drag_end)
         .on('mouseupoutside', on_drag_end)
         .on('touchend', on_drag_end)
         .on('touchendoutside', on_drag_end)
         .on('mousemove', on_drag_move)
         .on('touchmove', on_drag_move)

  disable_drag: ()->
    @sprite.off('mousemove', null)
         .off('touchmove', null)

  go_home: ()->
    @enable_drag()
    @sprite.position.x = @starting_position.x
    @sprite.position.y = @starting_position.y
    @save_last_position()
    @still_for = 0

  time_still_for: ()->
    @still_for

  detect_movement: ()->
    if Math.abs(@last_position.x - @sprite.position.x) < 20 && Math.abs(@last_position.y - @sprite.position.y) < 20
      @still_for += 1
    else
      @still_for = 0
      @save_last_position()

  save_last_position: ()->
    @last_position = {
      x: @sprite.position.x,
      y: @sprite.position.y
    }



on_drag_start = (event)->
  this.data = event.data
  this.dragging = true

on_drag_end = ()->
  this.dragging = false
  this.data = null

on_drag_move = ()->
  if this.dragging
    newPosition = this.data.getLocalPosition(this.parent)
    this.position.x = newPosition.x
    this.position.y = newPosition.y
