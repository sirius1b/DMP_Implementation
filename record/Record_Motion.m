data.x = [] ; data.y = [];
data.t_nows = [];
data.clicked = 0; % flag
data.num = 0;
data.prev_click = 0; % 
data.record = 0; 
data.lastKey = '.';
guidata(gcf,data);
format long ;
xlim([-2,2]);
ylim([-2,2]);
hold on;
set(gcf,'WindowButtonDownFcn',@mouseDown);
set(gcf,'WindowButtonUpFcn',@mouseUp);
set(gcf,'WindowButtonMotionFcn',@mouseMotion);
set(gcf,'WindowKeyPressFcn',@keyPressed);
