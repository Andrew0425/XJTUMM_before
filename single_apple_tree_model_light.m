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

%两个角度
elevation_angle=[15.253	46.078	48.806	19.927  28.868	64.460	68.721	33.650  15.003	45.728	48.437	19.670   10.438	25.411	27.300	14.029];
azimuth_angle=[102.306	141.640	210.452	253.746 80.961	113.631	237.557	275.847 102.634	141.929	210.204	253.415 129.748	154.068	200.161	225.982];
for s=1:1:16
    azimuth_angle(s)=180-azimuth_angle(s);
end
    % 将角度转换为弧度
    elevation_rad = deg2rad(elevation_angle(1));
    azimuth_rad = deg2rad(azimuth_angle(1));

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
                if (((point(1)-center1(1))/a11)^2 + ((point(2)-center1(2))/b11)^2 + ((point(3)-center1(3))/c11)^2 <= 1) & Bool == 0
                    numIntersectionPoints1 = numIntersectionPoints1 + 1;
                    Bool = 1;
                    scatter3([point(1)], [point(2)],[point(3)],'filled', 'MarkerFaceColor','y','MarkerFaceAlpha', 1);
                    A = sqrt((point(1)/a11^2)^2 + (point(2)/b11^2)^2 + (point(3)/c11^2)^2);
                    sintheta=(point(2)/b11^2)/A;
                    sintheta=sqrt(1-sintheta^2);
                    S=S+0.01*abs(sintheta);
                end
            elseif point(3)<0
                if (((point(1)-center1(1))/a12)^2 + ((point(2)-center1(2))/b12)^2 + ((point(3)-center1(3))/c12)^2 <= 1) & Bool == 0
                    numIntersectionPoints1 = numIntersectionPoints1 + 1;
                    Bool = 1;
                    scatter3([point(1)], [point(2)],[point(3)],'filled', 'MarkerFaceColor','y','MarkerFaceAlpha', 1);
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
disp(numIntersectionPoints1)
disp(S)
xlabel('南北方向（单位：m）','FontSize',12,'FontName','宋体');
ylabel('东西方向（单位：m）','FontSize',12,'FontName','宋体');
view(90,90)
axis equal;