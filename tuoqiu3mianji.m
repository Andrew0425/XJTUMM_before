clc,clear
%树冠可视化模型
[theta,phi] = meshgrid(0:10:360,0:10:90);
X11 = 1.5*cos(phi*pi/180).*cos(theta*pi/180);
Y11 = 1.5*cos(phi*pi/180).*sin(theta*pi/180);
Z11 = 2*sin(phi*pi/180);
ss11=surf(X11, Y11, Z11);
ss11.FaceAlpha=0.4;
ss11.FaceColor = [0.5 0.5 0.5];
hold on;
[theta,phi2] = meshgrid(0:10:360,-90:10:0);
X12 = 1.5*cos(phi2*pi/180).*cos(theta.*pi/180);
Y12 = 1.5*cos(phi2*pi/180).*sin(theta*pi/180);
Z12 = 1*sin(phi2*pi/180);
ss12=surf(X12, Y12, Z12);
ss12.FaceAlpha=0.4;
ss12.FaceColor = [0.5 0.5 0.5];
hold on;

%树冠模型参数
a11=1.5;b11=1.5;c11=2;
a12=1.5;b12=1.5;c12=1;
center1=[0,0,0];
%{
%第二问所需树2
% 树冠可视化模型
[theta,phi] = meshgrid(0:10:360,0:10:90);
X31 = (1.5*cos(phi*pi/180).*cos(theta*pi/180)) - 3;  % 移动3个单位
Y31 = 1.5*cos(phi*pi/180).*sin(theta*pi/180);
Z31 = 2*sin(phi*pi/180);
ss31 = surf(X31, Y31, Z31);
ss31.FaceAlpha = 0.4;
ss31.FaceColor = [0.5 0.5 0.5]
hold on;
[theta,phi2] = meshgrid(0:10:360,-90:10:0);
X32 = (1.5*cos(phi2*pi/180).*cos(theta.*pi/180)) - 3;  % 移动3个单位
Y32 = 1.5*cos(phi2*pi/180).*sin(theta*pi/180);
Z32 = 1*sin(phi2*pi/180);
ss32 = surf(X32, Y32, Z32);
ss32.FaceAlpha = 0.4;
ss32.FaceColor = [0.5 0.5 0.5]
hold on;


% 树冠模型参数
a31 = 1.5; b31 = 1.5; c31 = 2; 
a32 = 1.5; b32 = 1.5; c32 = 1; 
center3 = [-3, 0, 0];  % 将中心点在x轴上移动5个单位

%第二问所需树
% 树冠可视化模型
[theta,phi] = meshgrid(0:10:360,0:10:90);
X21 = (1.5*cos(phi*pi/180).*cos(theta*pi/180)) + 3;  % 移动3个单位
Y21 = 1.5*cos(phi*pi/180).*sin(theta*pi/180);
Z21 = 2*sin(phi*pi/180);
ss21 = surf(X21, Y21, Z21);
ss21.FaceAlpha = 0.4;
ss21.FaceColor = [0.5 0.5 0.5]
hold on;
[theta,phi2] = meshgrid(0:10:360,-90:10:0);
X22 = (1.5*cos(phi2*pi/180).*cos(theta.*pi/180)) + 3;  % 移动3个单位
Y22 = 1.5*cos(phi2*pi/180).*sin(theta*pi/180);
Z22 = 1*sin(phi2*pi/180);
ss22 = surf(X22, Y22, Z22);
ss22.FaceAlpha = 0.4;
ss22.FaceColor = [0.5 0.5 0.5]
hold on;


% 树冠模型参数
a21 = 1.5; b21 = 1.5; c21 = 2; 
a22 = 1.5; b22 = 1.5; c22 = 1; 
center2 = [3, 0, 0];  % 将中心点在x轴上移动5个单位
%}
%两个角度
elevation_angle=[10.43771148
18.92008084
25.41121023
29.24919056
29.9130712
27.30034527
21.79243076
14.02900813
];
azimuth_angle=[129.7484118
140.9571165
154.0680759
168.9518354
184.7639009
200.1609288
214.0333748
225.9820887
];
elevation_angle=elevation_angle';
azimuth_angle=azimuth_angle';
for s=1:1:8
    azimuth_angle(s)=180-azimuth_angle(s);
end
for n=1:1:8
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

    S=0;
    numIntersectionPoints1=0;
    for x =-10:0.1:10
        for y =-40:0.1:20
            point1=[0,0,-2.5];
            point1=point1+[x,0,0]+[0,y,0];
            point2=point22+[x,0,0]+[0,y,0];
            %plot3([point1(1),point2(1)],[point1(2),point2(2)],[point1(2),point2(2)])
            Bool = 0;
            for t = 0:0.01:1  % 步长为0.01
                point = point2 - t * direction;
                % 判断点是否在半椭球内
                if point(3)>=0 
                    %{
                    if (((point(1)-center2(1))/a31)^2 + ((point(2)-center2(2))/b31)^2 + ((point(3)-center2(3))/c31)^2 <= 1)& Bool == 0
                        Bool = 1
                        scatter3([point(1)], [point(2)],[point(3)],'filled', 'MarkerFaceColor','y','MarkerFaceAlpha', 1);
                    end
                    if (((point(1)-center3(1))/a31)^2 + ((point(2)-center2(2))/b31)^2 + ((point(3)-center2(3))/c31)^2 <= 1)& Bool == 0
                        Bool = 1
                        scatter3([point(1)], [point(2)],[point(3)],'filled', 'MarkerFaceColor','y','MarkerFaceAlpha', 1);
                    end
                    %}
                    if (((point(1)-center1(1))/a11)^2 + ((point(2)-center1(2))/b11)^2 + ((point(3)-center1(3))/c11)^2 <= 1) & Bool == 0
                        numIntersectionPoints1 = numIntersectionPoints1 + 1;
                        Bool = 1;
                        %scatter3([point(1)], [point(2)],[point(3)],'filled', 'MarkerFaceColor','y','MarkerFaceAlpha', 1);
                        A = sqrt((point(1)/a11^2)^2 + (point(2)/b11^2)^2 + (point(3)/c11^2)^2);
                        sintheta=(point(2)/b11^2)/A;
                        sintheta=sqrt(1-sintheta^2);
                        S=S+0.01*abs(sintheta);
                    end
                elseif point(3)<0
                    %{
                    if (((point(1)-center2(1))/a22)^2 + ((point(2)-center2(2))/b22)^2 + ((point(3)-center2(3))/c22)^2 <= 1)& Bool == 0
                        Bool = 1;
                        scatter3([point(1)], [point(2)],[point(3)],'filled', 'MarkerFaceColor','y','MarkerFaceAlpha', 1);
                    end
                    if (((point(1)-center3(1))/a32)^2 + ((point(2)-center2(2))/b32)^2 + ((point(3)-center2(3))/c32)^2 <= 1)& Bool == 0
                        Bool = 1
                        scatter3([point(1)], [point(2)],[point(3)],'filled', 'MarkerFaceColor','y','MarkerFaceAlpha', 1);
                    end
                    %}
                    if (((point(1)-center1(1))/a12)^2 + ((point(2)-center1(2))/b12)^2 + ((point(3)-center1(3))/c12)^2 <= 1) & Bool == 0
                        numIntersectionPoints1 = numIntersectionPoints1 + 1;
                        Bool = 1;
                        %scatter3([point(1)], [point(2)],[point(3)],'filled', 'MarkerFaceColor','y','MarkerFaceAlpha', 1);
                        A = sqrt((point(1)/a12^2)^2 + (point(2)/b12^2)^2 + (point(3)/c12^2)^2);
                        sintheta=(point(2)/b12^2)/A;
                        sintheta=sqrt(1-sintheta^2);
                        S=S+0.01*abs(sintheta);
                    end
                end
            end
    
            hold on;
            
        end
    end

%disp(numIntersectionPoints1)
disp([num2str(n),'受光面积为：',num2str(S)])
end
%xlabel('南北方向（单位：m）','FontSize',12,'FontName','宋体');
%ylabel('东西方向（单位：m）','FontSize',12,'FontName','宋体');
view(90,90)
axis equal;