Col_1=[66,169,227]./256;
Col_3=[10,11,151]./256;
C=zeros(2,3);
C(1,:)=Col_1;
C(256,:)=Col_2;
for i=1:256
    C(i,:)=double(Col_1*(256-i)/255+Col_3*(i-1)/255);
end
colormap(C)
%%
D=zeros(11,1);
for i=1:11
    D(i,1)=seawater_density(S2(i,1),A2(i,1),1.01325);
end
%%
Density=zeros(11,1);
Density(:,1)=S1;Density(:,2)=D;