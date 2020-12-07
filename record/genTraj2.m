function [x,y,t] = genTraj2(fName)
    tb = readtable(fName);
    x = []; y= [] ; t = [];
    for i = 2:height(tb)
        t = [t,linspace(tb.t(i-1),tb.t(i),50)];
        x = 
    end
end