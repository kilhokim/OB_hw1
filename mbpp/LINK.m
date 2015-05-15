function y = LINK(stature)
% Calculate the length of body links

L1 = 0.285*stature;
L2 = (0.530-0.285)*stature;
L3 = (0.818-0.530)*stature;
L4 = 0.186*stature;
L5 = (0.146+0.108/2)*stature;

HeadNeck = (1-0.818)*stature;

y = [L1 L2 L3 L4 L5 HeadNeck];
