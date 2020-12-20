function [x,y,timeS]= genTraj(fName,td,type,timeScale,axisScale) 
    %interpolate recorded trajectory
    tb = readtable(fName);
    timeS = (0:td:timeScale*tb.t(end));
    if type == 0
        method  = "spline";
        x = interpn(timeScale*tb.t,axisScale*tb.x,timeS,method); 
        y = interpn(timeScale*tb.t,axisScale*tb.y,timeS,method);
    elseif type == 1
            n = 9;
            px = polyfit(timeScale*tb.t,axisScale*tb.x,n);
            py = polyfit(timeScale*tb.t,axisScale*tb.y,n);
            x = polyval(px,timeS);
            y = polyval(py,timeS);
    end
%     plot(tb.x,tb.y);
%     hold on;
%     plot(x,y);
end