%%
load Y42.mat
Y_un=Y_42;
plot(0+dt:dt:t_sum, Y_un,'LineWidth',2,'Color',[19 103 131]/256);
set(gca,'FontName','Times New Roman','FontSize',12)
xlim([0,28800])
xticks([0 7200 14400 21600 28800]); % 设置X轴刻度的位置
xticklabels({'0 min','120 min', '240 min', '360 min', '480 min'}); % 设置刻度的标签
ylim([0,1])
yticks([0 0.2 0.4 0.6 0.8 1]); % 设置X轴刻度的位置
yticklabels({'0%','20%', '40%', '60%', '80%','100%'}); % 设置刻度的标签

xlabel('Time of Crash (min)','FontSize',12,'FontName','Times New Roman')
ylabel('Probability of Finding the Submersible')
hold on

plot(t_start+dt:dt:t_sum, Sum/N,'LineWidth',2,'Color',[33 158 188]/256);
set(gca,'FontName','Times New Roman','FontSize',12)
xlim([0,28800])
xticks([0 7200 14400 21600 28800]); % 设置X轴刻度的位置
xticklabels({'0 min','120 min', '240 min', '360 min', '480 min'}); % 设置刻度的标签
ylim([0,1])
yticks([0 0.2 0.4 0.6 0.8 1]); % 设置X轴刻度的位置
yticklabels({'0%','20%', '40%', '60%', '80%','100%'}); % 设置刻度的标签
title('Trends of Probability of Finding the Submersible Over Time','FontName','Times New Roman','FontSize',16)

hold on
plot(7200,0,'.','MarkerSize',20,'MarkerFaceColor',[2 48 74]/256,'MarkerEdgeColor',[2 48 74]/256)
text(5000,0.04,'AUV Starts to Search','FontName','Times New Roman','FontSize',12)
plot(3600,0,'.','MarkerSize',20,'MarkerFaceColor',[2 48 74]/256,'MarkerEdgeColor',[2 48 74]/256)
text(2000,0.04,'Submersibles Start to Search','FontName','Times New Roman','FontSize',12)
legend('Multi-submersible Joint Searching','Single AUV Searching','FontName','Times New Roman','FontSize',12)
%%

area(t_start+dt:dt:t_sum, Y_un, 'FaceColor', [33 158 188]/256, 'EdgeColor', 'none', 'FaceAlpha',1);