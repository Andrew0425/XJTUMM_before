load H1000_m17210.mat
m1721=result;
load H1000_m17220.mat
m1722=result;
load H1000_m17230.mat
m1723=result;
load H1000_m17240.mat
m1724=result;
load H1000_m17250.mat
m1725=result;
plot3(m1721(:,1),m1721(:,2),m1721(:,3),'LineWidth',2);
hold on;
plot3(m1722(:,1),m1722(:,2),m1722(:,3),'LineWidth',2);
hold on;
plot3(m1723(:,1),m1723(:,2),m1723(:,3),'LineWidth',2);
hold on;
plot3(m1724(:,1),m1724(:,2),m1724(:,3),'LineWidth',2);
hold on;
plot3(m1725(:,1),m1725(:,2),m1725(:,3),'LineWidth',2);
grid on
xlabel('Longitude(m)','FontSize',12,'FontName','Times New Roman');
ylabel('Latitude(m)','FontSize',12,'FontName','Times New Roman');
zlabel('Depth of Water(m)','FontSize',12,'FontName','Times New Roman');
set(gca,'fontsize',12,'fontname','Times New Roman');
title('Prediction Location of Submersible over time','fontsize',16,'fontname','Times New Roman');
axis equal
