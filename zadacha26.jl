function mark_lines!(r::Robot,typeOfLine::String,interval::Int) #typeOfLine - "straight" для прямых и "diagonal" для косых
    for side in (Sud,West)
        moves!(r,side)
    end
    if typeOfLine=="straight"
        while isborder(r,Ost)==false
            putmarker!(r)
            while isborder(r,Nord)==false
                move!(r,Nord)
                putmarker!(r)
            end
            for _ in 1:interval
                if isborder(r,Ost)==true
                    break
                else
                    move!(r,Ost)
                end
            end
            moves!(r,Sud)
        end
    elseif typeOfLine=="diagonal"
        n=0
        while isborder(r,Ost)==false
            putmarker!(r)
            while (isborder(r,West)==false&&isborder(r,Nord)==false)
                move!(r,Nord)
                move!(r,West)
                putmarker!(r)
            end
            while (isborder(r,Sud)==false)
                move!(r,Sud)
                move!(r,Ost)
            end
            for i in 1:interval
                if isborder(r,Ost)==true
                    n=i
                    break
                else
                    move!(r,Ost)
                end
            end
        end
        if n==2
            move!(r,Nord)
        end
        while isborder(r,Nord)==false
            putmarker!(r)
            while (isborder(r,West)==false&&isborder(r,Nord)==false)
                move!(r,Nord)
                move!(r,West)
                putmarker!(r)
            end
            while (isborder(r,Ost)==false)
                move!(r,Sud)
                move!(r,Ost)
            end
            for _ in 1:interval
                if isborder(r,Nord)==true
                    break
                else
                    move!(r,Nord)
                end
            end
        end
    end
end