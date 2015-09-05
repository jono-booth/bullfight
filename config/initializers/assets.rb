Rails.application.config.assets.version = '1.0'
Rails.application.config.assets.precompile += %w( pixi.min.js
                                                  game.js
                                                  start_button.js
                                                  moveable_object.js
                                                  timer.js
                                                  bull_fighter.js
                                                  bull.js
                                                )
