function mark_angles(r)
    num_steps=[]
    while ((isborder(r,Sud)==false) || (isborder(r,West)==false))
        push!(num_steps, moves!(r, West))
        push!(num_steps, moves!(r, Sud))
    end
    for side in (Nord,Ost,Sud,West) 
        moves!(r,side)
        putmarker!(r)
    end
    for (i,n) in enumerate(num_steps)
        side = isodd(i) ? Ost : Nord
        moves!(r,side,n)
    end
end
