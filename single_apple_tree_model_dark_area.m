y1 = [1346 790 580 492 452 446 474 542 692 1040] * 0.02;
y2 = [746 548 446 402 368 364 384 426 500 644] * 0.02;
y3 = [1378 800 588 500 458 448 484 546 696 1052] * 0.02;
y4 = [1944 1092 840 734 718 778 952 1458] * 0.02;
x = [8 9 10 11 12 13 14 15 16 17];
x2=[9 10 11 12 13 14 15 16];

% 设置多项式阶数
n = 4;

% 进行四条曲线的曲线拟合
p1 = polyfit(x, y1, n);
p2 = polyfit(x, y2, n);
p3 = polyfit(x, y3, n);
p4 = polyfit(x2, y4, n);

% 生成一系列 x 值
x_fit = linspace(min(x), max(x), 100);

% 计算四条拟合曲线对应的 y 值
y_fit1 = polyval(p1, x_fit);
y_fit2 = polyval(p2, x_fit);
y_fit3 = polyval(p3, x_fit);
y_fit4 = polyval(p4, x_fit);

% 绘制原始数据和拟合曲线
figure;
hold on;
scatter(x, y1, 'o','filled','MarkerFaceColor','r');
scatter(x, y2, 'o', 'filled','MarkerFaceColor',[0,0.5,0.5]);
scatter(x, y3, 'o', 'filled','MarkerFaceColor','b');
scatter(x2, y4, 'o', 'filled','MarkerFaceColor',[0.5,0,0.5]);
plot(x_fit, y_fit1,'color','r','LineWidth',1.5);
plot(x_fit, y_fit2,'color',[0,0.5,0.5],'LineWidth',1.5);
plot(x_fit, y_fit3,'color','b','LineWidth',1.5);
plot(x_fit, y_fit4,'color',[0.5,0,0.5],'LineWidth',1.5);
hold off;
xlabel('时间（单位：小时）','FontSize',12,'FontName','宋体');
ylabel('树冠阴影面积（单位：平方米）','FontSize',12,'FontName','宋体');
title('苹果树树冠阴影面积随季节、时间的变化情况','FontSize',16,'FontName','宋体');
legend('','','','', '春分', '夏至', '秋分', '冬至','FontSize',12,'FontName','宋体');
