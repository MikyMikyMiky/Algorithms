mutable struct Lines
    Horizontal::Int
    Vertical::Int
end

function countAnyLines(r::Robot)
    for side in (West,Sud)
        moves!(r,side)
    end
    lines=Lines(0,0)
    side=Ost
    while (!(isborder(r,Nord)&&isborder(r,Ost))&&!(isborder(r,Nord)&&isborder(r,West))) #если ни в правом ни левом верхнем углу
        lines.Horizontal=movingHorizontally(r,lines,false)
        if !isborder(r,side)
            move!(r,side)
        else
            steps=0
            while !isborder(r,Nord)
                move!(r,Nord)
                steps +=1
            end
            if isborder(r,side)
                for _ in 1:steps-1
                    move!(r,Sud)
                end
                side=inverse(side)
            else
                for _ in 1:steps
                    move!(r,Sud)
                end
                bypassVerticalLine(r,side)
                lines.Vertical +=1 
            end
        end
    end
    println(lines.Horizontal)
    println(lines.Vertical)
end

function movingHorizontally(r::Robot,lines::Lines,isHorizontalLine::Bool)
    if isborder(r,Nord)
        isHorizontalLine=true
    elseif isHorizontalLine
        isHorizontalLine=false
        lines.Horizontal +=1
        print("gay")
    end
    return(lines.Horizontal)
end

function bypassVerticalLine(r::Robot,side::HorizonSide)
    n=0
    while isborder(r,side)
        move!(r,Nord)
        n +=1
    end
        move!(r,side)
    for _ in 1:n
        move!(r,Sud)
    end
end
