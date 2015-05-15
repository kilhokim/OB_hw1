function y = SHOULDER_LOCATION(L, P)
% Calculate the coordinates of shoulders


L1 = L(1);
L2 = L(2);
L3 = L(3);
L4 = L(4);
L5 = L(5);

t1 = P(1)*pi/180;
t2 = P(2)*pi/180;
t3 = P(3)*pi/180;
t4 = P(4)*pi/180;
t5 = P(5)*pi/180;

AnkleX = 0;
AnkleY = 0;

KneeX = L1*cos(t1);
KneeY = L1*sin(t1);

HipX = KneeX + L2*cos(t1+t2);
HipY = KneeY + L2*sin(t1+t2);

ShoulX = HipX + L3*cos(t1+t2+t3);
ShoulY = HipY  + L3*sin(t1+t2+t3);

y = [ShoulX ShoulY];