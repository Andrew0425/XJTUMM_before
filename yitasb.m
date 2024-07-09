clc,clear
tic
NumberMirror=2109;

OX=0;OY=-200;OZ=80;
Wm=7;Hm=6.5;
GONGLV=zeros(7,1);
for z=3.25:0.25:4.75
%定日镜镜面宽度、高度
DNI=[1.064626544	1.131480079	1.149343495	1.131480079	1.064626544	1.114194389	1.164107981	1.177944748	1.164107981	1.114194389	1.137198666	1.178830562	1.190649767	1.178830562	1.137198666	1.143857812	1.182903357	1.194084808	1.182903357	1.143857812	1.136966499	1.178686219	1.190527012	1.178686219	1.136966499	1.112483146	1.162991816	1.176972207	1.162991816	1.112483146	1.061379964	1.129339666	1.147461962	1.129339666	1.061379964	0.978263898	1.075088189	1.099835094	1.075088189	0.978263898	0.87266426	1.007788472	1.041139143	1.007788472	0.87266426	0.823563095	0.976786705	1.014253357	0.976786705	0.823563095	0.883681748	1.014751627	1.0471902	1.014751627	0.883681748	0.989642157	1.082442041	1.106277569	1.082442041	0.989642157];
Sheet1 = xlsread('C:\Users\86189\Desktop\2023\angle(1).xlsx');	%读取入射光线的数据
Sheet2 = xlsread('C:\Users\86189\Desktop\2023\66_new\003\4ceng_003.xlsx');	%读取反射光线的数据OOOOOOOOO
Sheet3 = xlsread('C:\Users\86189\Desktop\2023\66_new\003\4ceng_003_sheet3.xlsx');	%读取法向量的数据OOOOOOOOOO
X=Sheet2(2:NumberMirror+1,2:2);%定日镜横坐标OOOOOOOOOOOO
Y=Sheet2(2:NumberMirror+1,3:3);%定日镜纵坐标OOOOOOOOOOO
F_s=Sheet3(2:NumberMirror+1,1:180);%定日镜日期和时间的法向量OOOOOOO
I_s=Sheet1(2:61,6:8);%入射光线单位向量
R_s=Sheet2(2:NumberMirror+1,4:6);%反射光线单位向量
Nearest=Sheet2(2:NumberMirror+1,8:17);%离目标定日镜最近的5个
NN=zeros(NumberMirror,60);
NCOS=zeros(NumberMirror,60);
NSB=zeros(NumberMirror,60);
NTRUNC=zeros(NumberMirror,60);
for D=1:3:178
    for mi=1:NumberMirror
    N=0;
    NL=0;
    NLSUM=0;
    %目标定日镜中心点
    M_i = [X(mi,1),Y(mi,1),z];%OOOOOOOOOOOOOOOOO
    %目标定日镜法向量
    n_i = [F_s(mi,D),F_s(mi,D+1),F_s(mi,D+2)];
    l_mi = n_i(1);m_mi = n_i(2);n_mi = n_i(3);
    %入射光线单位向量
    i = [I_s((D+2)/3,1),I_s((D+2)/3,2),I_s((D+2)/3,3)];
    %反射光线单位向量
    r = [R_s(mi,1),R_s(mi,2),R_s(mi,3)];
    yita_cos=(n_i*r');
    %潜在遮挡定日镜中心点
        for mk=1:5
            M_j = [Nearest(mi,2*mk-1),Nearest(mi,2*mk),z];%OOOOOOOOOOOOOOOOO
            R_j = ([0,0,80]-M_j)/norm([0,0,80]-M_j);%假设吸收塔中心位置确定
            %潜在遮挡定日镜法向量
            n_j = (R_j-i)/norm(R_j-i);
            l_mj = n_j(1);m_mj = n_j(2);n_mj = n_j(3);


%mou dian

for w=-Wm/2:0.6:Wm/2
    for h=-Hm/2:0.6:Hm/2
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
        if x1<=Wm/2 && x1>=-Wm/2 && y1<=Hm/2 && y1>=-Hm/2%OOOOOOOOOOOOOOOOO
            N=N+1;
        elseif x2<=Wm/2 && x2>=-Wm/2 && y2<=Hm/2 && y2>=-Hm/2%OOOOOOOOOOOOOOOOO
            N=N+1;
        end
    end
end
        end
      
    for h=-Hm/2:1:Hm/2
        for w=-Hm/2:1:Hm/2
            H_i = [w,h,0];
            x_i = H_i(1);
            y_i = H_i(2);
            T_IO = [-(m_mi/(1-n_mi^2)^(1/2)) -(l_mi*n_mi/(1-n_mi^2)^(1/2)) l_mi ; (l_mi/(1-n_mi^2)^(1/2)) -(m_mi*n_mi/(1-n_mi^2)^(1/2)) m_mi ; 0 (1-n_mi^2)^(1/2) n_mi];
            H_O = T_IO * H_i.' + M_i';
            sigma = (-0.266+0.533*rand(1,100))*2*pi/180;                     
            tao = 360*rand(1,100)*2*pi/180;
            for light=1:2
                NLSUM=NLSUM+1;
                V_s = [sin(sigma(1,light))*cos(tao(1,light)) sin(sigma(1,light))*sin(tao(1,light)) cos(sigma(1,light))];
                T = [-(R_s(mi,2)/(1-R_s(mi,3)^2)^(1/2)) -(R_s(mi,1)*R_s(mi,3)/(1-R_s(mi,3)^2)^(1/2)) R_s(mi,1) ; (R_s(mi,1)/(1-R_s(mi,3)^2)^(1/2)) -(R_s(mi,2)*R_s(mi,3)/(1-R_s(mi,3)^2)^(1/2)) R_s(mi,2) ; 0 (1-R_s(mi,3)^2)^(1/2) R_s(mi,3)];
                V_st = T * V_s';
                M_O=[OX,OY,OZ];%OOOOOOOOOOOOOOOOO
                T_MO = [-(R_s(mi,2)) 0 R_s(mi,1) ; (R_s(mi,1)) 0 R_s(mi,2); 0 1 0];
                H_im = T_MO.'*(H_O-M_O');
                xi1 = H_im(1);yi1 = H_im(2);zi1 = H_im(3);
                r_m = T_MO.'*V_st;
                a31 = r_m(1);b31 = r_m(2);c31 = r_m(3);
                x1=(c31*xi1-a31*zi1)/c31;y1=(c31*yi1-b31*zi1)/c31;
                Hx=4+3.5*V_st(3,1);
                if x1<=3.5 && x1>=-3.5 && y1<=4+Hx && y1>=-4
                    NL=NL+1;
                end
            end
        end
    end
   
        d=((M_i(1))^2+(M_i(2))^2+(M_i(3)-80)^2)^(1/2);%假设吸收塔位置确定
        NCOS(mi,(D+2)/3)=yita_cos;
        NTRUNC(mi,(D+2)/3)=NL/NLSUM;
        NSB(mi,(D+2)/3)=1-0.6*0.6*N/(Wm*Hm);
        N=0.92*(1-0.6*0.6*N/(Wm*Hm))*(0.99321-0.0001176*d+1.97*(10^(-8))*d^2)*yita_cos*NL/NLSUM;
        NN(mi,(D+2)/3)=N;

        
    end

end

cosaver=mean(NCOS);
truncaver=mean(NTRUNC);
sbaver=mean(NSB);
NNaver=mean(NN);
GONGLV(4*(z-3.25)+1,1)=(2109*Hm*Wm*NNaver*DNI')/60;

end