clc,clear
tic
Sheet1 = xlsread('C:\Users\86189\Desktop\2023\angle(1).xlsx');	%读取入射光线的数据
Sheet2 = xlsread('C:\Users\86189\Desktop\2023\T1_dist.xlsx');	%读取反射光线的数据
Sheet3 = xlsread('C:\Users\86189\Desktop\2023\faxiangliang.xlsx');	%读取法向量的数据
X=Sheet2(2:1746,2:2);%定日镜横坐标
Y=Sheet2(2:1746,3:3);%定日镜纵坐标
F_s=Sheet3(2:1746,1:180);%定日镜日期和时间的法向量
z=4;%定日镜高度
Wm=6;Hm=6;%定日镜镜面宽度、高度
I_s=Sheet1(2:61,6:8);%入射光线单位向量
R_s=Sheet2(2:1746,4:6);%反射光线单位向量
Nearest=Sheet2(2:1746,8:17);%离目标定日镜最近的5个
NN=zeros(60,1745);
for D=1:3:10
    
    for mi=1:1745
    N=0;
    NL=0;
    NLSUM=0;
    %目标定日镜中心点
    M_i = [X(mi,1),Y(mi,1),z];
    %目标定日镜法向量
    n_i = [F_s(mi,D),F_s(mi,D+1),F_s(mi,D+2)];
    l_mi = n_i(1);m_mi = n_i(2);n_mi = n_i(3);
    %入射光线单位向量
    i = [I_s((D+2)/3+1,1),I_s((D+2)/3+1,2),I_s((D+2)/3+1,3)];
    %反射光线单位向量
    r = [R_s(mi,1),R_s(mi,2),R_s(mi,3)];
    yita_cos=(n_i*r');
    %潜在遮挡定日镜中心点
        for mk=1:5
            M_j = [Nearest(mi,2*mk-1),Nearest(mi,2*mk),z];
            R_j = ([0,0,80]-M_j)/norm([0,0,80]-M_j);%假设吸收塔中心位置确定
            %潜在遮挡定日镜法向量
            n_j = (R_j-i)/norm(R_j-i);
            l_mj = n_j(1);m_mj = n_j(2);n_mj = n_j(3);


%mou dian

for w=-3:0.12:3
    for h=-3:0.12:3
H_i = [w,h,0];
x_i = H_i(1);
y_i = H_i(2);

T_IO = [-(m_mi/(1-n_mi^2)^(1/2)) -(l_mi*n_mi/(1-n_mi^2)^(1/2)) l_mi ; (l_mi/(1-n_mi^2)^(1/2)) -(m_mi*n_mi/(1-n_mi^2)^(1/2)) m_mi ; 0 (1-n_mi^2)^(1/2) n_mi];

T_JO = [-(m_mj/(1-n_mj^2)^(1/2)) -(l_mj*n_mj/(1-n_mj^2)^(1/2)) l_mj ; (l_mj/(1-n_mj^2)^(1/2)) -(m_mj*n_mj/(1-n_mj^2)^(1/2)) m_mj ; 0 (1-n_mj^2)^(1/2) n_mj];

H_O = T_IO * H_i.' + M_i';

H_ij = T_JO.'*(H_O-M_j');
xi1 = H_ij(1);yi1 = H_ij(2);zi1 = H_ij(3);

i_j = T_JO.'*i';
a11 = i_j(1);b11 = i_j(2);c11 = i_j(3);

r_j = T_JO.'*r';
a21 = r_j(1);b21 = r_j(2);c21 = r_j(3);

x1=(c11*xi1-a11*zi1)/c11;y1=(c11*yi1-b11*zi1)/c11;
x2=(c21*xi1-a21*zi1)/c21;y2=(c21*yi1-b21*zi1)/c21;
        if x1<=3 && x1>=-3 && y1<=3 && y1>=-3
            N=N+1;
        elseif x2<=3 && x2>=-3 && y2<=3 && y2>=-3
            N=N+1;
        else

        end
    end
end
        end
        d=((M_i(1))^2+(M_i(2))^2+(M_i(3)-80)^2)^(1/2);%假设吸收塔位置确定
        N=0.92*(1-0.12*0.12*N/(Wm*Hm))*(0.99321-0.0001176*d+1.97*10^(-8)*d^2)*yita_cos;
        NN((D+2)/3,mi)=N;
    end

end
T=toc;
