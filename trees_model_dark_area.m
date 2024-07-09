y1 = [6659
4240
3345
2826
2681
3137
3799
5314
] * 0.04;
y2 = [8200
5293
4304
3390
3244
3850
4918
6361
] * 0.04;
y3 = [
8861
5704
4389
3773
3616
4090
5109
6893
] * 0.04;
%y4 = [
%] * 0.04;
x = [8 9 10 11 12 13 14 15 16 17];
x2=[9 10 11 12 13 14 15 16];

y1=y1';y2=y2';y3=y3';
%y4=y4';

% 设置多项式阶数
n = 4;

% 进行四条曲线的曲线拟合
p1 = polyfit(x2, y1, n);
p2 = polyfit(x2, y2, n);
p3 = polyfit(x2, y3, n);
%p4 = polyfit(x2, y4, n);

% 生成一系列 x 值
x_fit = linspace(min(x2), max(x2), 100);

% 计算四条拟合曲线对应的 y 值
y_fit1 = polyval(p1, x_fit);
y_fit2 = polyval(p2, x_fit);
y_fit3 = polyval(p3, x_fit);
%y_fit4 = polyval(p4, x_fit);

% 绘制原始数据和拟合曲线
figure;
hold on;
scatter(x2, y1, 'o','filled','MarkerFaceColor',[0.5,0,0.5]);
scatter(x2, y2, 'o', 'filled','MarkerFaceColor',[0,0.5,0.5]);
scatter(x2, y3, 'o', 'filled','MarkerFaceColor','b');
%scatter(x2, y4, 'o', 'filled','MarkerFaceColor',[0.5,0,0.5]);
plot(x_fit, y_fit1,'color',[0.5,0,0.5],'LineWidth',1.5);
plot(x_fit, y_fit2,'color',[0,0.5,0.5],'LineWidth',1.5);
plot(x_fit, y_fit3,'color','b','LineWidth',1.5);
%plot(x_fit, y_fit4,'color',[0.5,0,0.5],'LineWidth',1.5);
hold off;
xlabel('时间（单位：小时）','FontSize',12,'FontName','宋体');
ylim([0 360]);
ylabel('树冠阴影面积（单位：平方米）','FontSize',12,'FontName','宋体');
legend('','','', '3.5m间距', '5m间距', '6.5m间距','FontSize',10,'FontName','宋体','Location','southeast');