function [Wg,Cs,Hs,n] = dmp(x,td,t)
    tau = 1;
    xd = diff(x)/td;
    xdd = diff(xd)/td;
    v = [xd(1),xd]*tau; 
    vd = [xdd(1),xdd(1),xdd]*tau;
    K = 1; D = sqrt(4*K);
    g = x(length(x));
    x0 = x(1);
    alp_s = 1;
    s = exp(-alp_s*t/tau);
    fs = (tau*vd + D*v)/K - (g-x) + (g-x0)*s;
    [Wg,Cs,Hs,n] = gaussian_basis(s,1,500,20,fs);
    disp(size(fs));
    subplot(2,1,1);
    plot(s,fs);
    hold on; 
end    
