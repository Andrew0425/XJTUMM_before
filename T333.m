

H_O = [100,2,3];

%fan she guang xian 

%反射光线
r = [R_s(mi,1),R_s(mi,2),R_s(mi,3)];
%renyiguangxian
sigma = -0.266+0.533*rand(1,20);                     
tao = 360*rand(1,20);
zz=0;
for light=1:20
V_s = [sin(sigma(1,light))*cos(tao(1,light)) sin(sigma(1,light))*sin(tao(1,light)) cos(sigma(1,light))];

T = [-(R_s(mi,2)/(1-R_s(mi,3)^2)^(1/2)) -(R_s(mi,1)*R_s(mi,3)/(1-R_s(mi,3)^2)^(1/2)) R_s(mi,1) ; (R_s(mi,1)/(1-R_s(mi,3)^2)^(1/2)) -(R_s(mi,2)*R_s(mi,3)/(1-R_s(mi,3)^2)^(1/2)) R_s(mi,2) ; 0 (1-R_s(mi,3)^2)^(1/2) R_s(mi,3)];

V_st = T * V_s';

a1 = V_st(1);
b1 = V_st(2);
c1 = V_st(3);



syms z;
f = ((a1/c1)*(z-H_O(3))+H_O(1))^2+((b1/c1)*(z-H_O(3))+H_O(2))^2-3.5^2;
z = solve(f); %求解结果如下
z = (double(z));
if z<=84&&z>=76
    zz=zz+1;
end
end
