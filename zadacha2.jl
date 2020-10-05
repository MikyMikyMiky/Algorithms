function mark_perimetr(r::Robot)
    nSud=moves!(r,Sud)
    nWest=moves!(r,West)
    for side in (Nord,Ost,Sud,West)
        movePaint!(r,side)
    end
    moves!(r,Nord,nSud)
    moves!(r,Ost,nWest)
end
    
function moves!(r::Robot,side::HorizonSide)
    num_steps=0
    while isborder(r,side)==false
        move!(r,side)
        num_steps+=1
    end
    return num_steps
end

function movePaint!(r::Robot,side::HorizonSide)
    while isborder(r,side)==false
        putmarker!(r)
        move!(r,side)
    end
end

function moves!(r::Robot,side::HorizonSide,num_steps::Int)
    for _ in 1:num_steps
        move!(r,side)
    end
end