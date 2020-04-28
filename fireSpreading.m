clear;
clc;
close all;

numofCells = 100; % number cels per dimension

centerCell = fix(numofCells/2); %center cell calculation of Cellular grid

timeIterations = 60;
%% Soil parameters

soil = ones(numofCells + 2);
soil(45:60,57:70) = 2;    % easy to burn
soil(20:30,60:70) = 0.5;    % not easily burned
soil(10:15,10:30) = 0;      % obstacle
%% Wind parameters

[wind_direction,a] = defineWind();
[w_N,w_S,w_E,w_W] = calculateWindparameters(wind_direction,a);
%% Cellular Automaton Initialization

CAstate = zeros(numofCells);
CAstate(centerCell ,centerCell) = 1;
%% Model implementation

contour(CAstate);
title('Simulation Result')
hold on;
pause(1);

for t=1:timeIterations % iterating through time steps
    nextState = zeros(numofCells + 2); %boundary conditions
    nextState(2:numofCells + 1,2:numofCells + 1)= CAstate;
    
    for i=2:numofCells + 1 % iterating through x-axis
        for j=2:numofCells + 1 % iterating through y-axis
            if CAstate(i-1,j-1) < 1 
                CAstate(i-1,j-1) = soil(i,j)*((1/9)*nextState(i,j)... % (i,j)
                    + (4/9)*(nextState(i-1,j)*w_N... % (i-1,j)
                    + nextState(i+1,j)*w_S... % (i+1,j)
                    + nextState(i,j-1)*w_W... % (i,j-1)
                    + nextState(i,j+1)*w_E)... % (i,j+1)
                    + .83*(4/9)*(nextState(i-1,j-1)*w_N*w_W.... % (i-1,j-1)
                    + nextState(i+1,j-1)*w_S*w_W... % (i+1,j-1)
                    + nextState(i-1,j+1)*w_N*w_E... % (i-1,j+1)
                    + nextState(i+1,j+1)*w_S*w_E)); % (i+1,j+1)
            end
        end
    end
    
    CAstate(CAstate>=1) = 1;
    if (mod(t,10) == 0)
        contour(CAstate);
    end
    pause(0.1);
end
hold off;