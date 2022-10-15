InfoState = Class{__includes = BaseState}

function InfoState:enter(params)
end 


function InfoState:init()

end

function InfoState:update(dt)
end

function InfoState:render()
    love.graphics.setColor(0.6,0.6,0.6)
    love.graphics.printf("NEW GAME               COMING SOON", 0, VIRTUAL_HEIGHT / 2 + 60-50,
    VIRTUAL_WIDTH, 'center')
    
end