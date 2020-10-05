function midTemp(r::Robot)
    global tSum=0
    global n=0
    while ((isborder(r,Nord)==false)&&(isborder(r,Ost)==false))
        temp(r,Nord)
        if (isborder(r,Ost)==true)
            break
        end
        move!(r,Ost)
        temp(r,Sud)
        if (isborder(r,Ost)==true)
            break
        end
        move!(r,Ost)
        end
        Temp=tSum/n
        print(Temp)
    end

    function temp(r::Robot,side::HorizonSide)
        global tSum,n
        if ismarker(r)==true
            tSum+=temperature(r)
            n+=1
        end
        while (isborder(r,side)==false)
            move!(r,side)
            if ismarker(r)==true
                tSum+=temperature(r)
                n+=1
            end
        end
    end
