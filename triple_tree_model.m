clc,clear
%树冠1可视化模型
for u=-1:1:1
    [theta,phi] = meshgrid(0:10:360,0:10:90);
    X = 1.5*cos(phi*pi/180).*cos(theta*pi/180);
    Y = 1.5*cos(phi*pi/180).*sin(theta*pi/180)+u*3.5;
    Z = 2*sin(phi*pi/180);
    ss1=surf(X, Y, Z);
    ss1.FaceAlpha=0.4;
    hold on;
    [theta,phi2] = meshgrid(0:10:360,-90:10:0);
    X2 = 1.5*cos(phi2*pi/180).*cos(theta.*pi/180);
    Y2 = 1.5*cos(phi2*pi/180).*sin(theta*pi/180)+u*3.5;
    Z2 = 1*sin(phi2*pi/180);
    ss2=surf(X2, Y2, Z2);
    ss2.FaceAlpha=0.4;
    hold on;
    [theta,phi] = meshgrid(0:10:360,0:10:90);
    X3 = 1*cos(phi*pi/180).*cos(theta*pi/180);
    Y3 = 1*cos(phi*pi/180).*sin(theta*pi/180)+u*3.5;
    Z3 = 1.5*sin(phi*pi/180);
    ss3=surf(X3, Y3, Z3);
    ss3.FaceAlpha=0.4;
    hold on;
    X4 = 1*cos(phi2*pi/180).*cos(theta.*pi/180);
    Y4 = 1*cos(phi2*pi/180).*sin(theta*pi/180)+u*3.5;
    Z4 = 0.75*sin(phi2*pi/180);
    ss4=surf(X4, Y4, Z4);
    ss4.FaceAlpha=0.4;
    hold on;
    X5 = 0.5*cos(phi*pi/180).*cos(theta*pi/180);
    Y5 = 0.5*cos(phi*pi/180).*sin(theta*pi/180)+u*3.5;
    Z5 = 1*sin(phi*pi/180);
    ss5=surf(X5, Y5, Z5);
    ss5.FaceAlpha=0.4;
    hold on;
    X6 = 0.5*cos(phi2*pi/180).*cos(theta.*pi/180);
    Y6 = 0.5*cos(phi2*pi/180).*sin(theta*pi/180)+u*3.5;
    Z6 = 0.375*sin(phi2*pi/180);
    ss6=surf(X6, Y6, Z6);
    ss6.FaceAlpha=0.4;
    hold on;
end

xlabel('南北方向（单位：m）')
ylabel('东西方向（单位：m）')
axis equal