close all;
clear all;

% Human Linkage

stature = 185;
L = LINK(stature);

% 변수 입력

X_tar = input('X_tar = ');
Y_tar = input('Y_tar = ');
load_tar = input('Load mass = ');
am = input('Asymmetry Multiplier = ');
cm = input('Coupling Multiplier = ');
fm = input('Frequency Multiplier = ');

T = [X_tar Y_tar];

% Obstacle Configuration: Box
% B = [x y w h; x y w h; ...]

%B = [20 140 60 20; 20 60 60 60; 60 120 20 60; 20 90 10 30];

%B = [-60 150 220 20];

%B = [-40 120 30 120; 40 120 30 120];
%B = [ 10 135 10 135; -20 130 10 130];
%B = [];

%B = [25 105 20 105];

B =[X_tar Y_tar 10 Y_tar];

% Obstacle Configuration: Sphere
% C = [x y r; x y r; ...]

C = [];

% Loading the relevant cell

XX = num2str(floor(X_tar/10)*10);
YY = num2str(floor(Y_tar/10)*10);

cell_name = ['CELL_X' XX 'Y' YY];
cell_name = strrep(cell_name, '-', 'N');

postures = load(cell_name);

temp = size(postures);
numP = temp(1);

% Draw World

figure (1);
axis([-60 140 0 200]);

set(gca, 'Xtick', -60:10:140);
set(gca, 'Ytick', 0:10:200);

grid on;
hold on;

% Draw Target

TPLOT(T);

% Draw Obstacle Configuration 

BPLOT(B,1);

fill([X_tar X_tar 73 73 X_tar],[Y_tar 185 185 Y_tar Y_tar], 'r');

% draw all postures in the loaded cell

for i=1:1,
   posture = postures(i,:);
   potential = POTENTIAL2(L, posture, B)
   
   if (potential == 0)
      VISUALIZE(1, L, posture);
    
   end;
   
end;

for x = X_tar:63,
    for y = Y_tar:175,
        RWL = 23 * (25/x) * (1-(0.003 * abs(y-75))) * (0.82 + (4.5/(y-Y_tar))) * am * cm * fm;
        if (RWL > (1/3 * load_tar))
            fill([x x x+10 x+10 x], [y y+10 y+10 y y], 'g');
        end;
    end;
end;

fill([X_tar X_tar+10 X_tar+10 X_tar X_tar], [Y_tar Y_tar Y_tar+10 Y_tar+10 Y_tar],'b');








