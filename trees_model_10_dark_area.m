y1 = [
3649
2951
2601
2439
2945
3705
5382
] * 0.04;
y2 = [
4588
4064
3167
2956
3700
4974
6454
] * 0.04;
y3 = [5018
4498
3624
3401
4123
5196
6983
] * 0.04;
%y4 = [
%] * 0.04;
x = [8 9 10 11 12 13 14 15 16 17];
x2=[10 11 12 13 14 15 16];
q=[
2.0655
1.5317
1.3259
1.1999
1.098
0.9878
0.8148
];

y1=y1';y2=y2';y3=y3';
for i=1:1:10
    y1(i)=q(i)*y1(i);
    y2(i)=q(i)*y2(i);
    y3(i)=q(i)*y3(i);
end
%y4=y4';

% 设置多项式阶数
n = 4;

% 进行四条曲线的曲线拟合
p1 = polyfit(x, y1, n);
p2 = polyfit(x, y2, n);
p3 = polyfit(x, y3, n);
%p4 = polyfit(x2, y4, n);

% 生成一系列 x 值
x_fit = linspace(min(x), max(x), 100);

% 计算四条拟合曲线对应的 y 值
y_fit1 = polyval(p1, x_fit);
y_fit2 = polyval(p2, x_fit);
y_fit3 = polyval(p3, x_fit);
%y_fit4 = polyval(p4, x_fit);

% 绘制原始数据和拟合曲线
figure;
hold on;
scatter(x, y1, 'o','filled','MarkerFaceColor',[0.5,0,0.5]);
scatter(x, y2, 'o', 'filled','MarkerFaceColor',[0,0.5,0.5]);
scatter(x, y3, 'o', 'filled','MarkerFaceColor','b');
%scatter(x2, y4, 'o', 'filled','MarkerFaceColor',[0.5,0,0.5]);
plot(x_fit, y_fit1,'color',[0.5,0,0.5],'LineWidth',1.5);
plot(x_fit, y_fit2,'color',[0,0.5,0.5],'LineWidth',1.5);
plot(x_fit, y_fit3,'color','b','LineWidth',1.5);
%plot(x_fit, y_fit4,'color',[0.5,0,0.5],'LineWidth',1.5);
hold off;
xlabel('时间（单位：小时）','FontSize',12,'FontName','宋体');
ylim([0 450]);
xlim([8 16])
ylabel('树冠阴影面积（单位：平方米）','FontSize',12,'FontName','宋体');
legend('','','', '3.5m间距', '5m间距', '6.5m间距','FontSize',10,'FontName','宋体','Location','northeast');