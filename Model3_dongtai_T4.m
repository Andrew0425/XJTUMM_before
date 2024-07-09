clc;clear;
%读入数据并将数据合成一张表
data_table = [];
load 'MonteCarlo_T3_1000_lim.mat'
data_table = [data_table, result(2:end,:)];
% load('MonteCarlo_T3_101500.mat')
% data_table = [data_table, result(2:end,:)];
% 获取数据表的大小
[num_rows, num_cols] = size(data_table);
% 计算三维数组的大小
dim1_size = ceil(num_cols / 3);
dim2_size = 3;
dim3_size = num_rows;
% 创建一个空的三维数组
All_Time_Loc = zeros(dim1_size, dim2_size, dim3_size);
% 将数据表整理成三维数组
for col = 1:num_cols
    % 计算在三维数组中的索引
    dim1_index = ceil(col / 3);
    dim2_index = mod(col - 1, 3) + 1;

    % 将数据表中的列复制到三维数组中的对应位置
    All_Time_Loc(dim1_index, dim2_index, :) = data_table(:, col);
end
%%
%参数列表
tic
t_start = 7200;
t_sum = 28800;
t0 = t_start;
t1 = t_start/2;
radius=20;
dt = 90;
verticle1 = 1.2;
verticle2 = 0.4;
verticle3 = 0.3;
Loc_search1= [0,0,0]';
Loc_search2 = [-200,800,1500]';
Loc_search3 = [-900,300,2000]';
t_fore = 0;
N = size(All_Time_Loc, 1);
Judge = ones(N, 1) * 60000;
S = zeros(ceil((t_sum)/dt), 1);
Sum = zeros(ceil((t_sum-t_start)/dt), 1);
Trap1 = Loc_search1';
Trap2 = Loc_search2';
Trap3 = Loc_search3';


while 1
    %判定退出
    t_fore = t_fore + dt;
    if t_fore > t_sum
        break
    end
    T_fore = t_fore/dt;
    Loc_current = All_Time_Loc((Judge == 60000),:,T_fore);
    Dens_fore = density(Loc_current, radius);
    [~, Max_index] = max(Dens_fore);
    Loc_Max = Loc_current(Max_index, :)';
    %AUV
    if t_fore > t0
        Dist = sqrt(sum((Loc_search1-Loc_Max).^2));
        Direct = (Loc_Max - Loc_search1)/Dist;
        if Dist > verticle1*dt
            Loc_search1 = Loc_search1 + Direct*dt;
        else
            Loc_search1 = Loc_Max;
        end
        Trap1 = [Trap1;Loc_search1'];
        for i = 1:N
            distance(i) = pdist([Loc_search1'; All_Time_Loc(i,:, T_fore)]);
            if distance(i) < 20 && Judge(i) == 60000
                Judge(i) = t_fore;
                S((t_fore)/dt) = S((t_fore)/dt) + 1;
            end
        end
    end

    %Sub1
    if t_fore > t1
        Dist = sqrt(sum((Loc_search2-Loc_Max).^2));
        Direct = (Loc_Max - Loc_search2)/Dist;
        if Dist > verticle2*dt
            Loc_search2 = Loc_search2 + Direct*dt;
        else
            Loc_search2 = Loc_Max;
        end
        Trap2 = [Trap2;Loc_search2'];
        for i = 1:N
            distance(i) = pdist([Loc_search2'; All_Time_Loc(i,:, T_fore)]);
            if distance(i) < 20 && Judge(i) == 60000
                Judge(i) = t_fore;
                S((t_fore)/dt) = S((t_fore)/dt) + 1;
            end
        end
    end
    
    %Sub2
    if t_fore > t1
        Dist = sqrt(sum((Loc_search3-Loc_Max).^2));
        Direct = (Loc_Max - Loc_search3)/Dist;
        if Dist > verticle3*dt
            Loc_search3 = Loc_search3 + Direct*dt;
        else
            Loc_search3 = Loc_Max;
        end
        Trap3 = [Trap3;Loc_search3'];
        for i = 1:N
            distance(i) = pdist([Loc_search3'; All_Time_Loc(i,:, T_fore)]);
            if distance(i) < 20 && Judge(i) == 60000
                Judge(i) = t_fore;
                S((t_fore)/dt) = S((t_fore)/dt) + 1;
            end
        end
    end

    Sum((t_fore)/dt) = sum(Judge ~= 60000);
end
%%
scatter3(Trap1(:,1), Trap1(:,2), -Trap1(:, 3),'filled');
hold on
scatter3(Trap2(:,1), Trap2(:,2), -Trap2(:, 3),'filled');
hold on
scatter3(Trap3(:,1), Trap3(:,2), -Trap3(:, 3),'filled');

hold off
%%
plot(0+dt:dt:t_sum, Sum/N);
toc
%%
function Density = density(data, radius)
% data 是一个 N x 3 的矩阵，包含三维坐标的数据
% radius 是密度计算时的半径参数

N = size(data, 1);
Density = zeros(N, 1);

for i = 1:N
    % 计算当前点与所有其他点的距离
    distances = sqrt(sum((data(:,1:3) - data(i, 1:3)).^2, 2));

    % 在半径范围内的点被视为邻居
    neighbors = distances <= radius;

    % 计算密度为半径范围内邻居点的数量
    Density(i) = sum(neighbors);
end
end

%%