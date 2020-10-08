x=1
y=1
cellSize=0

function mark_chess(r::Robot,n::Int)
    global cellSize
    cellSize = n
    moves!(r,Nord)
    moves!(r,West)
    side=Sud
    while (isborder(r,Ost)==false)
        mark_line(r,side,cellSize)
        side=inverse(side)
        move_decart!(r,Ost)
    end
    mark_line(r,side,cellSize)
end


function mark_line(r::Robot,side::HorizonSide,cellSize::Int64)       
    putmarker_chess!(r,cellSize)
    while isborder(r,side)==false
        move_decart!(r,side)
        putmarker_chess!(r,cellSize)
    end
end

function putmarker_chess!(r::Robot,cellSize::Int64)
if (((mod(x-1,2*cellSize)<=cellSize-1)&&(mod(y-1,2*cellSize)<=cellSize-1))||((mod(x-1,2*cellSize)>cellSize-1)&&(mod(y-1,2*cellSize)>cellSize-1)))
    putmarker!(r)
end
end

function move_decart!(r,side)
    global x, y
    if side==Nord
        y-=1
    elseif side==Sud
        y+=1
    elseif side==Ost
        x+=1
    else
        x-=1
    end
    move!(r,side)
end

inverse(side::HorizonSide) = HorizonSide(mod(Int(side)+2,4))

function moves!(r,side)
    num_steps=0
    while isborder(r,side)==false
        move!(r,side)
        num_steps+=1
    end
    return num_steps
end
