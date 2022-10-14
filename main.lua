

push = require "push"
Class = require 'class'
require "States/BaseState"
require "States/MainMenuState"
require "States/PlayState"
require "States/LevelState"
require "States/MainMenuState"
require "States/InfoState"
require "States/CreditState"
require "StateMachine"
require "Constant"

function love.load()
    push:setupScreen(WINDOW_WIDTH, WINDOW_HEIGHT,1280,780,{
        vsync = true,
        fullscreen = true,
        resizable = true,
        pixelperfect=false, highdpi = true ,stretched = true
    })
    gStateMachine = StateMachine {
        ['main_menu'] = function()
            return MainMenuState()
        end,
        ['play'] = function()
            return PlayState()
        end,
        ['game-over'] = function()
            return GameOverState()
        end,
        ['levels'] = function()
            return LevelState()
        end,
        ['info'] = function()
            return InfoState()
        end,
        ['credits'] = function()
            return CreditState()
        end

    }
    gStateMachine:change('main_menu')
    keyboard_check={}
end

function love.update(dt)
    
    gStateMachine:update(dt)
    keyboard_check={}

end
function love.resize(w,h)
    push:resize(w,h)
end 

function love.keypressed(key)
    if key == 'escape' then 
        love.event.quit()
    end 
    keyboard_check[key]=true
end 

function love.keyboard.wasPressed(key)
    if keyboard_check[key] then
      return true
    else
      return false
    end
end

function love.draw()
    push:start()
        gStateMachine:render()
    push:finish()  
end 