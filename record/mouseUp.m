function mouseUp(object,eventData)
    data = guidata(object);
    data.clicked = 0;
    guidata(object,data);
end