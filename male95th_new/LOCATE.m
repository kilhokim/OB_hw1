function y = LOCATE(L, P);
%  This function is to place sensors to a posture P 

% ADDED: The thickness of the body:
r1 = 5.53;
r2 = 8.69;
r3 = 13.36;
r4 = 3.59;
r5 = 2.37;

L1 = L(1);
L2 = L(2);
L3 = L(3);
L4 = L(4);
L5 = L(5);

HeadNeck = L(6);
HeadDepth =15;

t1 = P(1)*pi/180;
t2 = P(2)*pi/180;
t3 = P(3)*pi/180;
t4 = P(4)*pi/180;
t5 = P(5)*pi/180;

r = 10;

s1x = 0;
s1y = 0;
b1x = s1x;
b1y = s1y;
f1x = s1x;
f1y = s1y;

s5x = L1*cos(t1);
s5y = L1*sin(t1);
b5x = s5x + r2*cos(t1+t2+(pi-t2)/2);
b5y = s5y + r2*sin(t1+t2+(pi-t2)/2);
f5x = s5x + r2*cos(t1+t2+(pi-t2)/2 - pi);
f5y = s5y + r2*sin(t1+t2+(pi-t2)/2 - pi);

s9x = s5x + L2*cos(t1+t2);
s9y = s5y + L2*sin(t1+t2);
b9x = s9x + r3*cos(t1+t2+t3-(pi-t2)/2+pi);
b9y = s9y + r3*sin(t1+t2+t3-(pi-t2)/2+pi);
f9x = s9x + r3*cos(t1+t2+t3-(pi-t2)/2);
f9y = s9y + r3*sin(t1+t2+t3-(pi-t2)/2);

s13x = s9x + L3*cos(t1+t2+t3);
s13y = s9y + L3*sin(t1+t2+t3);
b13x = s13x;
b13y = s13y;
f13x = s13x;
f13y = s13y;

s17x = s13x + L4*cos(t1+t2+t3+t4); 
s17y = s13y + L4*sin(t1+t2+t3+t4);
b17x = s17x + r4*cos(t1+t2+t3+t4+t5-(pi-t4)/2 - pi);
b17y = s17y + r4*sin(t1+t2+t3+t4+t5-(pi-t4)/2 - pi);
f17x = s17x + r4*cos(t1+t2+t3+t4+t5-(pi-t4)/2);
f17y = s17y + r4*sin(t1+t2+t3+t4+t5-(pi-t4)/2);

s21x = s17x + L5*cos(t1+t2+t3+t4+t5);
s21y = s17y + L5*sin(t1+t2+t3+t4+t5);
b21x = s21x;
b21y = s21y;
f21x = s21x;
f21y = s21y;


s2x = s1x + 1/4*(s5x - s1x);
s2y = s1y + 1/4*(s5y - s1y);
b2x = s2x + r1*cos(t1 + pi/2);
b2y = s2y + r1*sin(t1 + pi/2);
f2x = s2x + r1*cos(t1 - pi/2);
f2y = s2y + r1*sin(t1 - pi/2);

s3x = s1x + 2/4*(s5x - s1x);
s3y = s1y + 2/4*(s5y - s1y);
b3x = s3x + r1*cos(t1 + pi/2);
b3y = s3y + r1*sin(t1 + pi/2);
f3x = s3x + r1*cos(t1 - pi/2);
f3y = s3y + r1*sin(t1 - pi/2);

s4x = s1x + 3/4*(s5x - s1x);
s4y = s1y + 3/4*(s5y - s1y);
b4x = s4x + r1*cos(t1 + pi/2);
b4y = s4y + r1*sin(t1 + pi/2);
f4x = s4x + r1*cos(t1 - pi/2);
f4y = s4y + r1*sin(t1 - pi/2);

s6x = s5x + 1/4*(s9x - s5x);
s6y = s5y + 1/4*(s9y - s5y);
b6x = s6x + r2*cos(t1+t2 + pi/2);
b6y = s6y + r2*sin(t1+t2 + pi/2);
f6x = s6x + r2*cos(t1+t2 - pi/2);
f6y = s6y + r2*sin(t1+t2 - pi/2);

s7x = s5x + 2/4*(s9x - s5x);
s7y = s5y + 2/4*(s9y - s5y);
b7x = s7x + r2*cos(t1+t2 + pi/2);
b7y = s7y + r2*sin(t1+t2 + pi/2);
f7x = s7x + r2*cos(t1+t2 - pi/2);
f7y = s7y + r2*sin(t1+t2 - pi/2);

s8x = s5x + 3/4*(s9x - s5x);
s8y = s5y + 3/4*(s9y - s5y);
b8x = s8x + r2*cos(t1+t2 + pi/2);
b8y = s8y + r2*sin(t1+t2 + pi/2);
f8x = s8x + r2*cos(t1+t2 - pi/2);
f8y = s8y + r2*sin(t1+t2 - pi/2);

s10x = s9x + 1/4*(s13x - s9x);
s10y = s9y + 1/4*(s13y - s9y);
b10x = s10x + r3*cos(t1+t2+t3 + pi/2);
b10y = s10y + r3*sin(t1+t2+t3 + pi/2);
f10x = s10x + r3*cos(t1+t2+t3 - pi/2);
f10y = s10y + r3*sin(t1+t2+t3 - pi/2);

s11x = s9x + 2/4*(s13x - s9x);
s11y = s9y + 2/4*(s13y - s9y);
b11x = s11x + r3*cos(t1+t2+t3 + pi/2);
b11y = s11y + r3*sin(t1+t2+t3 + pi/2);
f11x = s11x + r3*cos(t1+t2+t3 - pi/2);
f11y = s11y + r3*sin(t1+t2+t3 - pi/2);

s12x = s9x + 3/4*(s13x - s9x);
s12y = s9y + 3/4*(s13y - s9y);
b12x = s12x + r3*cos(t1+t2+t3 + pi/2);
b12y = s12y + r3*sin(t1+t2+t3 + pi/2);
f12x = s12x + r3*cos(t1+t2+t3 - pi/2);
f12y = s12y + r3*sin(t1+t2+t3 - pi/2);

h5x = s13x + HeadNeck*(s13x - s9x)/sqrt((s13x-s9x)^2+(s13y-s9y)^2);
h5y = s13y + HeadNeck*(s13y - s9y)/sqrt((s13x-s9x)^2+(s13y-s9y)^2);

h1x = s13x + 2/5*HeadNeck*(s13x - s9x)/sqrt((s13x-s9x)^2+(s13y-s9y)^2);
h1y = s13y + 2/5*HeadNeck*(s13y - s9y)/sqrt((s13x-s9x)^2+(s13y-s9y)^2);

h4x = h1x + cos(t1+t2+t3)*3/5*HeadNeck - sin(t1+t2+t3)*(HeadDepth/2);
h4y = h1y + sin(t1+t2+t3)*3/5*HeadNeck + cos(t1+t2+t3)*(HeadDepth/2);

h6x = h1x + cos(t1+t2+t3)*3/5*HeadNeck - sin(t1+t2+t3)*(-HeadDepth/2);
h6y = h1y + sin(t1+t2+t3)*3/5*HeadNeck + cos(t1+t2+t3)*(-HeadDepth/2);

h8x = h1x + cos(t1+t2+t3)*0 - sin(t1+t2+t3)*(-HeadDepth/2);
h8y = h1y + sin(t1+t2+t3)*0 + cos(t1+t2+t3)*(-HeadDepth/2);

h2x = h1x + cos(t1+t2+t3)*0 - sin(t1+t2+t3)*(HeadDepth/2);
h2y = h1y + sin(t1+t2+t3)*0 + cos(t1+t2+t3)*(HeadDepth/2);

h3x = (h2x + h4x)/2;
h3y = (h2y + h4y)/2;

% Eye location: h7
h7x = (h6x + h8x)/2;
h7y = (h6y + h8y)/2;


s14x = s13x + 1/4*(s17x - s13x);
s14y = s13y + 1/4*(s17y - s13y);
b14x = s14x + r4*cos(t1+t2+t3+t4 + pi/2);
b14y = s14y + r4*sin(t1+t2+t3+t4 + pi/2);
f14x = s14x + r4*cos(t1+t2+t3+t4 - pi/2);
f14y = s14y + r4*sin(t1+t2+t3+t4 - pi/2);

s15x = s13x + 2/4*(s17x - s13x);
s15y = s13y + 2/4*(s17y - s13y);
b15x = s15x + r4*cos(t1+t2+t3+t4 + pi/2);
b15y = s15y + r4*sin(t1+t2+t3+t4 + pi/2);
f15x = s15x + r4*cos(t1+t2+t3+t4 - pi/2);
f15y = s15y + r4*sin(t1+t2+t3+t4 - pi/2);

s16x = s13x + 3/4*(s17x - s13x);
s16y = s13y + 3/4*(s17y - s13y);
b16x = s16x + r4*cos(t1+t2+t3+t4 + pi/2);
b16y = s16y + r4*sin(t1+t2+t3+t4 + pi/2);
f16x = s16x + r4*cos(t1+t2+t3+t4 - pi/2);
f16y = s16y + r4*sin(t1+t2+t3+t4 - pi/2);


s18x = s17x + 1/4*(s21x - s17x);
s18y = s17y + 1/4*(s21y - s17y);
b18x = s18x + r5*cos(t1+t2+t3+t4+t5 + pi/2);
b18y = s18y + r5*sin(t1+t2+t3+t4+t5 + pi/2);
f18x = s18x + r5*cos(t1+t2+t3+t4+t5 - pi/2);
f18y = s18y + r5*sin(t1+t2+t3+t4+t5 - pi/2);

s19x = s17x + 2/4*(s21x - s17x);
s19y = s17y + 2/4*(s21y - s17y);
b19x = s19x + r5*cos(t1+t2+t3+t4+t5 + pi/2);
b19y = s19y + r5*sin(t1+t2+t3+t4+t5 + pi/2);
f19x = s19x + r5*cos(t1+t2+t3+t4+t5 - pi/2);
f19y = s19y + r5*sin(t1+t2+t3+t4+t5 - pi/2);

s20x = s17x + 3/4*(s21x - s17x);
s20y = s17y + 3/4*(s21y - s17y);
b20x = s20x + r5*cos(t1+t2+t3+t4+t5 + pi/2);
b20y = s20y + r5*sin(t1+t2+t3+t4+t5 + pi/2);
f20x = s20x + r5*cos(t1+t2+t3+t4+t5 - pi/2);
f20y = s20y + r5*sin(t1+t2+t3+t4+t5 - pi/2);


y = [s1x s1y; s2x s2y; s3x s3y; s4x s4y; s5x s5y; s6x s6y; s7x s7y; s8x s8y; ...
      s9x s9y; s10x s10y; s11x s11y; s12x s12y; s13x s13y; s14x s14y; s15x s15y; ...
      s16x s16y; s17x s17y; s18x s18y; s19x s19y; s20x s20y; s21x s21y; ...
      h1x h1y; h2x h2y; h3x h3y; h4x h4y; h5x h5y; h6x h6y; h7x h7y; h8x h8y; ...
      f1x f1y; f2x f2y; f3x f3y; f4x f4y; f5x f5y; f6x f6y; f7x f7y; f8x f8y; ...
      f9x f9y; f10x f10y; f11x f11y; f12x f12y; f13x f13y; f14x f14y; ...
      f15x f15y; f16x f16y; f17x f17y; f18x f18y; f19x f19y; ...
      f20x f20y; f21x f21y; ...
      b1x b1y; b2x b2y; b3x b3y; b4x b4y; b5x b5y; b6x b6y; b7x b7y; b8x b8y; ...
      b9x b9y; b10x b10y; b11x b11y; b12x b12y; b13x b13y; b14x b14y; 
      b15x b15y; b16x b16y; b17x b17y; b18x b18y; b19x b19y; 
      b20x b20y; b21x b21y ];
   