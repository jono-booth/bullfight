class @Bull extends MoveableObject
  constructor: (args)->
    super({ texture: window.bull_texture, x: args.position.x, y: args.position.x })
    @speed = args.speed
    @min_charge_distance = args.min_charge_distance
    @charge_accuracy = args.charge_accuracy

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

    x_movement = if distance.x > 0 then Math.abs(x_movement) else -Math.abs(x_movement)
    y_movement = if distance.y > 0 then Math.abs(y_movement) else -Math.abs(y_movement)

    if @random_event(20) && abs_x_distance < @min_charge_distance && abs_y_distance < @min_charge_distance
      @charge_at(object)

    @move_xy_by(x_movement, y_movement, extra_speed)

  move_xy_by:(x, y, extra_speed)->
    @sprite.position.x += x * @speed * extra_speed
    @sprite.position.y += y * @speed * extra_speed

  charge_at: (object)->
    random_distance_x = Math.floor(Math.random() * @charge_accuracy)
    @sprite.position.x = object.sprite.position.x + random_distance_x

    random_distance_y = Math.floor(Math.random() * @charge_accuracy)
    @sprite.position.y = object.sprite.position.y + random_distance_y



