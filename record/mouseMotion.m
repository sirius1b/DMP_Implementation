function mouseClick(object, eventdata)
    data = guidata(object);
    if (data.clicked == 1 && data.record == 1)
        data.num = data.num + 1;
        C = get(gca,'CurrentPoint');
        title(gca,['(X,Y) = (', num2str(C(1,1)), ', ',num2str(C(1,2)), ')']);
        data.x = [data.x; C(1,1)];
        data.y = [data.y; C(1,2)];
        data.t_nows = [data.t_nows;now()];
        if (data.num > 1 && data.prev_click == 1)
            plot([data.x(data.num-1),data.x(data.num)],[data.y(data.num-1),data.y(data.num)]);
        end
        data.prev_click = 1;
        guidata(object,data);
    end
end