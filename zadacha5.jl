function ladder(r::Robot)
    nSud=Corner(r,Sud)
    nWest=Corner(r,West)
    num_line=0
        while isborder(r,Ost)==false
            move!(r,Ost)
            num_line+=1
        end
    ladder!(r,num_line)
    while isborder(r,Sud)==false
        move!(r,Sud)
    end
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

function ladder!(r::Robot,num_length::Int)
for i in reverse(1:num_length)
    while isborder(r,West)==false
        putmarker!(r)
        move!(r,West)
    end
    putmarker!(r)
if isborder(r,Nord)==true
    break
else
    move!(r,Nord)
        if i!=1
            for __ in reverse(1:i-1)
                move!(r,Ost)
            end
        else
            putmarker(r)
    end
end
end
end

function moves!(r::Robot,side::HorizonSide,num_steps::Int)
    for _ in 1:num_steps # символ "_" заменяет фактически не используемую переменную
        move!(r,side)
    end
end
