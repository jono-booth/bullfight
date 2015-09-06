class @MoveableObject
  constructor: (args)->
    texture = PIXI.Texture.fromImage args.texture
    @sprite = new PIXI.Sprite(texture)

    @sprite.position.x = args.x
    @sprite.position.y = args.y
    @sprite.anchor.set(0.5)

  sprite: ()->
    return @sprite

  collided_with: (object)->
    if @abs_distance_from(object).x < 35 && @abs_distance_from(object).y < 35
      return true

  random_event: (chances)->
    Math.floor(Math.random() * chances) == 1

  look_at: (object)->
    distance = @distance_from(object)

    angle = Math.atan(distance.y/distance.x)
    if distance.x > 0 then angle += 3

    @sprite.rotation = angle

  distance_from: (object)->
    {
      x: object.sprite.position.x - @sprite.position.x,
      y: object.sprite.position.y - @sprite.position.y
    }

  distance_to: (object)->
    {
      x: @sprite.position.x - object.sprite.position.x,
      y: @sprite.position.y - object.sprite.position.y
    }

  abs_distance_from: (object)->
    {
      x: Math.abs(object.sprite.position.x - @sprite.position.x),
      y: Math.abs(object.sprite.position.y - @sprite.position.y)
    }
