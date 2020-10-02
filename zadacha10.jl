n=0
function mark_cross(r::Robot)
putmarker!(r)
cross(r,Nord,Ost)
cross(r,Nord,West)
cross(r,Sud,Ost)
cross(r,Sud,West)
end

function cross(r::Robot,sideV::HorizonSide,sideH::HorizonSide)  #H-horizontal,V-vertical
    global n
    while ((isborder(r,sideV)==false)&&(isborder(r,sideH)==false))
        move!(r,sideH)
        move!(r,sideV)
        putmarker!(r)
        n+=1
    end
    side1=reverse(sideH)
    side2=reverse(sideV)
    for _ in 1:n
        move!(r,side1)
        move!(r,side2)
    end
    n=0
end

reverse(side::HorizonSide) = HorizonSide(mod(Int(side)+2,4))