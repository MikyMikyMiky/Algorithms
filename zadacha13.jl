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
    for _ in 1:n
        move!(r,reverse(sideH))
        move!(r,reverse(sideV))
    end
    n=0
end

reverse(side::HorizonSide) = HorizonSide(mod(Int(side)+2,4))
