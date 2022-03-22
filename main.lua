local foods = require "foods"



function love.load()
    local foods = require "foods"
    pause = false
    font=love.graphics.newFont(40)
    throughtput=1.0
    food_consumed_pop=0.5
    multi=3
    cycles=0
    coefficent_innovation=0.01
    coefficent_risparmio=0
    food_price=3
    Pop={Food=500, Number=10, t_1=0}
    Pop1=Pop
    Pops={}
    for i= 1,3 do
        Pops[i]=Pop
    end

    farm_industry= {pops=pops, out=0 ,size=1, food_type=0.9}


    function farm_industry.Update()
        function farm_industry.Output()
            farm_industry.out=farm_industry.pops*food_type
        end
        farm_industry.Output()

    end


    function throughtput(pop,cylces)
        x=(math.pow((1/1.01),pop)+(math.cos(pop)+1)/50+ math.random(0.1,0.2))*(multi);  
        return x
    end

    function Pop.Update()
        function Pop.food()
            Pop.t_1=throughtput(Pop.Number,cycles)
            food_produced=(Pop.Number+1)*Pop.t_1
            food_consumed=(food_consumed_pop+math.log(Pop.Number+1))*Pop.Number
            delta=food_produced-food_consumed
            Pop.Food=Pop.Food+delta
            if Pop.Food<0 then
                Pop.Food=0
            end
        end
        function Pop.Change()
            pops_variation=math.floor(((Pop.Food+delta)/food_consumed_pop)/5)
            Pop.Number=Pop.Number+pops_variation
            if Pop.Number<=0 then
                Pop.Number=1
            end
        end
        Pop.food()
        Pop.Change()

    end
    
 
end












function love.update(dt)
    --love.timer.sleep(0.05)
    function love.keypressed(key, unicode)
	 	if key == 'p' then 
            pause = not pause 
        end
    end
        Pop1.Update()
        cycles=cycles+1
    
end

function love.draw()
    if pause then love.graphics.print("Game is paused",250,0) else 
        love.graphics.print("Game is running",250,0) end
    love.graphics.setColor(1,0,0)
    love.graphics.setColor(1,1,1)
    love.graphics.print(cycles,font,0,150) 
    for i= 1,3 do
        love.graphics.print(Pops[i].Food,font,100*i,0) 
        love.graphics.print(Pops[i].Number,font,100*i,50) 
        love.graphics.print(Pops[i].t_1,font,100*i,100) 
    end
end

