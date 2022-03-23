local foods = require "foods"



function love.load()
    local foods = require "foods"
    pause = false
    font=love.graphics.newFont(40)
    throughtput=1.0
    food_type_price=3
    food_consumed_pop=0.5
    multi=3
    cycles=0
    coefficent_innovation=0.01
    coefficent_risparmio=0
    Pop={food=500, number=10, t_1=0, money=0, salary=20}
    function Pop:new (o)
        o = o or {}   -- create object if user does not provide one
        setmetatable(o, self)
        self.__index = self
        return o
    end
    ananas={output=0.9,value=3}
    Pops={}
    for i= 1,3 do 
        Pops[i]=Pop:new{food=500, number=10, t_1=0, money=0, salary=20}
    end


    farm_industry= {pops=Pops, out=0 ,size=1, food_type=ananas, capital=0, dividends_rate=0.5}


    function farm_industry:Update()
        function farm_industry.Output()
            farm_industry.out=farm_industry.pops[1].number*farm_industry.food_type.output 
        end
        function farm_industry.Income()
            farm_industry.income=farm_industry.out*farm_industry.food_type.value   
        end

        function farm_industry.Expences()
            farm_industry.salary_expence=farm_industry.pops[1].number*farm_industry.pops[1].salary
            farm_industry.pops[1].money=farm_industry.pops[1].money+farm_industry.salary_expence
            farm_industry.expence=farm_industry.salary_expence

        end

        function farm_industry.Balance()
            farm_industry.balance=farm_industry.income*farm_industry.expence
        end

        function farm_industry.Capital()
            farm_industry.capital=farm_industry.capital+farm_industry.balance
        end

        function farm_industry.Investment()
            farm_industry.dividends=farm_industry.capital*farm_industry.dividends_rate
            farm_industry.pops[2].money=farm_industry.pops[2].money+(farm_industry.dividends/farm_industry.pops[2].number)
        end

        farm_industry.Output()
        farm_industry.Income()
        farm_industry.Expences()
        farm_industry.Balance()
        farm_industry.Capital()
        farm_industry.Investment()
    end


    function throughtput(pop,cylces)
        x=((1/1.01)^pop+(math.cos(pop)+1)/50+ math.random(0.1,0.2))*(multi);  
        return x
    end



    function Pop.Update()
        function Pop.Food()
            Pop.food_need=Pop.number*2
            Pop.food_need_cost=Pop.food_need*ananas.value
            if Pop.money > Pop.food_need_cost then
                Pop.money = Pop.money - food_need_cost
                Pop.food_supply=100
            else
                Pop.food_supply=((Pop.money/ananas.value)/Pop.food_need)*100
                Pop.money=0
            end
 
        end
        function Pop.Change()
            if Pop.food_supply >80 then
                Pop.number=Pop.number+1
            end
            if Pop.food_supply<40 then
                Pop.number=Pop.number-1
            end

        end
        Pop.Food()
        Pop.Change()

    end

end












function love.update(dt)
        farm_industry.Update()

        farm_industry.pops[1].Update()



        cycles=cycles+1
end

function love.draw()

    love.graphics.setColor(1,0,0)
    love.graphics.setColor(1,1,1)
    love.graphics.print(cycles,font,0,150) 
    --[[
    for i= 1,3 do
        love.graphics.print( string.format(
            "%.2f", Pops[i].food ),font,100*i,0) 
        love.graphics.print(Pops[i].number,font,100*i,50)
    end
    ]]
    love.graphics.print(farm_industry.pops[1].food_need,font,400,50)
    love.graphics.print(farm_industry.pops[2]['money'],font,400,100)
    love.graphics.print(farm_industry.salary_expence,font,400,150)

end

