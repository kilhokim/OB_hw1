%% *************************************************************
% Occupational Biomechanics
% Homework #1
%
% author: Kilho Kim, Hakeun Jin
% Information Management Lab
% Industrial Engineering, Seoul National University
% **************************************************************
close all;
clear all;

%% Input variables
X_tar = input('X_tar = ');
Y_tar = input('Y_tar = ');

% The coordinates of the target (width=10, height=10)
T = [X_tar Y_tar];
height = Y_tar+10;
B = [-30 height 150 20;]; % [X, Y, width, height]
C = [-30+30 height-10 10; -30+150-30 height-10 10];



figure (1);
title('Total possible postures');
axis([-60 140 0 200]);


COORD_DELTA = 10;
set(gca, 'Xtick', -60:COORD_DELTA:140);
set(gca, 'Ytick', 0:COORD_DELTA:200);

grid on;
hold on;

% Draw Target
TPLOT(T);
% Draw Obstacle Configuration 
%BPLOT(B,1);
%CPLOT(C,1);

x_min = 0;
x_max = 80;
y_min = 20;
y_max = 100;
for x = x_min:COORD_DELTA:x_max
    for y = y_min:COORD_DELTA:y_max
        plot([x, x+COORD_DELTA, x+COORD_DELTA, x, x], ...
             [y, y, y+COORD_DELTA, y+COORD_DELTA, y], '-');
    end
end


% Fill the target with blue
fill([X_tar X_tar+10 X_tar+10 X_tar X_tar], [Y_tar Y_tar Y_tar+10 Y_tar+10 Y_tar],'b');
