y1 = [18.9801
11.3502
8.8233
7.7895
7.3577
7.3253
7.5792
8.3211
10.0851
14.7158];
y2 = [10.4491
7.9258
6.7594
6.2143
5.9664
5.9419
6.0624
6.5068
7.3459
9.1783];
y3 = [19.2739
11.4861
8.8863
7.8453
7.4391
7.3775
7.653
8.3368
10.1594
14.8667
];
y4 = [20.6738
    17.7271
15.7093
13.1685
11.9353
11.6851
12.4989
14.8676
16.3198
19.4376];
x = [8 9 10 11 12 13 14 15 16 17];
x2=[8 9 10 11 12 13 14 15 16 17];

y1=y1';
y2=y2';
y3=y3';
y4=y4';

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
ylabel('树冠受光面积（单位：平方米）','FontSize',12,'FontName','宋体');
title('苹果树树冠受光面积随季节、时间的变化情况','FontSize',16,'FontName','宋体');
legend('','','','', '春分', '夏至', '秋分', '冬至','FontSize',12,'FontName','宋体');