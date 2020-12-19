% function [q1,tn]= Link_Model_2(fName,td)
%     %2 link
%     a1 = 3; a2= 3 ; 
% %     L(1) = Link([0 0 a1 0 0]);
% %     L(2) = Link([0 0 a2 0 0]);
% %     two_Link = SerialLink(L,"name","Two Link");
%     [xn,yn,tn] = genTraj(fName,td,1,5,1);
% %     two_Link.plot([0,0]);
%     % hold on;
%     plot(xn,yn);
%     for i = 1:length(xn(1,:))
%         [q1(i,1),q1(i,2)] = two_link_Inv_Kin(xn(1,i),yn(1,i),a1,a2,1);
%         q1(i,1) = f1(q1(i,1));
%         q1(i,2) = f1(q1(i,2));
%     %     [q2(i,1),q2(i,2)] = two_link_Inv_Kin(xn(1,i),yn(1,i),a1,a2,-1);
%     end
% end

% function q = f1(v)
%     % +-pi to 0,2*pi
%     q = v;
%     if (v < 0 )
%         q = v+2*pi;
%     end 
% end

[t1,t2]= two_link_Inv_Kin(q(1,1),q(1,2),a1,a2,1);

function [theta1 , theta2] =  two_link_Inv_Kin(x,y,a1,a2,s)
    theta2 = s*acos((x^2 + y^2 - a1^2 - a2^2)/(2*a1*a2));    
    theta1 = atan2(y,x) - atan2(a2*sin(theta2),a1+a2*cos(theta2));
end


