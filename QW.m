L = 10;
R = 2;
theta = 30;
phi = 60;
x = cosd(theta)*sind(phi);
y = cosd(theta)*cosd(phi);
[xg,yg] = meshgrid(-L/2:0.1:L/2,-L/2:0.1:L/2);
mask = (xg.^2+yg.^2)<=R^2;
I = mask*(sind(theta)^3);
figure;
imagesc(-L/2:0.1:L/2,-L/2:0.1:L/2,I);
colormap gray;
axis equal;
hold on;
plot(x,y,'ro');