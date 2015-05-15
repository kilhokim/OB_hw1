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


%% Human Linkage
% IMPORTANT: This must be predefined 
% before generating postures of the fixed stature
stature = input('Stature(cm) = ');
if (exist('CELL', 'dir') == 0)
    mkdir('CELL');
end

cname = ['CELL_S' num2str(stature) '_X' num2str(0) 'Y' num2str(0)];
if (exist(fullfile('CELL', cname), 'file') == 0 || ...
    str2num(cname(7:9)) ~= stature)
    CELL_CONSTRUCTION(stature);
    fprintf('Generating new memory cells... (this might take a while)\n');
    num_trials = input('Number of trials for posture generation(default=10000) = ');
    thresh = input('Threshold for posture generation(default=20) = ');
    MEMORY_CONSTRUCTION(stature, num_trials, thresh);    
end
L = LINK(stature);


%% Input variables
case_no = input('Case number(Semiconductor factory=1, Stairs=2, Automobile=3) = ');
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
% due to the volume of the knee part if x=40, y=80
if (case_no == 1)
    B = [X_tar-10 0 30 Y_tar; X_tar-10 Y_tar+20 30 50; X_tar+20 0 10 150]; % [X, Y, width, height]    
    C = [];
% Posture #2(Stairs)
% Knee part hits the obstacle if x=50, y=50
elseif (case_no == 2)
    B = [X_tar-20 0 20 Y_tar-10;
         X_tar 0 20 Y_tar; X_tar+20 0 20 Y_tar+20]; % [X, Y, width, height]
    C = [];
% posture #3(automobile)
% x=30, y= 160, 170, 180
else
    height = Y_tar+10;
    B = [-30 height 150 20;]; % [X, Y, width, height]
    C = [-30+30 height-10 10; -30+150-30 height-10 10];
end


%% Load postures data from outer CELLs
% Loading the relevant cell
XX = num2str(floor(X_tar/10)*10);
YY = num2str(floor(Y_tar/10)*10);

cell_name = ['CELL_S' num2str(stature) '_X' XX 'Y' YY];
cell_name = strrep(cell_name, '-', 'N');

% Load postures data from CELL_S###X##Y##
postures = load(fullfile('CELL', cell_name));

temp = size(postures);
numP = temp(1);


%% Draw world, target and obstacles
% Draw World
figure (1);
title('Total possible postures');
axis([-60 140 0 200]);

set(gca, 'Xtick', -60:10:140);
set(gca, 'Ytick', 0:10:200);

grid on;
hold on;

% Draw Target
TPLOT(T);

% Draw Obstacle Configuration 
BPLOT(B,1);
CPLOT(C,1);

% Fill the target with blue
fill([X_tar X_tar+10 X_tar+10 X_tar X_tar], [Y_tar Y_tar Y_tar+10 Y_tar+10 Y_tar],'b');


%% Draw all postures from the loaded cells
% NOTE: Change the value below to set the number of postures
% To set # to the maximum, change the value to numP
numPlot = numP;
REBAs = [];
possible_postures = [];

% Plot for every posture in postures array
for i=1:1:numPlot
   posture = postures(i,:);
   % Checking collision: if there's collision, potential > 0
   potential = POTENTIAL2(L, posture, B, C, flag_volume, R);
   
   % Visualize plot only if there is no collision
   if (potential == 0)
      VISUALIZE(1, L, posture, flag_volume, R);
      REBAs = [REBAs; REBA(L, posture, Y_tar, load_tar)];
      possible_postures = [possible_postures; posture];
   end;
end;


%% Draw possible postures only from the loaded cells
% Draw World
figure(2);
title('Recommended possible postures with the minimum REBA point');
axis([-60 140 0 200]);

set(gca, 'Xtick', -60:10:140);
set(gca, 'Ytick', 0:10:200);

grid on;
hold on;

% Draw Target
TPLOT(T);

% Draw Obstacle Configuration 
BPLOT(B,1);
CPLOT(C,1);

% Fill the target with blue
fill([X_tar X_tar+10 X_tar+10 X_tar X_tar], [Y_tar Y_tar Y_tar+10 Y_tar+10 Y_tar],'b');
min_REBA = min(REBAs);
min_postures = possible_postures(REBAs == min_REBA, :);
temp = size(min_postures);
for i=1:1:temp(1)
    posture = min_postures(i,:);
    VISUALIZE(1, L, posture, flag_volume, R);
    text(-55,10, sprintf('REBA = %1d', min_REBA));
end
