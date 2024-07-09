
function createfigure(A1, A2)
%CREATEFIGURE(XData1, YData1)
%  XDATA1:  line xdata
%  YDATA1:  line ydata

%  由 MATLAB 于 02-Feb-2024 16:40:05 自动生成

% 创建 figure
figure1 = figure('Tag','CurveFitterExportedFigure',...
    'OuterPosition',[274.6 249 574.4 509.6]);
colormap(parula(6));

% 创建 axes
axes1 = axes('Tag','sftool surface axes','Parent',figure1,...
    'Position',[0.128571428571429 0.11 0.776428571428571 0.815]);
hold(axes1,'on');

% 创建 line
line(A1,A2,'DisplayName','无标题拟合 1','Parent',axes1,'LineWidth',2,...
    'Color',[0.0705882352941176 0.407843137254902 0.701960784313725]);

% 创建 zlabel
zlabel('Z','Interpreter','none');

% 创建 ylabel
ylabel('Temperature (°C)','Interpreter','none');

% 创建 xlabel
xlabel('Depth of Sea Water (m)','Interpreter','none');

% 创建 title
title('Thermocline','FontSize',16);

% 取消以下行的注释以保留坐标区的 X 范围
% xlim(axes1,[0 5500]);
% 取消以下行的注释以保留坐标区的 Y 范围
% ylim(axes1,[1.425 25.075]);
% 取消以下行的注释以保留坐标区的 Z 范围
% zlim(axes1,[-1 1]);
box(axes1,'on');
grid(axes1,'on');
hold(axes1,'off');
% 设置其余坐标区属性
set(axes1,'FontName','Times New Roman','FontSize',12);
hold on;
box on
axis([0,10,0,10]);
colormap(C);
colorbar('southoutside');
colorbar;
x = [0; 0; 10; 10];
y = [0; 10; 10; 0];
c = [0,0,1000,1000];
hp = patch(x,y,c);