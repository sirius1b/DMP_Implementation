clc;clear;
% 3 link
a1 = 1; a2= 1 ; a3 = 1;
L(1) = Link([0 0 a1 0 0]);
L(2) = Link([0 0 a2 0 0]);
L(3) = Link([0 0 a3 0 0]);
three_Link = SerialLink(L,"name","Three Link");
td = 0.001;
[xn,yn,tn] = genTraj("Lavanya.xlsx",td,1);
three_Link.plot([0,0,0]);
hold on;
plot3(xn,yn,zeros(size(xn)));
% q = [];
phi = -pi;
for i = 1:length(xn(1,:))
    phi = atan2(yn(i),xn(i));
    [q1(i,1),q1(i,2),q1(i,3)] = three_link_Inv_Kin(xn(1,i),yn(1,i),phi,a1,a2,a3,1);
    q1(i,1) = f1(q1(i,1));
    q1(i,2) = f1(q1(i,2));
    q1(i,3) = f1(q1(i,3));
    [q2(i,1),q2(i,2),q2(i,3)] = three_link_Inv_Kin(xn(1,i),yn(1,i),phi,a1,a2,a3,-1);
    q2(i,1) = f1(q2(i,1));
    q2(i,2) = f1(q2(i,2));
    q2(i,3) = f1(q2(i,3));
    
end
function q = f1(v)
    % +-pi to 0,2*pi
    q = v;
    if (v < 0 )
        q = v+2*pi;
    end 
end

