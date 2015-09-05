world = {width: window.innerWidth, height: window.innerHeight }
renderer = PIXI.autoDetectRenderer(world.width, world.height,{backgroundColor : 0xCC9B36})

document.body.appendChild(renderer.view)
stage = new PIXI.Container

difficulty = 3
step_forward = false

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

start_button = new StartButton(world)
stage.addChild(start_button.button)
start_button.button.on('mouseup', start_game)

bull_fighter = new BullFighter(world)
bull = new Bull(difficulty)
timer = new Timer(world)

stage.addChild(bull_fighter.sprite)
stage.addChild(bull.sprite)
stage.addChild(timer.clock)

load_scene = ()->
  bull_fighter.go_home()
  bull.go_home()
  timer.reset()

step = ()->
  timer.count()

  bull_fighter.look_at(bull)
  bull_fighter.detect_movement()

  extra_speed = bull_fighter.time_still_for()

  bull.look_at(bull_fighter)
  bull.run_at(bull_fighter, extra_speed)

  if bull.collided_with(bull_fighter) || bull.killed_by(world)
    end_game()

animate = ()->
  requestAnimationFrame(animate)
  if step_forward then step()
  renderer.render(stage)

animate()
