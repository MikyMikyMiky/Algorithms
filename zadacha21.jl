mutable struct Lines
    Horizontal::Int
    Vertical::Int
end

isHorizontalLine=false

function countAnyLines(r::Robot)
    goToStartingPoint(r)
    lines=Lines(0,0)
    side=Ost
    while (!(isborder(r,Nord)&&isborder(r,Ost))&&!(isborder(r,Nord)&&isborder(r,West))) #если ни в правом ни левом верхнем углу
        lines.Horizontal=movingHorizontally(r,lines)
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
                lines.Vertical=bypassVerticalLine(r,side,lines)
            end
        end
    end
    println(lines.Horizontal)
    println(lines.Vertical)
end

function movingHorizontally(r::Robot,lines::Lines)
    global isHorizontalLine
    if isborder(r,Nord)
        isHorizontalLine=true
    elseif isHorizontalLine
        isHorizontalLine=false
        lines.Horizontal +=1
    end
    return(lines.Horizontal)
end

function bypassVerticalLine(r::Robot,side::HorizonSide,lines::Lines)
    n=0
    while isborder(r,side)
        move!(r,Nord)
        n +=1
    end
    if n>1
        lines.Vertical -=1
    end
        move!(r,side)
    for _ in 1:n
        move!(r,Sud)
    end
    lines.Vertical +=1
end

function goToStartingPoint(r::Robot)
    while (!(isborder(r,West)&&isborder(r,Sud)))
        if !isborder(r,West)
            move!(r,West)
        else
            n=0
            while (!isborder(r,Nord)&&isborder(r,West))
                move!(r,Nord)
                n +=1
            end
            if isborder(r,West)
                moves!(r,Sud)
            else
                move!(r,West)
                for _ in 1:n
                    move!(r,Sud)
                end
            end
        end
    end
end
