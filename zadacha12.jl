x=1
y=1
cellSize=0

function mark_chess(r::Robot,n::Int)
    global cellSize
    cellSize = n
    nSud=moves!(r,Nord)
    nOst=moves!(r,West)
    side=Sud
    while (isborder(r,Ost)==false)
        mark_line(r,side,cellSize)
        side=inverse(side)
        move_decart!(r,Ost)
    end
    mark_line(r,side,cellSize)
    moves!(r,Nord)
    moves!(r,West)
    moves!(r,Sud,nSud)
    moves!(r,Ost,nOst)
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

