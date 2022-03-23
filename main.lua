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
    ananas={output=0.9,value=3}
    Pop1=Pop
    Pops={}
    for i= 1,3 do
        Pops[i]=Pop
    end

    farm_industry= {pops=Pops, out=0 ,size=1, food_type=ananas, capital=0, dividends_rate=0.5}


    function farm_industry.Update()
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
            farm_industry.pops[3]=farm_industry.pops[3].money+(farm_industry.dividends/farm_industry.pops[3].number)
        end

        farm_industry.Output()
        farm_industry.Income()
        farm_industry.Expences()
        farm_industry.Balance()
        farm_industry.Capital()
    end


    function throughtput(pop,cylces)
        x=(math.pow((1/1.01),pop)+(math.cos(pop)+1)/50+ math.random(0.1,0.2))*(multi);  
        return x
    end

    function Pop.Update()
        function Pop.Food()
            Pop.t_1=throughtput(Pop.number,cycles)
            food_produced=(Pop.number+1)*Pop.t_1
            food_consumed=(food_consumed_pop+math.log(Pop.number+1))*Pop.number
            delta=food_produced-food_consumed
            Pop.food=Pop.food+delta
            if Pop.food<0 then
                Pop.food=0
            end
        end
        function Pop.Change()
            pops_variation=math.floor(((Pop.food+delta)/food_consumed_pop)/5)
            Pop.number=Pop.number+pops_variation
            if Pop.number<=0 then
                Pop.number=1
            end
        end
        Pop.Food()
        Pop.Change()

    end
    
 
end












function love.update(dt)
        farm_industry.Update()
        for i= 1,3 do
            farm_industry.pops[i].Update()
        end
        cycles=cycles+1
end

function love.draw()

    love.graphics.setColor(1,0,0)
    love.graphics.setColor(1,1,1)
    love.graphics.print(cycles,font,0,150) 
    for i= 1,3 do
        love.graphics.print( string.format(
            "%.2f", Pops[i].food ),font,100*i,0) 
        love.graphics.print(Pops[i].number,font,100*i,50)
    end
    love.graphics.print(farm_industry.pops[1].money,font,400,50)
    love.graphics.print(farm_industry.pops[2].money,font,400,100)
    love.graphics.print(farm_industry.salary_expence,font,400,150)

end

