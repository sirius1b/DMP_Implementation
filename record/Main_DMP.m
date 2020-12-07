td = 0.001;
[xn,yn,tn] = genTraj("Lavanya.xlsx",td,1);
xn_d = gradient(xn,td);
yn_d = gradient(yn,td);
plot(tn,xn,tn,yn,tn(1:end),xn_d,tn(1:end),yn_d);
legend("xn","yn",'xn_d','yn_d');

[wg_x,cs_x,hs_x,n] = dmp(xn,td,tn);
subplot(2,1,2);
plot(tn,xn);
hold on;
plot(tn,yn);

% [wg_y,cs_y,hs_y,n] = dmp(yn,scale*td,tn);
