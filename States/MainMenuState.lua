MainMenuState = Class{__includes = BaseState}

-- whether we're highlighting "Start" or "High Scores"
local highlighted = 1

function MainMenuState:enter(params)
end 

function MainMenuState:init()
  
end 

function MainMenuState:update(dt)
  

     -- toggle highlighted option if we press an arrow key up or down
     if love.keyboard.wasPressed('up')then
        if highlighted == 1 then 
            highlighted = 5
        end 
         
        highlighted =(highlighted-1)%5
        --gSounds['paddle-hit']:play()
    end  

    if love.keyboard.wasPressed('down')then
        if highlighted == 4 then 
            highlighted = 0
        end 
        highlighted =(highlighted+1)%5
        --gSounds['paddle-hit']:play()
    end
    

    -- confirm whichever option we have selected to change screens
    if love.keyboard.wasPressed('enter') or love.keyboard.wasPressed('return') then
        --gSounds['confirm']:play()

        if highlighted == 1 then
            gStateMachine:change('play')
        elseif  highlighted == 2 then
            gStateMachine:change('levels')
        elseif highlighted ==  3 then
            gStateMachine:change('info')
        elseif highlighted ==  4 then
            gStateMachine:change('credits')
        end
    end

    -- we no longer have this globally, so include here


end 


function MainMenuState:render()
    love.graphics.setFont(love.graphics.newFont(35))
    --love.graphics.draw(self.image,0,0,0,1,1)
   
    --love.graphics.draw(self.vibo,500-360,-200-50-60,0,1.75,1.75)

    -- instructions
 --   love.graphics.setFont(gFonts['medium'])

    -- if we're highlighting 1, render that option blue
    if highlighted == 1 then
        love.graphics.setColor(103/255, 1, 1, 1)
    end
    love.graphics.printf("START", 0, VIRTUAL_HEIGHT / 2 + 50-50,
        VIRTUAL_WIDTH, 'center')

    -- reset the color
    love.graphics.setColor(1, 1, 1, 1)

    -- render option 2 blue if we're highlighting that one
    if highlighted == 2 then
        love.graphics.setColor(103/255, 1, 1, 1)
    end
    love.graphics.printf("LEVELS", 0, VIRTUAL_HEIGHT / 2 + 150-50,
        VIRTUAL_WIDTH, 'center')
    
        love.graphics.setColor(1, 1, 1, 1)
    if highlighted == 3 then
            love.graphics.setColor(103/255, 1, 1, 1)
    end
    love.graphics.printf("INSTRUCTIONS", 0, VIRTUAL_HEIGHT / 2 + 250-50,
            VIRTUAL_WIDTH, 'center')

    -- reset the color
    love.graphics.setColor(1, 1, 1, 1)

    if highlighted == 4 then
        love.graphics.setColor(103/255, 1, 1, 1)
    end

    love.graphics.printf("CREDITS", 0, VIRTUAL_HEIGHT / 2 + 350-50,
            VIRTUAL_WIDTH, 'center')

    -- reset the color
    love.graphics.setColor(1, 1, 1, 1)
end 