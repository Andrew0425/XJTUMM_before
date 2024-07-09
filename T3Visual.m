load MonteCarlo_T3_100.mat
resultT3=zeros(300,3);
for i=1:1:100
    resultT3(i,1)=result(321,3*i-2);
    resultT3(i,2)=result(321,3*i-1);
    resultT3(i,3)=result(321,3*i);
end
scatter3(resultT3(:,1),resultT3(:,2),-resultT3(:,3),8,'filled')
