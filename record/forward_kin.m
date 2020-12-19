function [x,y] = forward_kin(q,a1,a2)
    x = [] ; y = [];
    for i = 1:length(q(:,1))
        x = [x;a1*cos(q(i,1)) + a2*cos(q(i,1)+q(i,2))];
        y = [y;a1*sin(q(i,1)) + a2*sin(q(i,1)+q(i,2))];
    end
end