clc,clear
for d = 3.5:1.5:6.5

%树冠模型参数
a11=1.5;b11=1.5;c11=2;
a12=1.5;b12=1.5;c12=1;
center1=[0,0,0];

% 树冠模型参数
a31 = 1.5; b31 = 1.5; c31 = 2; 
a32 = 1.5; b32 = 1.5; c32 = 1; 
center3 = [0, -d, 0];  % 将中心点在x轴上移动5个单位

% 树冠模型参数
a21 = 1.5; b21 = 1.5; c21 = 2; 
a22 = 1.5; b22 = 1.5; c22 = 1; 
center2 = [0, d, 0];  % 将中心点在x轴上移动5个单位

% 树冠模型参数
a41 = 1.5; b41 = 1.5; c41 = 2; 
a42 = 1.5; b42 = 1.5; c42 = 1; 
center4 = [d, 0, 0];  % 将中心点在x轴上移动5个单位

% 树冠模型参数
a51 = 1.5; b51 = 1.5; c51 = 2; 
a52 = 1.5; b52 = 1.5; c52 = 1; 
center5 = [-d, 0, 0];  % 将中心点在x轴上移动5个单位

% 树冠模型参数
a61 = 1.5; b61 = 1.5; c61 = 2; 
a62 = 1.5; b62 = 1.5; c62 = 1; 
center6 = [-d, -d, 0];  % 将中心点在x轴上移动5个单位

% 树冠模型参数
a71 = 1.5; b71 = 1.5; c71 = 2; 
a72 = 1.5; b72 = 1.5; c72 = 1; 
center7 = [d, -d, 0];  % 将中心点在x轴上移动5个单位

% 树冠模型参数
a91 = 1.5; b91 = 1.5; c91 = 2; 
a92 = 1.5; b92 = 1.5; c92 = 1; 
center9 = [d, d, 0];  % 将中心点在x轴上移动5个单位



%两个角度
elevation_angle=[15.25329928
26.74728536
37.30069887
46.07805656
51.73268607
52.76041559
48.80598458
41.08804954
31.11833248
19.92684826
28.8681958
40.86994525
52.88480367
64.46002994
74.10822164
76.37468044
68.72145662
57.6097592
45.69154488
33.64999697
15.00342485
26.47644953
36.99593591
45.72815553
51.34071796
52.35927901
48.43739643
40.7661971
30.83552072
19.67006902
10.43771148
18.92008084
25.41121023
29.24919056
29.9130712
27.30034527
21.79243076
14.02900813
]';
azimuth_angle=[102.3059678
112.6554838
125.2734277
141.6402462
162.8883742
187.4492199
210.4519166
228.7179887
242.6460181
253.7456587
80.96109056
89.19354329
99.08022618
113.6313597
142.3663618
197.7927875
237.5568977
255.9546618
267.1545624
275.8472996
102.6339155
112.9897418
125.6048415
141.9284839
163.0410832
187.380392
210.2042401
228.3963008
242.3106454
253.415112
129.7484118
140.9571165
154.0680759
168.9518354
184.7639009
200.1609288
214.0333748
225.9820887
]';

    % 将角度转换为弧度
    
for n=1:1:38
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
numIntersectionPoints1=0;
S=0;
for x =-10:0.1:10
    for y =-10:0.1:10
        point1=[0,0,-2.5];
        point1=point1+[x,0,0]+[0,y,0];
        point2=point22+[x,0,0]+[0,y,0];
        %plot3([point1(1),point2(1)],[point1(2),point2(2)],[point1(2),point2(2)])
        bool = 0;
        for t = 0:0.01:1  % 步长为0.01
            point = point2 - t * direction;
            % 判断点是否在半椭球内
            if point(3)>=0 
                    bool1 = (((point(1)-center3(1))/a31)^2 + ((point(2)-center3(2))/b31)^2 + ((point(3)-center3(3))/c31)^2 <= 1) & bool == 0;
                    bool2 = (((point(1)-center2(1))/a21)^2 + ((point(2)-center2(2))/b21)^2 + ((point(3)-center2(3))/c21)^2 <= 1) & bool == 0;
                    bool3 = (((point(1)-center1(1))/a11)^2 + ((point(2)-center1(2))/b11)^2 + ((point(3)-center1(3))/c11)^2 <= 1) & bool == 0;
                    bool4 = (((point(1)-center4(1))/a41)^2 + ((point(2)-center4(2))/b41)^2 + ((point(3)-center4(3))/c41)^2 <= 1) & bool == 0;
                    bool5 = (((point(1)-center5(1))/a51)^2 + ((point(2)-center5(2))/b51)^2 + ((point(3)-center5(3))/c51)^2 <= 1) & bool == 0;
                    bool6 = (((point(1)-center6(1))/a61)^2 + ((point(2)-center6(2))/b61)^2 + ((point(3)-center6(3))/c61)^2 <= 1) & bool == 0;
                    bool7 = (((point(1)-center7(1))/a71)^2 + ((point(2)-center7(2))/b71)^2 + ((point(3)-center7(3))/c71)^2 <= 1) & bool == 0;
                    bool8 = (((point(1)-center8(1))/a81)^2 + ((point(2)-center8(2))/b81)^2 + ((point(3)-center8(3))/c81)^2 <= 1) & bool == 0;
                    bool9 = (((point(1)-center9(1))/a91)^2 + ((point(2)-center9(2))/b91)^2 + ((point(3)-center9(3))/c91)^2 <= 1) & bool == 0;
                    if bool1 || bool2 || bool3 ||bool4 ||bool5||bool6 || bool7 ||bool8 ||bool9
                        numIntersectionPoints1 = numIntersectionPoints1 + bool3;
                        if bool3 ==1
                            A = sqrt((point(1)/a11^2)^2 + (point(2)/b11^2)^2 + (point(3)/c11^2)^2);
                            sintheta=(point(2)/b11^2)/A;
                            sintheta=sqrt(1-sintheta^2);
                            S=S+0.01*abs(sintheta);
                        end
                        bool = 1;
                        break
                    end
        
            elseif point(3)<0
                    bool1 = (((point(1)-center3(1))/a32)^2 + ((point(2)-center3(2))/b32)^2 + ((point(3)-center3(3))/c32)^2 <= 1) & bool == 0;
                    bool2 = (((point(1)-center2(1))/a22)^2 + ((point(2)-center2(2))/b22)^2 + ((point(3)-center2(3))/c22)^2 <= 1) & bool == 0;
                    bool3 = (((point(1)-center1(1))/a12)^2 + ((point(2)-center1(2))/b12)^2 + ((point(3)-center1(3))/c12)^2 <= 1) & bool == 0;
                    bool4 = (((point(1)-center4(1))/a42)^2 + ((point(2)-center4(2))/b42)^2 + ((point(3)-center4(3))/c42)^2 <= 1) & bool == 0;
                    bool5 = (((point(1)-center5(1))/a52)^2 + ((point(2)-center5(2))/b52)^2 + ((point(3)-center5(3))/c52)^2 <= 1) & bool == 0;
                    bool6 = (((point(1)-center6(1))/a62)^2 + ((point(2)-center6(2))/b62)^2 + ((point(3)-center6(3))/c62)^2 <= 1) & bool == 0;
                    bool7 = (((point(1)-center7(1))/a72)^2 + ((point(2)-center7(2))/b72)^2 + ((point(3)-center7(3))/c72)^2 <= 1) & bool == 0;
                    bool8 = (((point(1)-center8(1))/a82)^2 + ((point(2)-center8(2))/b82)^2 + ((point(3)-center8(3))/c82)^2 <= 1) & bool == 0;
                    bool9 = (((point(1)-center9(1))/a92)^2 + ((point(2)-center9(2))/b92)^2 + ((point(3)-center9(3))/c92)^2 <= 1) & bool == 0;

                    if bool1 || bool2 || bool3 ||bool4 ||bool5||bool6 || bool7 ||bool8 ||bool9
                        numIntersectionPoints1 = numIntersectionPoints1 + bool3;
                        if bool3 ==1
                            A = sqrt((point(1)/a11^2)^2 + (point(2)/b11^2)^2 + (point(3)/c11^2)^2);
                            sintheta=(point(2)/b11^2)/A;
                            sintheta=sqrt(1-sintheta^2);
                            S=S+0.01*abs(sintheta);
                        end
                        bool = 1;
                        %scatter3(point(1), point(2), point(3), 'filled', 'MarkerFaceColor','y', 'MarkerFaceAlpha', 1);
                        break
                    end
            
            hold on;
            end
        end
    end    
end
%disp(numIntersectionPoints1)
disp([num2str(n),'受光面积为：',num2str(S)])
end
end
axis equal;
