radius=100;

subplot(2,3,1)
load MonteCarlo100.mat
result1=zeros(500,3);
result1(1:100,1:3)=result(:,3:5);
load MonteCarlo101_500.mat
result1(101:500,1:3)=result(1:400,3:5);
density_3D = density3D_KD(result1(:,1:3),radius);
scatter3(result1(:,1),result1(:,2),-result1(:,3), 6, density_3D,'filled');
grid on
xlabel('Longitude(m)','FontSize',12,'FontName','Times New Roman');
ylabel('Latitude(m)','FontSize',12,'FontName','Times New Roman');
zlabel('Depth of Water(m)','FontSize',12,'FontName','Times New Roman');
set(gca,'fontsize',12,'fontname','Times New Roman');
xlim([-3000,0]);
ylim([0, 2000]);
zlim([-4500,-1000]);
view(25,45);
title('t = 60 min','fontsize',16,'fontname','Times New Roman')

subplot(2,3,2)
load MonteCarlo100.mat
result1=zeros(500,3);
result1(1:100,1:3)=result(:,7:9);
load MonteCarlo101_500.mat
result1(101:500,1:3)=result(1:400,7:9);
density_3D = density3D_KD(result1(:,1:3),radius);
scatter3(result1(:,1),result1(:,2),-result1(:,3), 6, density_3D,'filled');
grid on
set(gca,'fontsize',12,'fontname','Times New Roman');
xlim([-3000,0]);
ylim([0, 2000]);
zlim([-4500,-1000]);
view(25,45);
title('t = 120 min','fontsize',16,'fontname','Times New Roman')

subplot(2,3,3)
load MonteCarlo100.mat
result1=zeros(500,3);
result1(1:100,1:3)=result(:,11:13);
load MonteCarlo101_500.mat
result1(101:500,1:3)=result(1:400,11:13);
density_3D = density3D_KD(result1(:,1:3),radius);
scatter3(result1(:,1),result1(:,2),-result1(:,3), 6, density_3D,'filled');
grid on
set(gca,'fontsize',12,'fontname','Times New Roman');
xlim([-3000,0]);
ylim([0, 2000]);
zlim([-4500,-1000]);
view(25,45);
title('t = 240 min','fontsize',16,'fontname','Times New Roman')

subplot(2,3,4)
load MonteCarlo100.mat
result1=zeros(500,3);
result1(1:100,1:3)=result(:,15:17);
load MonteCarlo101_500.mat
result1(101:500,1:3)=result(1:400,15:17);
density_3D = density3D_KD(result1(:,1:3),radius);
scatter3(result1(:,1),result1(:,2),-result1(:,3), 6, density_3D,'filled');
grid on
set(gca,'fontsize',12,'fontname','Times New Roman');
xlim([-3000,0]);
ylim([0, 2000]);
zlim([-4500,-1000]);
view(25,45);
title('t = 420 min','fontsize',16,'fontname','Times New Roman')

subplot(2,3,5)
load MonteCarlo100.mat
result1=zeros(500,3);
result1(1:100,1:3)=result(:,19:21);
load MonteCarlo101_500.mat
result1(101:500,1:3)=result(1:400,19:21);
density_3D = density3D_KD(result1(:,1:3),radius);
scatter3(result1(:,1),result1(:,2),-result1(:,3), 6, density_3D,'filled');
grid on
set(gca,'fontsize',12,'fontname','Times New Roman');
xlim([-3000,0]);
ylim([0, 2000]);
zlim([-4500,-1000]);
view(25,45);
title('t = 540 min','fontsize',16,'fontname','Times New Roman')

subplot(2,3,6)
load MonteCarlo100.mat
result1=zeros(500,3);
result1(1:100,1:3)=result(:,23:25);
load MonteCarlo101_500.mat
result1(101:500,1:3)=result(1:400,23:25);
density_3D = density3D_KD(result1(:,1:3),radius);
scatter3(result1(:,1),result1(:,2),-result1(:,3), 6, density_3D,'filled');
grid on
set(gca,'fontsize',12,'fontname','Times New Roman');
xlim([-3000,0]);
ylim([0, 2000]);
zlim([-4500,-1000]);
view(25,45);
title('t = 720 min','fontsize',16,'fontname','Times New Roman')
tight_layout
%%
hold on;
scatter3(result(:,7),result(:,8),-result(:,9),'filled');
hold on;
scatter3(result(:,11),result(:,12),-result(:,13),'filled');
hold on;
scatter3(result(:,15),result(:,16),-result(:,17),'filled');
hold on;
scatter3(result(:,19),result(:,20),-result(:,21),'filled');
hold on;
scatter3(result(:,23),result(:,24),-result(:,25),'filled');
grid on
xlabel('Longitude(m)','FontSize',12,'FontName','Times New Roman');
ylabel('Latitude(m)','FontSize',12,'FontName','Times New Roman');
zlabel('Depth of Water(m)','FontSize',12,'FontName','Times New Roman');
set(gca,'fontsize',12,'fontname','Times New Roman');
axis equal

colormap(parula)
colorbar
%%
radius=40;
for i = 1:400
        % 计算当前点与所有其他点的距离
        distances = sqrt(sum((result(:,3:5) - result(i, 3:5)).^2, 2));
        
        % 在半径范围内的点被视为邻居
        neighbors = distances <= radius;
        
        % 计算密度为半径范围内邻居点的数量
        sum(neighbors)
end
%%
% 读取数据

% 初始化绘图参数
Data = randn(1000,3);
% 密度计算
radius = 1; % 定义半径
density_3D = density3D_KD(Data(:,1:3),radius); % 3D密度


% map = flipud(map);
scatter3(Data(:,1), Data(:,2), Data(:,3), 5, density_3D, 'filled')
hTitle = title('Density Scatter3');
hXLabel = xlabel('XAxis');
hYLabel = ylabel('YAxis');
hZLabel = zlabel('ZAxis');

radius=40;
function density = density3D_KD(data, radius)
    % data 是一个 N x 3 的矩阵，包含三维坐标的数据
    % radius 是密度计算时的半径参数

    N = size(data, 1);
    density = zeros(N, 1);

    for i = 1:N
        % 计算当前点与所有其他点的距离
        distances = sqrt(sum((data - data(i, :)).^2, 2));
        
        % 在半径范围内的点被视为邻居
        neighbors = distances <= radius;
        
        % 计算密度为半径范围内邻居点的数量
        density(i) = sum(neighbors) / (pi * radius^2);
    end
end