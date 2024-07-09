clc,clear
%树冠可视化模型
[theta,phi] = meshgrid(0:10:360,0:10:90);
X = 1.5*cos(phi*pi/180).*cos(theta*pi/180);
Y = 1.5*cos(phi*pi/180).*sin(theta*pi/180);
Z = 2*sin(phi*pi/180);
ss1=surf(X, Y, Z);
ss1.FaceAlpha=0.4;
hold on;
[theta,phi2] = meshgrid(0:10:360,-90:10:0);
X2 = 1.5*cos(phi2*pi/180).*cos(theta.*pi/180);
Y2 = 1.5*cos(phi2*pi/180).*sin(theta*pi/180);
Z2 = 1*sin(phi2*pi/180);
ss2=surf(X2, Y2, Z2);
ss2.FaceAlpha=0.4;
hold on;
[theta,phi] = meshgrid(0:10:360,0:10:90);
X3 = 1*cos(phi*pi/180).*cos(theta*pi/180);
Y3 = 1*cos(phi*pi/180).*sin(theta*pi/180);
Z3 = 1.5*sin(phi*pi/180);
ss3=surf(X3, Y3, Z3);
ss3.FaceAlpha=0.4;
hold on;
X4 = 1*cos(phi2*pi/180).*cos(theta.*pi/180);
Y4 = 1*cos(phi2*pi/180).*sin(theta*pi/180);
Z4 = 0.75*sin(phi2*pi/180);
ss4=surf(X4, Y4, Z4);
ss4.FaceAlpha=0.4;
hold on;
X5 = 0.5*cos(phi*pi/180).*cos(theta*pi/180);
Y5 = 0.5*cos(phi*pi/180).*sin(theta*pi/180);
Z5 = 1*sin(phi*pi/180);
ss5=surf(X5, Y5, Z5);
ss5.FaceAlpha=0.4;
hold on;
X6 = 0.5*cos(phi2*pi/180).*cos(theta.*pi/180);
Y6 = 0.5*cos(phi2*pi/180).*sin(theta*pi/180);
Z6 = 0.375*sin(phi2*pi/180);
ss6=surf(X6, Y6, Z6);
ss6.FaceAlpha=0.4;

%树冠模型参数
a11=1.5;b11=1.5;c11=2;a21=1;b21=1;c21=1.5;a31=0.5;b31=0.5;c31=1;
a12=1.5;b12=1.5;c12=1;a22=1;b22=1;c22=0.75;a32=0.5;b32=0.5;c32=0.375;
center=[0,0,0];

elevation_angle=[10.43771148
10.43771148
18.92008084
25.41121023
29.24919056
29.9130712
27.30034527
21.79243076
14.02900813
14.02900813
];
azimuth_angle=[129.7484118
129.7484118
140.9571165
154.0680759
168.9518354
184.7639009
200.1609288
214.0333748
225.9820887
225.9820887
];
elevation_angle=elevation_angle';
azimuth_angle=azimuth_angle';
for s=1:1:10
    azimuth_angle(s)=180-azimuth_angle(s);
end

for n=1:1:10
    disp(['阴影点个数为：',num2str(n)])
    % 将角度转换为弧度
    elevation_rad = deg2rad(elevation_angle(n));
    azimuth_rad = deg2rad(azimuth_angle(n));

    % 光线方向向量
    direction_vector = [cos(azimuth_rad) * cos(elevation_rad);
                    sin(azimuth_rad) * cos(elevation_rad);
                    sin(elevation_rad)];
    %光线参数
    point1=[0,0,-2.5];
    point22=point1+direction_vector';
    p=1;
    while point22(3)<5
        point22=point22+direction_vector';
        p=p+1;
    end

    direction=point22-point1;
    num=0;
    %步长计算
    for x =-50:0.2:50
        for y =-200:0.2:20
            point1=[0,0,-2.5];
            point1=point1+[x,0,0]+[0,y,0];
            point2=point22+[x,0,0]+[0,y,0];
            numIntersectionPoints1=0;
            numIntersectionPoints2=0;
            numIntersectionPoints3=0;
            direction=point2-point1;
            for t = 0:0.01:1  % 步长为0.01
                point = point1 + t * direction;
                % 判断点是否在半椭球内
                if point(3)>=0
                    if ((point(1)-center(1))/a31)^2 + ((point(2)-center(2))/b31)^2 + ((point(3)-center(3))/c31)^2 <= 1
                        numIntersectionPoints3 = numIntersectionPoints3 + 1;
                    elseif ((point(1)-center(1))/a21)^2 + ((point(2)-center(2))/b21)^2 + ((point(3)-center(3))/c21)^2 <= 1
                        numIntersectionPoints2 = numIntersectionPoints2 + 1;
                    elseif ((point(1)-center(1))/a11)^2 + ((point(2)-center(2))/b11)^2 + ((point(3)-center(3))/c11)^2 <= 1
                        numIntersectionPoints1 = numIntersectionPoints1 + 1;
                    end
                elseif point(3)<0
                    if ((point(1)-center(1))/a32)^2 + ((point(2)-center(2))/b32)^2 + ((point(3)-center(3))/c32)^2 <= 1
                        numIntersectionPoints3 = numIntersectionPoints3 + 1;
                    elseif ((point(1)-center(1))/a22)^2 + ((point(2)-center(2))/b22)^2 + ((point(3)-center(3))/c22)^2 <= 1
                        numIntersectionPoints2 = numIntersectionPoints2 + 1;
                    elseif ((point(1)-center(1))/a12)^2 + ((point(2)-center(2))/b12)^2 + ((point(3)-center(3))/c12)^2 <= 1
                        numIntersectionPoints1 = numIntersectionPoints1 + 1;
                    end
                end
            end
            sum=numIntersectionPoints3*0.2+numIntersectionPoints2*0.8+numIntersectionPoints1*0.5;
            
            if sum>0
                % 平面方程
                % 假设平面方程为 Ax + By + Cz + D = 0
                A = 0;
                B = 0;
                C = 1;
                D = 2.5;
        
                syms m
                point = point1 + m * direction;
                eqn = A * point(1) + B * point(2) + C * point(3) + D == 0;
                t_sol = solve(eqn, m);

            % 计算交点坐标
        
                intersectionPoints = point1 + double(t_sol) * direction;
                if sum>12
                    scatter3([intersectionPoints(1)], [intersectionPoints(2)],[intersectionPoints(3)],'filled', 'MarkerFaceColor','k','MarkerFaceAlpha', 0.8);
                    num=num+1;
                elseif sum>6
                    scatter3([intersectionPoints(1)], [intersectionPoints(2)],[intersectionPoints(3)],'filled', 'MarkerFaceColor','k','MarkerFaceAlpha', 0.5);
                    num=num+1;
                elseif sum>0
                    scatter3([intersectionPoints(1)], [intersectionPoints(2)],[intersectionPoints(3)],'filled', 'MarkerFaceColor','k','MarkerFaceAlpha', 0.2);
                    num=num+1;
                end
                %disp(['阴影程度为：',num2str(sum)])

                hold on;
            end
        
        end
    end
    disp(['阴影点个数为：',num2str(num)])
end

axis equal;