function love.load()
    pops=5
    food=100
    font=love.graphics.newFont(40)
    throughtput=1.0
    food_consumed_pop=2
    multi=5
    cycles=0
 
end

local function throughtput(pop)
    x=math.pow((1/1.01),pop)*multi;
    
    return x
end
local function pop_variation(food_produced,food_consumed,food)
    if (food-food_consumed)<0 then
        food_deficit=math.abs(food-food_consumed)
        pop_loss = math.floor(food_deficit/food_consumed_pop)

    else 
        pop_loss=0
    end
    return pop_loss
end


function love.update(dt)

    t_1=throughtput(pops)
    food_produced=pops*t_1
    food_consumed=food_consumed_pop*pops 
    food=food+food_produced
    food=food-food_consumed
    if food>0 then
        delta_pop=math.floor(pops/2)
        pops=pops+1
    else 
        pop_loss=pop_variation(food_produced,food_consumed,food)
        pops=pops-pop_loss
        food=0
        if pops<0 then
            pops=0
        end
    end
    cycles=cycles+1

end

function love.draw()
    love.graphics.setColor(1,0,0)
    love.graphics.rectangle('fill',300,250,200,100)
    love.graphics.setColor(1,1,1)
    love.graphics.print(pops, font)
    love.graphics.print(t_1, font,100,200)
    love.graphics.print(food,font,200,100) 
    love.graphics.print(cycles,font,250,150) 
end

