x=1
y=1
n=0 #кол во шагов до юго-запад

function chess(r::Robot)
    putmarker!(r)
    global n
    n=corner(r,Nord)
    n=n+corner(r,West)
    if (mod(n,2)==1)
    chess!(r,1)
else
    chess!(r,0)
end
end

function corner(r::Robot,side::HorizonSide)
    num_steps=0
    if isborder(r,side)==true
        return 0
    else
    while isborder(r,side)==false
        move!(r,side)
        num_steps+=1
    end
    return num_steps
end
end

function moves!(r::Robot,side::HorizonSide)
    while isborder(r,side)==false
        move!(r,side)
    end
end

function chess!(r::Robot,num::Int)
    global x,y
while true
    if (mod(x+y,2)==num)
        putmarker!(r)
    end
    while isborder(r,Sud)==false
        move!(r,Sud)
        x+=1
        if (mod(x+y,2)==num)
            putmarker!(r)
        end
    end
    moves!(r,Nord)
    if isborder(r,Ost)==true
        break
    else
        move!(r,Ost)
        y+=1
    end
end
end