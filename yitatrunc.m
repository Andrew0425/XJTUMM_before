clc,clear
tic
H_O = [80,0,0];

%fan she guang xian 

%反射光线
r = [-0.8,0,0.6];
R_s=[-0.8,0,0.6];

%renyiguangxian
sigma = (-0.266+0.533*rand(1,100))*2*pi/180;                     
tao = 360*rand(1,100)*2*pi/180;
zz=0;
for light=1:3
V_s = [sin(sigma(1,light))*cos(tao(1,light)) sin(sigma(1,light))*sin(tao(1,light)) cos(sigma(1,light))];

T = [-(R_s(1,2)/(1-R_s(1,3)^2)^(1/2)) -(R_s(1,1)*R_s(1,3)/(1-R_s(1,3)^2)^(1/2)) R_s(1,1) ; (R_s(1,1)/(1-R_s(1,3)^2)^(1/2)) -(R_s(1,2)*R_s(1,3)/(1-R_s(1,3)^2)^(1/2)) R_s(1,2) ; 0 (1-R_s(1,3)^2)^(1/2) R_s(1,3)];

V_st = T * V_s';

a0 = V_st(1);b0 = V_st(2);c0 = V_st(3);
syms z
f=((a0/c0)*(z-H_O(3))+H_O(1))^2+((b0/c0)*(z-H_O(3))+H_O(2))^2-(3.5)^2;
Y=56:2:64;
u=double(subs(f,z,Y));
U=sum(u<0);
if U>0
    zz=zz+1;
end
end
ttt=toc;