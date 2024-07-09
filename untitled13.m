% 坡向和坡度
slope_angle = deg2rad(0);  % 坡度为10°
slope_direction = deg2rad(0);  % 坡向为西北，与向南和向东的轴形成315°的角度
%x+y-z/(sqrt(2)*tan(deg2rad(10))/2)==0;
% 计算法向量的分量
nx = sin(pi/2 - slope_angle);
ny = cos(pi/2 - slope_angle);
nz = 0;
n=[1,1,-1/(sqrt(2)*tan(deg2rad(10))/2)];

y11=[
10.43771148
18.92008084
25.41121023
29.24919056
29.9130712
27.30034527
21.79243076
14.02900813
];

y12=[129.7484118
140.9571165
154.0680759
168.9518354
184.7639009
200.1609288
214.0333748
225.9820887
];

for i=1:1:10
    % 直线的高度角和方位角
    line_elevation = deg2rad(y11(i));  % 直线的高度角为30°
    line_azimuth = deg2rad(-y12(i));  % 直线的方位角为45°
    
    % 计算直线的方向向量
    dx = sin(line_elevation) * cos(line_azimuth);
    dy = sin(line_elevation) * sin(line_azimuth);
    dz = cos(line_elevation);
    d = [dx, dy, dz];
    
    % 计算夹角
    angle = acos(dot(n, d) / (norm(n) * norm(d)));
    
    % 输出夹角（以度为单位）
    angle_sin = sin(deg2rad(y11(i)))/sin(angle);
    angle_rad=rad2deg(angle);
    %disp(angle_rad);
    disp(angle_sin);
end