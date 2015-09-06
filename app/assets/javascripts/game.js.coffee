world = new World()

renderer = PIXI.autoDetectRenderer(world.width, world.height,{backgroundColor : 0xCC9B36})

document.body.appendChild(renderer.view)
stage = new PIXI.Container

animate = ()->
  requestAnimationFrame(animate)
  if step_forward then step()
  renderer.render(stage)

step_forward = false
animate()

start_game = ()->
  stage.removeChild(start_button.button)
  load_scene()
  step_forward = true
  timer.start()

end_game = ()->
  step_forward = false
  bull_fighter.disable_drag()
  timer.stop()
  stage.addChild(start_button.button)

timer = new Timer(position: { x: world.width - 90, y: 30 })
start_button = new StartButton(position: { x: world.width - 100, y: world.height - 50 })
start_button.button.on('mouseup', start_game).on('touchend', start_game)

stage.addChild(timer.clock)
stage.addChild(start_button.button)

bull_fighter = new BullFighter(position: { x: world.width - 100, y: world.height - 120 })
bull = new Bull(speed: 1, min_charge_distance: 200, charge_accuracy: 30, position: { x: 1, y: 1 })

stage.addChild(bull_fighter.sprite)
stage.addChild(bull.sprite)

load_scene = ()->
  bull_fighter.go_home()
  bull.go_home()
  timer.reset()

step = ()->
  timer.count()

  bull_fighter.look_at(bull)
  bull_fighter.detect_movement()

  extra_speed = bull_fighter.time_still_for() / 30
  extra_speed = if extra_speed == 0 then 1 else extra_speed

  bull.look_at(bull_fighter)
  bull.run_at(bull_fighter, extra_speed)

  if bull.collided_with(bull_fighter)
    end_game()
