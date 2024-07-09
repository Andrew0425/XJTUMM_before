tic
index = 0;
result = [];
for R = 100:18:500
    for i = 2:4:138
        index = index + 2;
        k = tan(i*pi/138);
        syms x y;
        f1 = k*x-y;
        f2 = x^2+y^2-R^2;
        [x,y] = solve([f1,f2],[x,y]);
        x = double(x);
        y = double(y);
        if x(1)^2 + (y(1)-150)^2 <= 350^2
            result(index-1,1) = x(1);
            result(index-1,2) = y(1);
        else
            index = index - 1;
        end
        if x(1)^2 + (y(1)-150)^2 <= 350^2
            result(index,1) = x(2);
            result(index,2) = y(2);
        else
            index = index - 1;
        end
    end
end

for R = 110:18:500
    for i = 4:4:138
        index = index + 2;
        k = tan(i*pi/138);
        syms x y;
        f1 = k*x-y;
        f2 = x^2+y^2-R^2;
        [x,y] = solve([f1,f2],[x,y]);
        x = double(x);
        y = double(y);
        if x(1)^2 + (y(1)-150)^2 <= 350^2
            result(index-1,1) = x(1);
            result(index-1,2) = y(1);
        else
            index = index - 1;
        end
        if x(1)^2 + (y(1)-150)^2 <= 350^2
            result(index,1) = x(2);
            result(index,2) = y(2);
        else
            index = index - 1;
        end
    end
end
t = toc;