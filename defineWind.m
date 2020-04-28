function [wind_direction,a] = defineWind()
    direction = 'Give wind direction\n0.none\n1.east\n2.west\n3.north\n4.south\n5.southeast\n6.northeast\n7.southwest\n8.northwest\nDirection(0-8) :';
    wind_direction =  input(direction);

    a=1;
    if wind_direction>0
        speed = 'Give wind speed\n0.light\n1.moderate\n2.strong\nWind speed(0-2) :';
        wind_speed = input(speed);
        if wind_speed==0
            a=0.8;
        elseif wind_speed==1
            a=0.5;
        elseif wind_speed==2
            a=0.2;
        end
    end
end