
function markEdge(r::Robot)
        num_steps=through_rectangles_into_angle(r,(Sud,West))
        num_stepsOst=sum(num_steps[1:2:end])
        num_stepsNord=sum(num_steps[2:2:end])
    
        moves!(r,Nord,num_stepsNord)
        putmarker!(r)
        num_stepsSud=moves!(r,Nord)
    
        moves!(r,Ost,num_stepsOst)
        putmarker!(r)
        um_stepsWest=moves!(r,Ost)
    
        moves!(r,Sud,num_stepsSud)
        putmarker!(r)
        moves!(r,Sud)
    
        moves!(r,West,num_stepsWest)
        putmarker!(r)
        moves!(r,West)
    
        movements!(r,(Ost,Nord),num_steps)
    
    end
    
    function movements!(r::Robot,sides::NTuple{2,HorizonSide},num_steps::Vector{Int})
        for (i,n) in enumerate(num_steps)
            moves!(r, sides[mod(i-1, length(sides))+1], n)
        end
    end

    function through_rectangles_into_angle(r,angle::NTuple{2,HorizonSide})
        num_steps=[]
        while isborder(r,angle[1])==false || isborder(r,angle[2]) # Робот - не в юго-западном углу
            push!(num_steps, movements!(r, angle[2]))
            push!(num_steps, movements!(r, angle[1]))
        end
        return num_steps
    end

    movements!(r::Robot, side::HorizonSide, num_steps::Int) = for _ in 1:num_steps move!(r,side) end

    movements!(r::Robot, side::HorizonSide) = while isborder(r,side)==false move!(r,side) end 