function keyPressed(object,eventData)
    data = guidata(object);
    if (eventData.Key == 'r')
        data.record = mod(data.record + 1,2);
    elseif (eventData.Key == 'd')
        cla;
        data.x = [];
        data.y = [];
        data.t_nows = [];
        data.num = 0;
    elseif (eventData.Key == 's' )
        if ( data.lastKey ~= 's')
            data.lastKey = eventData.Key;
            fName = input("Enter File Name: ");
            dataStruct.x = data.x;
            dataStruct.y = data.y;
            dataStruct.t = datenum(data.t_nows - data.t_nows(1))*24*3600;
            dST = struct2table(dataStruct);
            writetable(dST,fName);
        end
    end
    guidata(object,data);
end