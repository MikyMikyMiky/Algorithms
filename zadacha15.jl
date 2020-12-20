function mark_perimetr(r::Robot)
    movements!(r,Nord)
    moves!(r,West)
    for side in (Sud,Ost,Nord,West)
        putmarker!(r)
        move!(r,side)
    end
end

function move_if_possible!(r::Robot, side::HorizonSide)::Bool
    right_side = right(side)
    reverse_side = inverse(right_side)
    num_steps=0
    while isborder(r,side) == true
        if isborder(r, right_side) == false
            move!(r,right_side)
            num_steps += 1
        else
            break
        end
    end
    if isborder(r,side) == false
        while isborder(r,side) == false
            move!(r,side)
        end
        result = true
    else
        result = false
    end
    move!(r,reverse_side)
    return result
end

movements!(r::Robot, side::HorizonSide) =
while isborder(r,side)==false
    move_if_possible!(r,side)
end

right(side::HorizonSide) = HorizonSide(mod(Int(side)+1,4))