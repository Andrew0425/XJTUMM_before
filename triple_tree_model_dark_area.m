y1 = [2021
1181
886
748
678
677
723
815
1038
1558
] * 0.04;
y2 = [1109
822
669
595
556
554
570
639
754
968
] * 0.04;
y3 = [2043
1204
892
752
685
680
724
823
1042
1580
] * 0.04;
y4 = [2896
1636
1246
1107
1077
1165
1440
2183
] * 0.04;
x = [8 9 10 11 12 13 14 15 16 17];
x2=[9 10 11 12 13 14 15 16];

y1=y1';y2=y2';y3=y3';y4=y4';

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
ylim([0 250]);
ylabel('树冠阴影面积（单位：平方米）','FontSize',12,'FontName','宋体');
legend('','','','', '春分', '夏至', '秋分', '冬至','FontSize',12,'FontName','宋体');
