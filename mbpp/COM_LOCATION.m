function y = COM_LOCATION(L, P); % L:link, P:posture

W = 1;

% body segment parameters (Weight)
% leg + foot = 0.0582*W*2
% thigh = 0.1207*W*2
% trunk + head = 0.5801*W
% upper arm = 0.0263*W*2
% hand + forearm = 0.027*W*2

W1 = 2*0.0582*W;
W2 = 2*0.1207*W;
W3 = 0.5801*W;
W4 = 2*0.0263*W;
W5 = 2*0.027*W;

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
t6 = P(6)*pi/180;
t7 = P(7)*pi/180;

AnkleX = 0;
AnkleY = 0;

KneeX = L1*cos(t1);
KneeY = L1*sin(t1);

HipX = KneeX + L2*cos(t1+t2);
HipY = KneeY + L2*sin(t1+t2);

ShoulX = HipX + L3*cos(t1+t2+t3);
ShoulY = HipY  + L3*sin(t1+t2+t3);

ElboX = ShoulX + L4*cos(t1+t2+t3+t4);
ElboY = ShoulY + L4*sin(t1+t2+t3+t4);

HandX = ElboX + L5*cos(t1+t2+t3+t4+t5);
HandY = ElboY + L5*sin(t1+t2+t3+t4+t5);

KneeX_new = HipX + L2*cos(t6);
KneeY_new = HipY + L2*sin(t6);

AnkleX_new = KneeX_new - L1*cos(t7);
AnkleY_new = 0;

CM1X = AnkleX + (KneeX-AnkleX)*0.5253;
CM1Y = AnkleY + (KneeY-AnkleY)*0.5253;

CM2X = KneeX + (HipX-KneeX)*0.6281;
CM2Y = KneeY + (HipY-KneeY)*0.6281;

CM1X_new = AnkleX_new + (KneeX_new-AnkleX_new)*0.5253;
CM1Y_new = AnkleY_new + (KneeY_new-AnkleY_new)*0.5253;

CM2X_new = KneeX_new + (HipX-KneeX_new)*0.6281;
CM2Y_new = KneeY_new + (HipY-KneeY_new)*0.6281;

CM3X = HipX + (ShoulX-HipX)*0.6197;
CM3Y = HipY + (ShoulY-HipY)*0.6197;

CM4X = ShoulX + (ElboX-ShoulX)*0.5130;
CM4Y = ShoulY + (ElboY-ShoulY)*0.5130;

CM5X = ElboX + (HandX-ElboX)*0.6258;
CM5Y = ElboY + (HandY-ElboY)*0.6258;

COMX = (W1*CM1X/2 + W2*CM2X/2 + (W1*CM1X_new/2 + W2*CM2X_new/2) + W3*CM3X + W4*CM4X + W5*CM5X)/(W1+W2+W3+W4+W5);
COMY = (W1*CM1Y/2 + W2*CM2Y/2 + (W1*CM1Y_new/2 + W2*CM2Y_new/2) + W3*CM3Y + W4*CM4Y + W5*CM5Y)/(W1+W2+W3+W4+W5);

y = [COMX COMY AnkleX_new];