clc;clear;

angle=readmatrix('/home/jzx/下载/23guosai/angle.xlsx');
T1_dist=readmatrix('/home/jzx/下载/23guosai/4ceng/004/4ceng_004.xlsx');
rushe = angle(:,6:8);
fanshe = T1_dist(:,4:6);
faxiangliang = [];
for i = 2:2700
    for j = 2:61
        f = fanshe(i,:);
        r = rushe(j,:);
        fa = f-r;
        fa = fa/norm(fa);
        faxiangliang(i,(3*j-5):(3*j-3)) = fa;
     end
end
a = 1