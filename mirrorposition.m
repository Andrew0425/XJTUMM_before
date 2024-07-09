tic
index = 0;
result = [];
Dx = 0;
Dy = -200;
R1=21;
R2=21;
R3=24;
R4=24;
for R = 100:R1:4*R1+99%24改为21；195改成204
    t = floor(2*pi*R/12);
    for i = 1:2:t
        index = index + 2;
        k = tan(i*pi/t);
        syms x y;
        f1 = k*x-y;
        f2 = x^2+y^2-R^2;
        [x,y] = solve([f1,f2],[x,y]);
        x = double(x);
        y = double(y);
        if (x(1)+Dx)^2+(y(1)+Dy)^2 <= 350^2
            result(index-1,1) = x(1)+Dx;
            result(index-1,2) = y(1)+Dy;
        else
            index = index-1;
        end
        if (x(2)+Dx)^2+(y(2)+Dy)^2 <= 350^2
            result(index,1) = x(2)+Dx;
            result(index,2) = y(2)+Dy;
        else
            index = index - 1;
        end
    end
end

for R = 4*R1+100:R2:4*R1+99+3*R2%24改21，267改258
    t = floor(2*pi*(100+3.5*R1)/12);
    for i = 1:2:t
        index = index + 2;
        k = tan(i*pi/t);
        syms x y;
        f1 = k*x-y;
        f2 = x^2+y^2-R^2;
        [x,y] = solve([f1,f2],[x,y]);
        x = double(x);
        y = double(y);
        if (x(1)+Dx)^2+(y(1)+Dy)^2 <= 350^2
            result(index-1,1) = x(1)+Dx;
            result(index-1,2) = y(1)+Dy;
        else
            index = index-1;
        end
        if (x(2)+Dx)^2+(y(2)+Dy)^2 <= 350^2
            result(index,1) = x(2)+Dx;
            result(index,2) = y(2)+Dy;
        else
            index = index - 1;
        end
    end
end

for R = 4*R1+100+3*R2:R3:6*R3+4*R1+99+3*R2%268改259
    t = floor(2*pi*(4*R1+80+3*R2)/12);
    for i = 1:2:t
        index = index + 2;
        k = tan(i*pi/t);
        syms x y;
        f1 = k*x-y;
        f2 = x^2+y^2-R^2;
        [x,y] = solve([f1,f2],[x,y]);
        x = double(x);
        y = double(y);
        if (x(1)+Dx)^2+(y(1)+Dy)^2 <= 350^2
            result(index-1,1) = x(1)+Dx;
            result(index-1,2) = y(1)+Dy;
        else
            index = index-1;
        end
        if (x(2)+Dx)^2+(y(2)+Dy)^2 <= 350^2
            result(index,1) = x(2)+Dx;
            result(index,2) = y(2)+Dy;
        else
            index = index - 1;
        end
    end
end
for R = 6*R3+4*R1+100+3*R2:R4:700
    t = floor(2*pi*360/12);
    for i = 1:2:t
        index = index + 2;
        k = tan(i*pi/t);
        syms x y;
        f1 = k*x-y;
        f2 = x^2+y^2-R^2;
        [x,y] = solve([f1,f2],[x,y]);
        x = double(x);
        y = double(y);
        if (x(1)+Dx)^2+(y(1)+Dy)^2 <= 350^2
            result(index-1,1) = x(1)+Dx;
            result(index-1,2) = y(1)+Dy;
        else
            index = index-1;
        end
        if (x(2)+Dx)^2+(y(2)+Dy)^2 <= 350^2
            result(index,1) = x(2)+Dx;
            result(index,2) = y(2)+Dy;
        else
            index = index - 1;
        end
    end
end

for R = 100+0.5*R1:R1:99+3.5*R1
    t = floor(2*pi*R/12);
    for i = 2:2:t
        index = index + 2;
        k = tan(i*pi/t);
        syms x y;
        f1 = k*x-y;
        f2 = x^2+y^2-R^2;
        [x,y] = solve([f1,f2],[x,y]);
        x = double(x);
        y = double(y);
        if (x(1)+Dx)^2+(y(1)+Dy)^2 <= 350^2
            result(index-1,1) = x(1)+Dx;
            result(index-1,2) = y(1)+Dy;
        else
            index = index-1;
        end

        
        if (x(2)+Dx)^2+(y(2)+Dy)^2 <= 350^2
            result(index,1) = x(2)+Dx;
            result(index,2) = y(2)+Dy;
        else
            index = index - 1;
        end
    end
end

for R = 100+3.5*R1:R2:99+3.5*R1+3*R2%255改246
    t = floor(2*pi*(100+3.5*R1)/12);
    for i = 2:2:t
        index = index + 2;
        k = tan(i*pi/t);
        syms x y;
        f1 = k*x-y;
        f2 = x^2+y^2-R^2;
        [x,y] = solve([f1,f2],[x,y]);
        x = double(x);
        y = double(y);
        if (x(1)+Dx)^2+(y(1)+Dy)^2 <= 350^2
            result(index-1,1) = x(1)+Dx;
            result(index-1,2) = y(1)+Dy;
        else
            index = index-1;
        end

        
        if (x(2)+Dx)^2+(y(2)+Dy)^2 <= 350^2
            result(index,1) = x(2)+Dx;
            result(index,2) = y(2)+Dy;
        else
            index = index - 1;
        end
    end
end

for R = 100+3.5*R1+3*R2:R3:99+3.5*R1+3*R2+6*R3%256改247
    t = floor(2*pi*(80+3.5*R1+3*R2)/12);
    for i = 2:2:t
        index = index + 2;
        k = tan(i*pi/t);
        syms x y;
        f1 = k*x-y;
        f2 = x^2+y^2-R^2;
        [x,y] = solve([f1,f2],[x,y]);
        x = double(x);
        y = double(y);
        if (x(1)+Dx)^2+(y(1)+Dy)^2 <= 350^2
            result(index-1,1) = x(1)+Dx;
            result(index-1,2) = y(1)+Dy;
        else
            index = index-1;
        end

        
        if (x(2)+Dx)^2+(y(2)+Dy)^2 <= 350^2
            result(index,1) = x(2)+Dx;
            result(index,2) = y(2)+Dy;
        else
            index = index - 1;
        end
    end
end

for R = 100+3.5*R1+3*R2+6*R3:R4:700
    t = floor(2*pi*(80+3.5*R1+3*R2+6*R3)/12);
    for i = 2:2:t
        index = index + 2;
        k = tan(i*pi/t);
        syms x y;
        f1 = k*x-y;
        f2 = x^2+y^2-R^2;
        [x,y] = solve([f1,f2],[x,y]);
        x = double(x);
        y = double(y);
        if (x(1)+Dx)^2+(y(1)+Dy)^2 <= 350^2
            result(index-1,1) = x(1)+Dx;
            result(index-1,2) = y(1)+Dy;
        else
            index = index-1;
        end

        
        if (x(2)+Dx)^2+(y(2)+Dy)^2 <= 350^2
            result(index,1) = x(2)+Dx;
            result(index,2) = y(2)+Dy;
        else
            index = index - 1;
        end
    end
end

  
t = toc