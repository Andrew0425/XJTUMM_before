y1 = [6.863
11.0573
8.7201
7.7555
7.3502
7.3204
7.5572
8.2543
9.8841
10.8768
];
y2 = [10.169
7.8205
6.7271
6.2065
5.9662
5.9419
6.0549
6.4876
7.2802
8.9881
];
y3 = [6.649
11.1795
8.7818
7.8119
7.4322
7.3725
7.6315
8.2729
9.9695
10.6945
];
y4 = [
6.9969
16.0132
13.0191
11.8685
11.6315
12.3926
14.5989
13.4217
];
x = [8 9 10 11 12 13 14 15 16 17];
x2=[9 10 11 12 13 14 15 16];

y1=y1';y2=y2';y3=y3';y4=y4';

% 设置多项式阶数
n = 8;

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
ylim([0 21]);
ylabel('树冠阴影面积（单位：平方米）','FontSize',12,'FontName','宋体');

legend('','','','', '春分', '夏至', '秋分', '冬至','FontSize',10,'FontName','宋体','Location','northeast');
