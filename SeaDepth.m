clc;clear;
close all;
ncdisp('C:\Users\86189\Desktop\gebco_2020_tid\GEBCO_2020_TID.nc');%查看文件内容
filename=('C:\Users\86189\Desktop\gebco_2020_tid\GEBCO_2020_TID.nc');
lon=ncread(filename,'lon');%读入经度
lat=ncread(filename,'lat');%读入纬度
elevation=ncread(filename,'tid');%读入海拔高度
lonS=105;%经度范围[-180,180]，lonE>lonS
lonE=123;
latS=6;%纬度范围[-90,90]，latE>latS
latE=22;
lon1=lon((lonS+180)*240+1:(lonE+180)*240);
lat1=lat((latS+90)*240+1:(latE+90)*240);
elevation1=elevation((lonS+180)*240+1:(lonE+180)*240,(latS+90)*240+1:(latE+90)*240);
elevation2=double(elevation1);%转换数据类型
elevation3=elevation2';%转置得到常用的经纬度标识
figure
m_proj('miller','lon',[lonS,lonE],'lat',[latS,latE]);
m_pcolor(lon1,lat1,elevation3);
shading flat;
colormap([m_colmap('blues',-min(min(elevation3))); m_colmap('gland',max(max(elevation3)))]);
brighten(.2);
m_grid('linestyle','none','box','fancy','tickdir','in');
c=colorbar('eastoutside','fontsize',10);
set(get(c,'title'),'string','[m]');