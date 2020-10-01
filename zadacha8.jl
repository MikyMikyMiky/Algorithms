n=1
side=Ost
function findEntrance(r::Robot)
    while isborder(r,Nord)==true
        global n,side
        for _ in 1:n
            move!(r,side)
        end
        n=n+1
        if side==Ost
            side=West
        else side = Ost
        end
    end
end

