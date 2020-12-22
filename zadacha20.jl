function countHorizontalLines(r::Robot)
    for side in (West,Sud)
        moves!(r,side)
    end
    Lines=0
    isLineUp=0
    while (!(isborder(r,Nord)||isborder(r,Ost)))
        while isborder(r,Ost)==false
            if isborder(r,Nord)==true
                isLineUp=1
            elseif isLineUp==1 #если сверху нет линии
                Lines=Lines+1
                isLineUp=0
            end
            move!(r,Ost)
        end
        move!(r,Nord)
        moves!(r,West)
    end
    print(Lines)      
end

