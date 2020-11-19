
syms a1 a2 a3 theta1 theta2 theta3 
syms x y a b
mat = (trans(theta1,a1,0,1)*trans(theta2,a2,0,1)*trans(theta3,a3,0,1));
disp(mat(:,3));


function mat = trans(theta, x, y, val)
    r = [cos(theta), -sin(theta), 0;
         sin(theta), cos(theta) , 0;
          0 , 0 , 1];
    t = [1 , 0 , x ; 
         0 , 1 , y ; 
         0 , 0 , 1 ;];
    if val == 0 
            mat = t*r;
    elseif val == 1
        mat = r*t;
    end
end