class @Bull extends MoveableObject
  constructor: (speed)->
    super({ texture: window.bull_texture, x: 20, y: 20 })
    @speed = speed

  go_home: ()->
    @sprite.position.x = 20
    @sprite.position.y = 20

  run_at: (object, extra_speed)->
    distance = @distance_from(object)

    abs_x_distance = Math.abs(distance.x)
    abs_y_distance = Math.abs(distance.y)

    if abs_x_distance > abs_y_distance
      x_movement = 1
      y_movement = Math.floor( abs_y_distance / abs_x_distance )
    else
      x_movement = Math.floor( abs_x_distance / abs_y_distance )
      y_movement = 1

    if distance.x > 0
      @sprite.position.x += x_movement * @speed * extra_speed
    else
      @sprite.position.x -= x_movement * @speed * extra_speed

    if distance.y > 0
      @sprite.position.y += y_movement * @speed * extra_speed
    else
      @sprite.position.y -= y_movement * @speed * extra_speed
