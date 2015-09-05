class @BullFighter extends MoveableObject

  constructor: ()->
    super({ texture: window.bull_fighter_texture, x: 450, y: 450 })

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
    @sprite.position.x = 450
    @sprite.position.y = 450
    @last_position_x = @sprite.position.x
    @last_position_y = @sprite.position.y
    @still_for = 0

  time_still_for: ()->
    @still_for

  detect_movement: ()->
    if Math.abs(@last_position_x - @sprite.position.x) < 20 && Math.abs(@last_position_y - @sprite.position.y) < 20
      @still_for += 1
    else
      @still_for = 0
      @last_position_x = @sprite.position.x
      @last_position_y = @sprite.position.y



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
