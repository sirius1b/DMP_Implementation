function [Wg,Cs,Hs,n] = dmp(x,td,t)
    tau = 1;
    xd = diff(x)/td;
    xdd = diff(xd)/td;
    v = [xd(1),xd]*tau;     
    vd = [xdd(1),xdd(1),xdd]*tau;
    K = 1; D = sqrt(4*K);
    g = x(length(x));
    x0 = x(1);
    alp_s = 0.1;
    s = exp(-alp_s*t/tau);
    fs = (tau*vd + D*v)/K - (g-x) + (g-x0)*s;
    plot(t,fs);
    hold on;
    [Wg,Cs,Hs,n] = gaussian_basis(s,1,100,30,fs,t);
    legend('original','spanned');
end    
