function [theta1, theta2 , theta3] = three_link_Inv_Kin(x,y,phi,a1,a2,a3,s)
    x_c = x - a3*cos(phi);
    y_c = y - a3*sin(phi);
    gamma = atan2(-y_c/sqrt(x_c^2 + y_c^2) , -x_c/sqrt(x_c^2 + y_c^2));
    
    theta1 = gamma + s*acos((-x_c^2 - y_c^2 - a1^2 + a2^2)/(2*a1*sqrt(x_c^2 + y_c^2)));
    theta2 = atan2((y_c - a1*sin(theta1))/(a2),(x_c - a1*cos(theta1))/(a2)) - theta1;
    theta3 = phi-theta1-theta2;
    
end