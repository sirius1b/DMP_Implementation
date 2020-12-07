function mouseDown(object,eventData)
    data = guidata(object);
    data.clicked = 1;
    data.prev_click = 0;
    guidata(object,data);
end