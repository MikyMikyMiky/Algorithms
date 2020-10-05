function Zakraska(r::Robot)
    nSud=Corner(r,Sud)
    nWest=Corner(r,West)
    while ( (isborder(r,Sud)) && (isborder(r,Ost)) == false)
        stolbik(r)
        if ( (isborder(r,Sud)) && (isborder(r,Ost)) == false)
            move!(r,Ost)
            putmarker!(r)
        end
    end
    while (isborder(r,Nord)==false)
        move!(r,Nord)
        putmarker!(r)
    end
    getBack(r,Sud)
    getBack(r,West)
moves!(r,Nord,nSud)
moves!(r,Ost,nWest)
end


    function Corner(r::Robot,side::HorizonSide)
        num_steps=0
        while isborder(r,side)==false
        move!(r,side)
        num_steps+=1
        end
        return num_steps
    end

    function stolbik(r::Robot)
        while isborder(r,Nord)==false
            putmarker!(r)
            move!(r,Nord)
        end
        putmarker!(r)
        while isborder(r,Sud)==false
            move!(r,Sud)
        end
    end
    
    function getBack(r::Robot,side::HorizonSide)
        while (isborder(r,side)==false)
            move!(r,side)
        end
    end

    function moves!(r::Robot,side::HorizonSide,num_steps::Int)
        for _ in 1:num_steps # символ "_" заменяет фактически не используемую переменную
            move!(r,side)
        end
    end


      
