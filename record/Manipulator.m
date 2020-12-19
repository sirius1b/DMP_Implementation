a1 = 3; a2 = 3;
q0 = two_link_Inv_Kin(q(1,1),q(1,2),a1,a2,1);
k1 = 300; k2= 40;

function q =  two_link_Inv_Kin(x,y,a1,a2,s)
    theta2 = s*acos((x^2 + y^2 - a1^2 - a2^2)/(2*a1*a2));    
    theta1 = atan2(y,x) - atan2(a2*sin(theta2),a1+a2*cos(theta2));
    q = [theta1,theta2];
end
