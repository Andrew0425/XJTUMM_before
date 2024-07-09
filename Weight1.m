% 将每一行的数据转换为百分比
Weight=[0.162000000000000	0.221000000000000	0.171000000000000	0.0230000000000000	0.0310000000000000	0.0340000000000000	0.0540000000000000	0.118000000000000	0.144000000000000	0.0210000000000000	0.0210000000000000
0.0960000000000000	0.0280000000000000	0.120000000000000	0.105000000000000	0.0750000000000000	0.0530000000000000	0.0540000000000000	0.100000000000000	0.123000000000000	0.123000000000000	0.123000000000000];

colors=[
    219,49,36;
    231,96,74;
    239,133,112;
    243,169,153;
    243,203,194;
    238,238,238;
    207,212,226;
    176,187,214;
    145,162,202;
    112,139,190;
    75,116,178;
    ]/256;

% 创建横向的百分比堆积条形图
figure;
h=barh(Weight, 'stacked');

for i = 1:11
    h(i).FaceColor = colors(i, :);
end

colormap(colors)
xlabel('Weight of 11 Factors','FontSize',12,'FontName','Times New Roman')
ylabel('Type of Ship','FontSize',12,'FontName','Times New Roman')
xlim([0 1]);
ylim([0.5 2.5])
set(gca,'fontsize',12,'fontname','Times New Roman');
legend('Reaction Speed', 'Versatility','Energy and Carriers','Environmental Sensitivity', 'Acquisition Costs','Maintenance Costs','Personnel Costs','Search Accuracy','Search Breath','Weight','Volume','Location', 'eastoutside', 'Orientation', 'vertical','FontName','Times New Roman','FontSize',12,'EdgeColor',[0,0,0]);


