%   2 link Plot
L(1) = Link([0 0 a1 0 0]);
L(2) = Link([0 0 a2 0 0]);
two_Link = SerialLink(L,"name","Two Link");
figure;
plot(xn,yn,'--r'); hold on;
plot(out.xr,out.yr,'-g');
plot(out.xq,out.yq,'-b');
legend("Original","DMP Generated","Performed One");
qdd = downsample(out.q,10);
two_Link.plot(qdd,'fps',50/td);