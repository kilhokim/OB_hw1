%% *************************************************************
% Occupational Biomechanics
% Homework #1
% Industrial Engineering, Seoul National University
%
% author: Kilho Kim, Hakeun Jin
% **************************************************************
close all;
clear all;


%% Human Linkage
% IMPORTANT: This must be predefined 
% before generating postures of the fixed stature
stature = 185;
L = LINK(stature);


%% Input variables
gender = input('Gender(Man=1,WOMAN=0) = ');
age = input('Age = ');
X_tar = input('X_tar = ');
Y_tar = input('Y_tar = ');
load_tar = input('Load mass = ');
flag_volume = input('Add volume to the body(TRUE=1, FALSE=0) = ');

% R contains the thickness info of 5 body parts
R = THICKNESS(gender, age);

% The coordinates of the target (width=10, height=10)
T = [X_tar Y_tar];


%% Obstacles Configuration
% NOTE: This should be predefined before running

% Obstacle Configuration: Box
% B = [x y w h; x y w h; ...]
% Obstacle Configuration: Sphere
% C = [x y r; x y r; ...]

% Posture #1(Semiconductor factory)
% The number of possible postures decreases
% due to the volume of the knee part if x=30, y=80
% B = [X_tar-10 0 30 Y_tar; X_tar-10 Y_tar+20 30 50; X_tar+20 0 10 150]; % [X, Y, width, height]

% Posture #2(Stairs)
% Knee part hits the obstacle if x=50, y=50
%B = [X_tar-20 0 20 Y_tar-10;
%     X_tar 0 20 Y_tar; X_tar+20 0 20 Y_tar+20]; % [X, Y, width, height]

% posture #3(automobile)
% x=30, y= 160, 170, 180
height = Y_tar+10;
B = [-30 height 150 20;]; % [X, Y, width, height]
C = [-30+30 height-10 10; -30+150-30 height-10 10];


%% Load postures data from outer CELLs
% Loading the relevant cell
XX = num2str(floor(X_tar/10)*10);
YY = num2str(floor(Y_tar/10)*10);

cell_name = ['CELL_X' XX 'Y' YY];
cell_name = strrep(cell_name, '-', 'N');

% Load postures data from CELL_X##Y##
postures = load(fullfile('CELL', cell_name));

temp = size(postures);
numP = temp(1);


%% Draw world, target and obstacles
% Draw World
figure (1);
axis([-60 140 0 240]);

set(gca, 'Xtick', -60:10:140);
set(gca, 'Ytick', 0:10:240);

grid on;
hold on;

% Draw Target
TPLOT(T);

% Draw Obstacle Configuration 
BPLOT(B,1);
CPLOT(C,1);

% Fill the target with blue
fill([X_tar X_tar+10 X_tar+10 X_tar X_tar], [Y_tar Y_tar Y_tar+10 Y_tar+10 Y_tar],'b');


%% Draw all postures in the loaded cells
% NOTE: Change the value below to set the number of postures
% To set # to the maximum, change the value to numP
numPlot = 3;
REBAs = zeros(numPlot, 1);

% Plot for every posture in postures array
for i=1:1:numPlot
   posture = postures(i,:);
   % Checking collision: if there's collision, potential > 0
   potential = POTENTIAL2(L, posture, B, C, flag_volume, R);
   
   % Visualize plot only if there is no collision
   if (potential == 0)
      VISUALIZE(1, L, posture, flag_volume, R);
      REBAs(i) = REBA(L, posture, Y_tar, load_tar);
   end;
   
end;
