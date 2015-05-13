close all;
clear all;

% Human Linkage

stature = 185;
L = LINK(stature);

% ADDED: The thickness of the body:
r1 = 5.53;
r2 = 8.69;
r3 = 13.36;
r4 = 3.59;
r5 = 2.37;
R = [r1 r2 r3 r4 r5];

% input variables

X_tar = input('X_tar = ');
Y_tar = input('Y_tar = ');
load_tar = input('Load mass = ');
flag_volume = input('Add volume to the body(TRUE=1, FALSE=0) = ');
%am = input('Asymmetry Multiplier = ');
%cm = input('Coupling Multiplier = ');
%fm = input('Frequency Multiplier = ');

% The coordinates of the target (width=10, height=10)
T = [X_tar Y_tar];

% Obstacle Configuration: Box
% B = [x y w h; x y w h; ...]

%B = [20 140 60 20; 20 60 60 60; 60 120 20 60; 20 90 10 30];

%B = [-60 150 220 20];

%B = [-40 120 30 120; 40 120 30 120];
%B = [ 10 135 10 135; -20 130 10 130];
%B = [];

%B = [25 105 20 105];

% Coordinates of the obstacle is automatically
% defined, referring to the target locations
B = [X_tar 0 10 Y_tar;
     X_tar Y_tar+10 10 Y_tar]; % [X, Y, width, height]

% Obstacle Configuration: Sphere
% C = [x y r; x y r; ...]

C = [30 80 10];

% Loading the relevant cell

XX = num2str(floor(X_tar/10)*10);
YY = num2str(floor(Y_tar/10)*10);

cell_name = ['CELL_X' XX 'Y' YY];
cell_name = strrep(cell_name, '-', 'N');

% Load postures data from CELL_X##Y##
postures = load(fullfile('CELL', cell_name));

temp = size(postures);
numP = temp(1);

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

%fill([X_tar X_tar 73 73 X_tar],[Y_tar 185 185 Y_tar Y_tar], 'r');

% Fill the target with blue
fill([X_tar X_tar+10 X_tar+10 X_tar X_tar], [Y_tar Y_tar Y_tar+10 Y_tar+10 Y_tar],'b');


% draw all postures in the loaded cell

% Change the value below to set the number of postures
numPlot = 3;
REBAs = zeros(numPlot, 1);

% Plot for every posture in postures array
for i=1:1:numPlot
   posture = postures(i,:);
   % Checking collision 
   % if there's collision, potential > 0
   potential = POTENTIAL2(L, posture, B, C, flag_volume, R)
   
   % Visualize plot only if there is no collision
   if (potential == 0)
      VISUALIZE(1, L, posture, flag_volume, R);
      REBAs(i) = REBA(L, posture, Y_tar, load_tar);
   end;
   
end;

% FIXME: Why 63 and 175??
%for x = X_tar:63,
%    for y = Y_tar:175,
        % Calculate the Recommended Weight Limit(RWL) 
        % RWL = LC x HM x VM x DM x AM x FM x CM
        % HM, the Horizontal Multiplier factor
        % VM, the Vertical Multiplier factor
        % DM, the Distance Multiplier factor
        % FM, the Frequency Multiplier factor
        % AM, the Asymmetric Multiplier factor
        % CM, the Coupling Multiplier factor
        % RWL, the Recommended Weight Limit
        %RWL = 23 * (25/x) * (1-(0.003 * abs(y-75))) * (0.82 + (4.5/(y-Y_tar))) * am * cm * fm;
        % If RWL is over one third of load target weight,
        % Plot the imaginary target
        %if (RWL > (1/3 * load_tar))
            % Fill the imaginary target with green
            %fill([x x x+10 x+10 x], [y y+10 y+10 y y], 'g');
        %end;
%    end;
%end;









