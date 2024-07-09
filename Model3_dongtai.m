clc,clear
%读入数据并将数据合成一张表
data_table = [];
load 'MonteCarlo_T3_1000_lim'
data_table = [data_table, result(2:321,:)];
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

%参数列表
tic
t_start = 7200;
t_sum = 28800;
t0 = t_start;
radius=20;
dt = 90;
verticle = 1.2;
Loc_search= [0,0,0]';
t_fore = t_start;
N = size(All_Time_Loc, 1);
Judge = ones(N, 1) * 60000;
S = zeros(ceil((t_sum-t_start)/dt), 1);
Sum = zeros(ceil((t_sum-t_start)/dt), 1);
Trap = Loc_search';


while 1
    t_fore = t_fore + dt;
    if t_fore > t_sum
        break
    end
    T_fore = t_fore/dt;
    Loc_current = All_Time_Loc((Judge == 60000),:,T_fore);
    Dens_fore = density(Loc_current, radius);
    [~, Max_index] = max(Dens_fore);
    Loc_Max = Loc_current(Max_index, :)';
    Dist = sqrt(sum((Loc_search-Loc_Max).^2));
    Direct = (Loc_Max - Loc_search)/Dist;
    if Dist > verticle*dt
        % if sum(Judge == 60000) > 400
        %     Loc_search = Loc_search + Direct*dt;
        % else
        %     for j = 1:sum(Judge == 60000)
        %         d = sqrt(sum((Loc_search' - Loc_current(j, :)).^2, 2));
        %         available = d <= radius;
        %         if available ~= []
        %             [~, Max_index] = max(Dens_fore);
        %             Loc_search = Loc_current(Max_index, :);
        %         else
                    Loc_search = Loc_search + Direct*dt;
        %         end
        %     end
        % end
    else
        Loc_search = Loc_Max;
    end
    Trap = [Trap;Loc_search'];
    for i = 1:N
        distance(i) = pdist([Loc_search'; All_Time_Loc(i,:, T_fore)]);
        if distance(i) < 20 && Judge(i) == 60000
            Judge(i) = t_fore;
            S((t_fore-t_start)/dt) = S((t_fore-t_start)/dt) + 1;
        end
    end
    Sum((t_fore-t_start)/dt) = sum(Judge ~= 60000);
end

%%
scatter3(Trap(:,1), Trap(:,2), -Trap(:, 3),8,'filled');

set(gca,'FontName','Times New Roman','FontSize',12)
xlim([0 1000])
ylim([0 800])
xlabel('Longitude (m)','FontName','Times New Roman','FontSize',12)
ylabel('Lantitude (m)','FontName','Times New Roman','FontSize',12)
zlabel('Depth (m)','FontName','Times New Roman','FontSize',12)

hold on

plot3(data_table(2:end,100),data_table(2:end,101),-data_table(2:end,102),'LineWidth',2)
plot3(data_table(2:end,130),data_table(2:end,131),-data_table(2:end,132),'LineWidth',2)
plot3(data_table(2:end,139),data_table(2:end,140),-data_table(2:end,141),'LineWidth',2)
plot3(data_table(2:end,136),data_table(2:end,137),-data_table(2:end,138),'LineWidth',2)
view(-56,18)
legend('Path of AUV','Possible Path 1 of Submersible','Possible Path 2 of Submersible','Possible Path 3 of Submersible','Possible Path 4 of Submersible','FontName','Times New Roman','FontSize',12)
%%
plot(t_start+dt:dt:t_sum, Sum/N,'LineWidth',2,'Color',[33 158 188]/256);
set(gca,'FontName','Times New Roman','FontSize',12)
Y_41_Un=Sum/N;
xlim([0,28800])
xticks([0 7200 14400 21600 28800]); % 设置X轴刻度的位置
xticklabels({'0 min','120 min', '240 min', '360 min', '480 min'}); % 设置刻度的标签
ylim([0,1])
yticks([0 0.2 0.4 0.6 0.8 1]); % 设置X轴刻度的位置
yticklabels({'0%','20%', '40%', '60%', '80%','100%'}); % 设置刻度的标签

xlabel('Time of Crash (min)','FontSize',12,'FontName','Times New Roman')
ylabel('Probability of Finding the Submersible')
hold on
% 使用fill函数填充颜色
area(t_start+dt:dt:t_sum, Sum/N, 'FaceColor', [33 158 188]/256, 'EdgeColor', 'none', 'FaceAlpha',1);%%
%%
toc

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