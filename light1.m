elevation_angle=[15.253	46.078	48.806	19.927];
azimuth_angle=[102.306	141.640	210.452	253.746];

for n=1:1:4
    % 将角度转换为弧度
    elevation_rad = deg2rad(elevation_angle(n));
    azimuth_rad = deg2rad(azimuth_angle(n));

    % 光线方向向量
    direction_vector = [cos(azimuth_rad) * cos(elevation_rad);
                    sin(azimuth_rad) * cos(elevation_rad);
                    sin(elevation_rad)];
    %光线参数
    point1=[0,0,-2.5];
    point2=point1+direction_vector;
    while point2(3)<5
        point2=point2+direction_vector;
    end
    disp(['point2坐标为：',num2str(point2(1)),',',num2str(point2(2)),',',num2str(point2(3))])
end