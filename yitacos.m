clc,clear
z=4;
X=0;
Y=0;
Z=80;
R_s=[-0.093542284	0.258424268	-0.961491934];
YITA=zeros(701,701);
YITASUM=0;
YITAALL=0;
for x=-350:1:350
    for y=-350:1:350
        if x^2+y^2<=350^2 && (X-x)^2+(Y-y)^2>=100^2
            I_s=[X-x,Y-y,Z-z];
            I_s=I_s/norm(I_s);
            yita_cos=norm(I_s-R_s)/2;
            YITA(x+351,y+351)=yita_cos;
            YITASUM=YITASUM+yita_cos;
            YITAALL=YITAALL+1;
        else
            YITA(x+351,y+351)=NaN;
        end
    end
end
M=imagesc(YITA);
set(M,'alphadata',~isnan(YITA))
Aver=YITASUM/YITAALL;
colormap(gca,jet);
colorbar
axis equal
ylabel('西-东方向','FontSize',14,'FontName','宋体');
xlabel('南-北方向','FontSize',14,'FontName','宋体');
title('冬至13：30','FontSize',14,'FontName','宋体')
axis([-10,710,-10,710])
set(gca,'xtick',[],'ytick',[])
%a=min(min(temp50));
%b=max(max(temp50));
%caxis([a b]); %设置最大最小的色条值
view(-90,90); 