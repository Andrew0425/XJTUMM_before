y1 = [
0.0068002
10.3097
10.622
9.438
9.2057
10.2259
12.7375
7.9064
] ;
y2 = [
0.96758
14.7647
13.0191
11.8685
11.6315
12.3926
14.5989
13.2969
];
y3 = [1.5723
16.0132
13.0191
11.8685
11.6315
12.3926
14.5989
13.4217
];

y11=[
0
9.6175
9.4585
8.0014
7.6944
8.9229
9.9125
2.1648]';
y21=[0.96758
14.7647
12.9061
10.912
10.5601
11.9382
14.5328
7.0898]';
y31=[1.5723
16.0132
13.0191
11.8685
11.6315
12.3926
14.5989
10.2338]';

%y4 = [
%] * 0.04;
x = [8 9 10 11 12 13 14 15 16 17];
x2=[9 10 11 12 13 14 15 16];


y1=y1';y2=y2';y3=y3';

%y4=y4';

% 设置多项式阶数
n = 6;

% 进行四条曲线的曲线拟合
p1 = polyfit(x2, y1, n);
p2 = polyfit(x2, y2, n);
p3 = polyfit(x2, y3, n);
p4 = polyfit(x2, y11, n);
p5 = polyfit(x2, y21, n);
p6 = polyfit(x2, y31, n);
%p4 = polyfit(x2, y4, n);

% 生成一系列 x 值
x_fit = linspace(min(x), max(x), 100);

% 计算四条拟合曲线对应的 y 值
y_fit1 = polyval(p1, x_fit);
y_fit2 = polyval(p2, x_fit);
y_fit3 = polyval(p3, x_fit);
y_fit4 = polyval(p4, x_fit);
y_fit5 = polyval(p5, x_fit);
y_fit6 = polyval(p6, x_fit);
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
plot(x_fit, y_fit4,'color',[0.5,0,0.5],'LineWidth',1,'LineStyle','--');
plot(x_fit, y_fit5,'color',[0,0.5,0.5],'LineWidth',1,'LineStyle','--');
plot(x_fit, y_fit6,'color','b','LineWidth',1,'LineStyle','--');
%plot(x_fit, y_fit4,'color',[0.5,0,0.5],'LineWidth',1.5);
hold off;
xlabel('时间（单位：小时）','FontSize',12,'FontName','宋体');
ylim([-3 16]);
xlim([8 17])
ylabel('树冠受光面积（单位：平方米）','FontSize',12,'FontName','宋体');
legend('','','', '3.5m间距（有坡度）', '5m间距（有坡度）', '6.5m间距（有坡度）', '3.5m间距(无坡度)', '5m间距（无坡度）', '6.5m间距（无坡度）','FontSize',10,'FontName','宋体','Location','southeast');