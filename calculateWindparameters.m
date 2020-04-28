function [w_N,w_S,w_E,w_W] = calculateWindparameters(wind_direction,a)
    if wind_direction ==  1                      % east
        w_N = 1; 
        w_S = 1; 
        w_E = a; 
        w_W = 1;
    elseif wind_direction ==  2                  % west
        w_N = 1; 
        w_S = 1; 
        w_E = 1; 
        w_W = a;
    elseif wind_direction == 3                   % north
        w_N = a;
        w_S = 1; 
        w_E = 1; 
        w_W = 1;
    elseif wind_direction == 4                   % south
        w_N = 1; 
        w_S = a; 
        w_E = 1; 
        w_W = 1;
    elseif wind_direction ==  5                  % southeast
        w_N = 1; 
        w_S = a; 
        w_E = a; 
        w_W = 1;
    elseif wind_direction ==  6                  % northeast
        w_N = a;
        w_S = 1; 
        w_E = a;
        w_W = 1;
    elseif wind_direction ==  7                  % southwest
        w_N = 1; 
        w_S = a;
        w_E = 1; 
        w_W = a;
    elseif wind_direction == 8                   % northwest
        w_N = a; 
        w_S = 1; 
        w_E = 1; 
        w_W = a;
    elseif wind_direction ==  0                  % none
        w_N = 1; 
        w_S = 1;
        w_E = 1; 
        w_W = 1;
    end
end