function M = Joint_Torque(L, P);

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

CM1X = AnkleX + (KneeX-AnkleX)*0.5253;
CM1Y = AnkleY + (KneeY-AnkleY)*0.5253;

CM2X = KneeX + (HipX-KneeX)*0.6281;
CM2Y = KneeY + (HipY-KneeY)*0.6281;

CM3X = HipX + (ShoulX-HipX)*0.6197;
CM3Y = HipY + (ShoulY-HipY)*0.6197;

CM4X = ShoulX + (ElboX-ShoulX)*0.5130;
CM4Y = ShoulY + (ElboY-ShoulY)*0.5130;

CM5X = ElboX + (HandX-ElboX)*0.6258;
CM5Y = ElboY + (HandY-ElboY)*0.6258;

UpperComX = (W3*CM3X + W4*CM4X + W5*CM5X)/(W3+W4+W5);

M5 = (CM5X - ElboX)*W5; R5 = W5;
M4 = M5 + (CM4X - ShoulX)*W4 + (ElboX - ShoulX)*R5; R4 = R5 + W4;
M3 = M4 + (CM3X - HipX)*W3 + (ShoulX - HipX)*R4; R3 = R4 + W3;

if t6==0 & t7==0,
    
    R31 = R3;

    M2 = M3/2 + (CM2X - KneeX)*W2/2 + (HipX - KneeX)*R31; R21 = R31 + W2/2;
    M1 = M2 + (CM1X - AnkleX)*W1/2 + (KneeX - AnkleX)*R21;
    
    M2_new = 0;
    M1_new = 0;
    
else
    
    KneeX_new = HipX + L2*cos(t6);
    KneeY_new = HipY + L2*sin(t6);

    AnkleX_new = KneeX_new - L1*cos(t7);
    AnkleY_new = 0;

    if UpperComX > KneeX_new 
        R31 = 0; R32 = R3;
    elseif UpperComX < KneeX 
        R31 = R3; R32 = 0;
    else
        R31 = (KneeX_new - UpperComX)/(KneeX_new - KneeX);
        R32 = (UpperComX - KneeX)/(KneeX_new - KneeX);
    end
    
    M2 = M3/2 + (CM2X - KneeX)*W2/2 + (HipX - KneeX)*R31; R21 = R31 + W2/2;
    M1 = M2 + (CM1X - AnkleX)*W1/2 + (KneeX - AnkleX)*R21;

    M2_new = M3/2 + (CM2X - KneeX_new)*W2/2 + (HipX - KneeX_new)*R32; R22 = R32 + W2/2;
    M1_new = M2_new + (CM2X - AnkleX_new)*W2/2 + (KneeX_new - AnkleX_new)*R22;
end


M = [M1 M2 M3 M4 M5 M1_new M2_new];