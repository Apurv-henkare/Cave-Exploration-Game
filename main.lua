

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

local image1_scroll = 0
local image1_scroll_speed = 10
local image1_looping_point = 960
local ground_scroll = 0
local GROUND_SCROLL_SPEED = 60 

local image2_scroll=0;
local image3_scroll=0;
local image4_scroll=0


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
     image1=love.graphics.newImage("Images/Background_Images/background1.jpg")
     image2=love.graphics.newImage("Images/Background_Images/background2.png")
     image3=love.graphics.newImage("Images/Background_Images/background3.png")
     image4a=love.graphics.newImage("Images/Background_Images/background4.png")

     music1=love.audio.newSource("Musics/bg.mp3","stream")
    gStateMachine:change('main_menu')
    keyboard_check={}
end

function love.update(dt)
    image1_scroll = (image1_scroll + image1_scroll_speed * dt) % image1_looping_point 
    image2_scroll = (image2_scroll + (image1_scroll_speed+5) * dt) % image1_looping_point
    image3_scroll = (image3_scroll + (image1_scroll_speed+18) * dt) % image1_looping_point
    image4_scroll = (image4_scroll + (image1_scroll_speed+30) * dt) % image1_looping_point
    
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
   -- love.graphics.setColor(1,1,1)
   love.graphics.setFont(love.graphics.newFont('font.ttf',37))
    push:start()
        if(gStateMachine:getStateMachine() == "main_menu" or gStateMachine:getStateMachine() == "info") then
            love.graphics.draw(image1,-image1_scroll,0,0,1,2)
            love.graphics.draw(image2,-image2_scroll,0,0,1,2)
            love.graphics.draw(image3,-image3_scroll,0,0,1,2)
            love.graphics.draw(image4a,-image4_scroll,0,0,1,2)   
        end
        
        gStateMachine:render()
    push:finish()  
end 