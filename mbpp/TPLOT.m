function y = TPLOT(T)
% Plot rectangular target object

hold on;

x = T(1);
y = T(2);
w = 10;
h = 10;

% xx = floor(x/10)*10;
% yy = floor(y/10)*10;

xx = x;
yy = y;
y = fill([xx xx+w xx+w xx xx], [yy yy yy+h yy+h yy],'r');
