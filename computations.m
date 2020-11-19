clf;
clc;
%% parameters
t0 = 0 ; 
tf = 10 ; 
td = 0.05; 
t = t0:td:tf;
a = 0.2;
y = sin(a*(t-3));
yd = diff(y)/td;
ydd = diff(yd)/td;
subplot(2,2,1)
plot(t,y,t(2:length(t)),yd,t(3:length(t)),ydd);
hold on;
plot(t,zeros(length(t)),'--b',t,ones(length(t)),'--g');

f_new = dmp(y,t0,tf,td,t);


%% functions

function f_new = dmp(x,t0,tf,td,t)
    tau = 1;
    xd = diff(x)/td;
    xdd = diff(xd)/td;
    v = [xd(1),xd]*tau; 
    vd = [xdd(1),xdd(1),xdd]*tau;
    K = 1; D = sqrt(4*K);
    g = x(length(x));
    x0 = x(1);
    f_s = (-K*(g-x) + D*v + tau*vd)/(g-x0);
    alp_s = 0.3;
    s = exp(-alp_s*t/tau);
    
    
    
    
    
    plot(t,s);
    legend('y','yd','ydd','','','s(t)');
    subplot(2,2,3);
    
    f_new = gaussian_basis(s,1.2,100,20,f_s);
    
end



function f_new = gaussian_basis(s,c,h,n,f_s)
    Cs = (1:n)*(c/n);
    Cs = ones(length(s),1)*Cs;
    sn = s'*ones(1,n);
    K = exp(-h.*(sn-Cs).^2);
    
    K1 = K;
    wi_lw = zeros(n,1);
    for i = 1:n
        qsi = diag(K1(:,i));
        
        wi_lw(i,1) = (s*qsi*f_s')/(s*qsi*s');
    end
    
    for i = 1:length(s)
        K(i,:) = K(i,:)/sum(K(i,:));
    end
    
    
    f_new = K*wi_lw;
    
    hold on;
    subplot(2,2,2)
    plot(s,K1);
    
    
    subplot(2,2,3)
    plot(s,f_s);
    plot(s,f_new);
    legend('f_s','f_{new}')
    
    
end