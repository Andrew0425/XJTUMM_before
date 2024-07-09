radius=100;

subplot(2,3,1)
load MonteCarlo_Lim100.mat
result1=zeros(500,3);
result1(1:100,1:3)=result(:,3:5);
load MonteCarlo_Lim101_500.mat
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
load MonteCarlo_Lim100.mat
result1=zeros(500,3);
result1(1:100,1:3)=result(:,7:9);
load MonteCarlo_Lim101_500.mat
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
load MonteCarlo_Lim100.mat
result1=zeros(500,3);
result1(1:100,1:3)=result(:,11:13);
load MonteCarlo_Lim101_500.mat
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
load MonteCarlo_Lim100.mat
result1=zeros(500,3);
result1(1:100,1:3)=result(:,15:17);
load MonteCarlo_Lim101_500.mat
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
load MonteCarlo_Lim100.mat
result1=zeros(500,3);
result1(1:100,1:3)=result(:,19:21);
load MonteCarlo_Lim101_500.mat
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
load MonteCarlo_Lim100.mat
result1=zeros(500,3);
result1(1:100,1:3)=result(:,23:25);
load MonteCarlo_Lim101_500.mat
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