COSAVER=[0.7541 0.7743 0.7944 0.8135 0.8304 0.8457 0.8759];
TRUNCAVER=[0.9089 0.9048 0.8992 0.8902 0.8790 0.8655 0.8047];
X=[0 -40 -80 -120 -160 -200 -350];
NNAVER=[0.685209846 0.700476038 0.714220911 0.724138039 0.729860381 0.731870433 0.704687567];
hold on;
plot(X,TRUNCAVER,'-','LineWidth',1.5); %线性，颜色，标记
plot(X,COSAVER,'-','LineWidth',1.5);
plot(X,NNAVER,'-','LineWidth',1.5);
axis([-360,0,0.6,0.95])  %确定x轴与y轴框图大小
set(gca,'XTick',-360:40:0);
set(gca,'YTick',0.6:0.06:0.95);
legend('\eta_{trunc}','\eta_{cos}','\eta_{cos} \cdot \eta_{trunc}','FontSize',16,'FontName','Cambria Math','Location','southeast');   %右上角标注
xlabel('吸收塔y坐标(单位：m)','FontSize',18,'FontName','宋体') ; %x轴坐标描述
ylabel('效率','FontSize',18,'FontName','宋体'); %y轴坐标描述