function love.load()
    pause = false
    pops=5
    food=50
    font=love.graphics.newFont(40)
    throughtput=1.0
    food_consumed_pop=0.5
    multi=1
    cycles=0
    coefficent_innovation=0.01
    coefficent_risparmio=0
 
end

local function throughtput(pop,cylces)
    x=(math.pow((1/1.01),pop)+(math.cos(pop)+1)/50+ math.random(-0.01,0.015))*(multi);  
    return x
end

local function pop_variations(food_consumed_pop,food)
    pop_variation=math.floor((food/food_consumed_pop)/50)
    return pop_variation

end

function innovation(money,coefficent_innovation)
    a=1
end



function love.update(dt)
    --love.timer.sleep(0.05)
    function love.keypressed(key, unicode)
	 	if key == 'p' then 
            pause = not pause 
        end
    end
    if pause==false then
        t_1=throughtput(pops,cycles)
        food_produced=pops*t_1
        food_consumed=food_consumed_pop*pops 
        delta=food_produced-food_consumed
        food=food+delta
        pops=pops+pop_variations(food_consumed_pop,food)
        if food<0 then
            food=0
        end
        cycles=cycles+1
    end
    
end

function love.draw()
    if pause then love.graphics.print("Game is paused",250,0) else 
        love.graphics.print("Game is running",250,0) end
    love.graphics.setColor(1,0,0)
    love.graphics.setColor(1,1,1)
    love.graphics.print(pops, font)
    love.graphics.print(food,font,0,100) 
    love.graphics.print(cycles,font,0,150) 
    pop_loss=pop_variations(food_consumed_pop,food)
    love.graphics.print(pop_loss,font,0,200) 
    love.graphics.print(t_1, font,0,50)


end

