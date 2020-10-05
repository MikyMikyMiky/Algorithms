function mark_cross(r::Robot)
    for side in (Nord,Ost,West,Sud)
        Line!(r,side)
    end
    putmarker!(r)
end


function Line!(r::Robot,side::HorizonSide)
    while isborder(r,side)==false
        move!(r,side)
        putmarker!(r)
    end
    side=reverse(side)
    while ismarker(r)==true
        move!(r,side)
    end
end

reverse(side::HorizonSide) = HorizonSide(mod(Int(side)+2,4))