function markersAllOver(r::Robot)
    mark_row(r,Ost)
    horizSide=Ost #horizSide-горизонтальная сторона (Ost или West)
    while isborder(r,horizSide)==false
        move!(r,Nord)
        horizSide=inverse(horizSide)
        mark_row(r,horizSide)
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

function mark_row(r::Robot,side::HorizonSide)
    putmarker!(r)
    while move_if_posible!(r,side) == true
        putmarker!(r)
    end
end
