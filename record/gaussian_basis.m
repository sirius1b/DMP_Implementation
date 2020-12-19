function [Wg,means,widths,n] = gaussian_basis(s,c,h,n,f_s,t)
    Cs = (1:n)*(c/n);
    means = Cs;
    widths = h*ones(size(means));
    Cs = ones(length(s),1)*Cs;
    sn = s'*ones(1,n);
    K = exp(-h.*(sn-Cs).^2);
    K1 = K;
    wi_lw = zeros(n,1);
    % --------------------
    for i = 1:n
        qsi = diag(K1(:,i));    
        wi_lw(i,1) = (s*qsi*f_s')/(s*qsi*s');
    end
    
    Wg = wi_lw;
    %------------------- Least Squares
    for i = 1:length(s)
        K(i,:) = K(i,:)*s(i)/sum(K(i,:));
    end    
    wi = pinv(K)*f_s';
%     f_new2 = K*wi;
     Wg = wi;

%     f_new1 = K*wi_lw;
    f_new1 = K*Wg;
    plot(t,f_new1);
    hold on;

end