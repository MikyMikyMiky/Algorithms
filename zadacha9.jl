n=1
side=Nord
function findMarker(r::Robot)
    global n,side
    while (ismarker(r)==false)
        for _ in 0:1
        moves!!(r,side,n)
        side=increment(side)
        end
        n+=1
    end
end

function moves!!(r::Robot,side::HorizonSide,n::Int)
    for _ in 1:n
        if ismarker(r)==true
            break
        end
    move!(r,side)
end
end

increment(side::HorizonSide) = HorizonSide(mod(Int(side)+1,4))