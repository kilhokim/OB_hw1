function y = RANDOM_POSTURE();

% joint range of motion:
% 0<p1<90
% 0<p2<180
% -180<p3<0
% -225<p4<0
% 0<p5<180
% p6 = 0
% p7 = 0

p1_L = 45;
p1_U = 90;

p1 = p1_L + rand(1)*(p1_U - p1_L);

p2_L = 0;
p2_U = 160;

p2 = p2_L + rand(1)*(p2_U - p2_L);

p3_L = -160;
p3_U = 0;

p3 = p3_L + rand(1)*(p3_U - p3_L);

p4_L = -180;
p4_U = -20;

p4 = p4_L + rand(1)*(p4_U - p4_L);

p5_L = 30;
p5_U = 180;

p5 = p5_L + rand(1)*(p5_U - p5_L);

p6 = 0;
p7 = 0;



y = [p1 p2 p3 p4 p5 p6 p7];