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
    farm_industry= {pop_salary=20}
    Pop={food=500, number=10, t_1=0, money=100, salary=10, food_supply=100, work_industry=farm_industry}
    function Pop:new (o)
        o = o or {}   -- create object if user does not provide one
        setmetatable(o, self)
        self.__index = self
        return o
    end
    ananas={output=0.9,value=3,produced=0,sold=0,stock=0}
    Pops={}
    for i= 1,3 do 
        Pops[i]=Pop:new{}
    end


    farm_industry= {pops=Pops, out=0 ,size=1, food_type=ananas, capital=0, dividends_rate=0.5, pop_salary=20}


    function farm_industry:Update()
        function farm_industry.Output()
            farm_industry.out=math.floor(farm_industry.pops[1].number*throughtput(farm_industry.pops[1].number))
            farm_industry.food_type.produced=farm_industry.food_type.produced+ farm_industry.out
        end
        function farm_industry.Income()
            farm_industry.income=farm_industry.out*farm_industry.food_type.value   
        end

        function farm_industry.Expences()
            farm_industry.salary_expence=farm_industry.pops[1].number*farm_industry.pop_salary
            farm_industry.expence=farm_industry.salary_expence

        end

        function farm_industry.Balance()
            farm_industry.balance=farm_industry.income-farm_industry.expence
            if farm_industry.balance>(farm_industry.income*0.1) then
                farm_industry.pop_salary=farm_industry.pop_salary+0.1
            else
                farm_industry.pop_salary=farm_industry.pop_salary-0.1
            end
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
        x=(1/1.01)^pop+0.1+(cycles/10000)^3
        return x
    end
    function ananas.Update( )
        function ananas.value_change()
            if ananas.produced >= ananas.sold then
                ananas.value=ananas.value-((ananas.produced-ananas.sold)/ananas.produced)*ananas.value
            else
                ananas.value=ananas.value+((ananas.sold-ananas.produced)/ananas.produced)*ananas.value
            end

        end
        ananas.value_change()

    end
        
    



    function Pop.Update()
        function Pop.Salary()
            Pop.salary=Pop.work_industry.pop_salary
            Pop.money=Pop.money+Pop.salary*Pop.number
        end
        function Pop.Food()
            Pop.food_need=Pop.number*food_consumed_pop
            Pop.food_need_cost=Pop.food_need*ananas.value
            if Pop.money > Pop.food_need_cost then
                Pop.money = Pop.money - Pop.food_need_cost
                Pop.food_supply=100
                ananas.sold=math.floor(ananas.sold+Pop.food_need)
            else
                Pop.food_supply=((Pop.money/ananas.value)/Pop.food_need)*100
                ananas.sold=math.floor(ananas.sold+(Pop.money/ananas.value))
                Pop.money=0
            end

        end
        function Pop.Change()
            if Pop.food_supply >(math.random(50,70)+math.random()) then
                Pop.number=Pop.number+math.random(1,10)
            end
            if Pop.food_supply<(math.random(20,50)+math.random()) then
                Pop.number=Pop.number-math.random(1,10)

            end

        end
        Pop.Salary()
        Pop.Food()
        Pop.Change()
    end
    
end












function love.update(dt)

        farm_industry.pops[1].Update()
        farm_industry.Update()
        ananas.Update()
        --love.timer.sleep(0.5)
        
  


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
    love.graphics.print(farm_industry.pops[1].food_need_cost,font,400,50)
    love.graphics.print(farm_industry.pops[1].number,font,400,100)
    love.graphics.print(farm_industry.pops[1].food_supply,font,400,150)
    love.graphics.print(farm_industry.pops[1].money,font,400,200)
    love.graphics.print(ananas.sold,font,100,0)
    love.graphics.print(ananas.produced,font,100,50)
    love.graphics.print(string.format(ananas.value ),font,100,300)
    love.graphics.print(string.format("%.2f", farm_industry.capital ),font,100,150)
    love.graphics.scale(0.2, 0.2)
    love.graphics.draw(mela, 20, 20,x)
    ananas.produced=0
    ananas.sold=0


end




