RC=radarChart(X,'Type','Patch');
RC.PropName={'AUV','ROV','Echo Sounder','Side Scan Sonar','Magnetometer','FontName','Times New Roman','FontSize',12};
RC.RTick=0:0.2:1;
RC.RLim=[0,1];
RC=RC.draw();
hold on
plot(-0.4020,0.2921,'.','MarkerSize',24,'MarkerFaceColor',[255,181,107]/256,'MarkerEdgeColor',[255,181,107]/256)
plot(-0.4595,-0.3386,'.','MarkerSize',24,'MarkerFaceColor',[255,181,107]/256,'MarkerEdgeColor',[255,181,107]/256)
plot(0.1124,0.3461,'.','MarkerSize',24,'MarkerFaceColor',[255,181,107]/256,'MarkerEdgeColor',[255,181,107]/256)
plot(0.668,0,'.','MarkerSize',24,'MarkerFaceColor',[255,181,107]/256,'MarkerEdgeColor',[255,181,107]/256)
plot(0.1594,-0.4907,'.','MarkerSize',24,'MarkerFaceColor',[255,181,107]/256,'MarkerEdgeColor',[255,181,107]/256)
%%
Y=[0.617	0.207	0.708	0.683	0.738];
RC=radarChart(Y,'Type','Patch');
RC.PropName={'AUV','ROV','Echo Sounder','Side Scan Sonar','Magnetometer','FontName','Times New Roman','FontSize',12};
RC.RTick=0:0.2:1;
RC.RLim=[0,1];
RC=RC.draw();
hold on
plot(-0.5727,0.4161,'.','MarkerSize',24,'MarkerFaceColor',[33 158 188]/256,'MarkerEdgeColor',[33 158 188]/256)
plot(0.0639,0.1968,'.','MarkerSize',24,'MarkerFaceColor',[33 158 188]/256,'MarkerEdgeColor',[33 158 188]/256)
plot(0.617,0,'.','MarkerSize',24,'MarkerFaceColor',[33 158 188]/256,'MarkerEdgeColor',[33 158 188]/256)
plot(0.2281,-0.7018,'.','MarkerSize',24,'MarkerFaceColor',[33 158 188]/256,'MarkerEdgeColor',[33 158 188]/256)
plot(-0.5525,-0.4014,'.','MarkerSize',24,'MarkerFaceColor',[33 158 188]/256,'MarkerEdgeColor',[33 158 188]/256)
title('Rescue Vessel','FontName','Times New Roman','FontSize',20)