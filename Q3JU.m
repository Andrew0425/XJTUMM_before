clear all;
JULEI=xlsread('C:\Users\86189\Desktop\聚类分析.xlsx');
Y=pdist(JULEI,'Euclid');
Z=linkage(Y);
dendrogram(Z);
T=cluster(Z,3);
