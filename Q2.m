
clear all;
close all ;

A = xlsread('E:\2023美赛/viki.xlsx')
B = xlsread('E:\2023美赛/result.xlsx')

X  = A';                         
y = B';   % 生成y
%==============网络训练 ============================
%使用用输入输出数据（X,y）建立网络，
%隐节点个数设为3.其中输入层到隐层、隐层到输出层的节点分别为tansig和purelin，使用trainlm方法训练。
net = newff(X,y,5,{'tansig','purelin'},'trainlm');
%设置一些常用关键参数
net.trainparam.goal = 0.000001;    % 训练目标：均方误差低于0.0001
net.trainparam.show = 400;        % 每训练400次展示一次结果
net.trainparam.epochs = 15000;    % 最大训练次数：15000.
net.divideParam.trainRatio=0.8;   % 用于训练的数据比例
net.divideParam.valRatio=0.05 ;   % 用于验证过拟合的数据比例
net.divideParam.testRatio=0.15;   % 用于比例
net.trainparam.max_fail =3;       % 过拟合验证失败次数
 
[net,tr,net_y] = train(net,X,y);  % 调用matlab神经网络工具箱自带的train函数训练网络y，net返回
 
% ===========画图==================================
figure
subplot(2,1,1);
title('训练数据的拟合效果')
hold on 
plot(1:length(tr.trainInd),y(tr.trainInd),'b')
plot(1:length(tr.trainInd),net_y(tr.trainInd),'r')
 
subplot(2,1,2);
title('测试数据的拟合效果')
hold on 
plot(1:length(tr.testInd),y(tr.testInd),'b')
plot(1:length(tr.testInd),net_y(tr.testInd),'r')
kkkk=test(net);
%=============网络对新输入的使用==========================
O=[[0.13 0.13 0.06 0.07 0.13 0.283]];

sim_z = sim(net,O');               % 实际与上面的net_y一致