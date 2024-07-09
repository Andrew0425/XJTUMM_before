clear all;
Q=xlsread('E:/2023美赛/Q3.xlsx');
A=Q(:,1:7);
B=Q(:,9);

X  = A';                    
y = B';   % 鐢熸垚y
%==============缃戠粶璁粌 ============================
%浣跨敤鐢ㄨ緭鍏ヨ緭鍑烘暟鎹紙X,y锛夊缓绔嬬綉缁滐紝
%闅愯妭鐐逛釜鏁拌涓?.鍏朵腑杈撳叆灞傚埌闅愬眰銆侀殣灞傚埌杈撳嚭灞傜殑鑺傜偣鍒嗗埆涓簍ansig鍜宲urelin锛屼娇鐢╰rainlm鏂规硶璁粌銆?
net = newff(X,y,6,{'tansig','purelin'},'trainlm');
%璁剧疆涓?簺甯哥敤鍏抽敭鍙傛暟
net.trainparam.goal = 0.00001;    % 璁粌鐩爣锛氬潎鏂硅宸綆浜?.0001
net.trainparam.show = 400;        % 姣忚缁?00娆″睍绀轰竴娆＄粨鏋?
net.trainparam.epochs = 15000;    % 鏈?ぇ璁粌娆℃暟锛?5000.
net.divideParam.trainRatio=0.7;   % 鐢ㄤ簬璁粌鐨勬暟鎹瘮渚?
net.divideParam.valRatio=0.15 ;   % 鐢ㄤ簬楠岃瘉杩囨嫙鍚堢殑鏁版嵁姣斾緥
net.divideParam.testRatio=0.15;   % 鐢ㄤ簬姣斾緥
net.trainparam.max_fail =300;       % 杩囨嫙鍚堥獙璇佸け璐ユ鏁?
 
[net,tr,net_y] = train(net,X,y);  % 璋冪敤matlab绁炵粡缃戠粶宸ュ叿绠辫嚜甯︾殑train鍑芥暟璁粌缃戠粶y锛宯et杩斿洖
 
% ===========鐢诲浘==================================
figure
subplot(2,1,1);
title('训练数据拟合图')
hold on 
plot(1:length(tr.trainInd),y(tr.trainInd),'b')
plot(1:length(tr.trainInd),net_y(tr.trainInd),'r')
 
subplot(2,1,2);
title('测试数据拟合图')
hold on 
plot(1:length(tr.testInd),y(tr.testInd),'b')
plot(1:length(tr.testInd),net_y(tr.testInd),'r')
