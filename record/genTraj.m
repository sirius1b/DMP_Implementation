function [x,y,timeS]= genTraj(fName,td,type) 
    %interpolate recorded trajectory
    tb = readtable(fName);
    timeS = (0:td:tb.t(end));
    if type == 0
        method  = "spline";
        x = interpn(tb.t,tb.x,timeS,method); 
        y = interpn(tb.t,tb.y,timeS,method);
    elseif type == 1
            n = 10;
            px = polyfit(tb.t,0.3*tb.x,n);
            py = polyfit(tb.t,0.3*tb.y,n);
            x = polyval(px,timeS);
            y = polyval(py,timeS);
    end
%     plot(tb.x,tb.y);
%     hold on;
%     plot(x,y);
end