function y = locate(L, P);

%  This function is to place sensors to a posture P 

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

s5x = L1*cos(t1);
s5y = L1*sin(t1);

s9x = s5x + L2*cos(t1+t2);
s9y = s5y + L2*sin(t1+t2);

s13x = s9x + L3*cos(t1+t2+t3);
s13y = s9y + L3*sin(t1+t2+t3);

s17x = s13x + L4*cos(t1+t2+t3+t4);
s17y = s13y + L4*sin(t1+t2+t3+t4);

s21x = s17x + L5*cos(t1+t2+t3+t4+t5);
s21y = s17y + L5*sin(t1+t2+t3+t4+t5);


s2x = s1x + 1/4*(s5x - s1x);
s2y = s1y + 1/4*(s5y - s1y);

s3x = s1x + 2/4*(s5x - s1x);
s3y = s1y + 2/4*(s5y - s1y);

s4x = s1x + 3/4*(s5x - s1x);
s4y = s1y + 3/4*(s5y - s1y);


s6x = s5x + 1/4*(s9x - s5x);
s6y = s5y + 1/4*(s9y - s5y);

s7x = s5x + 2/4*(s9x - s5x);
s7y = s5y + 2/4*(s9y - s5y);

s8x = s5x + 3/4*(s9x - s5x);
s8y = s5y + 3/4*(s9y - s5y);


s10x = s9x + 1/4*(s13x - s9x);
s10y = s9y + 1/4*(s13y - s9y);

s11x = s9x + 2/4*(s13x - s9x);
s11y = s9y + 2/4*(s13y - s9y);

s12x = s9x + 3/4*(s13x - s9x);
s12y = s9y + 3/4*(s13y - s9y);

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

h7x = (h6x + h8x)/2;
h7y = (h6y + h8y)/2;


s14x = s13x + 1/4*(s17x - s13x);
s14y = s13y + 1/4*(s17y - s13y);

s15x = s13x + 2/4*(s17x - s13x);
s15y = s13y + 2/4*(s17y - s13y);

s16x = s13x + 3/4*(s17x - s13x);
s16y = s13y + 3/4*(s17y - s13y);


s18x = s17x + 1/4*(s21x - s17x);
s18y = s17y + 1/4*(s21y - s17y);

s19x = s17x + 2/4*(s21x - s17x);
s19y = s17y + 2/4*(s21y - s17y);

s20x = s17x + 3/4*(s21x - s17x);
s20y = s17y + 3/4*(s21y - s17y);


y = [s1x s1y; s2x s2y; s3x s3y; s4x s4y; s5x s5y; s6x s6y; s7x s7y; s8x s8y; ...
      s9x s9y; s10x s10y; s11x s11y; s12x s12y; s13x s13y; s14x s14y; s15x s15y; ...
      s16x s16y; s17x s17y; s18x s18y; s19x s19y; s20x s20y; s21x s21y; ...
      h1x h1y; h2x h2y; h3x h3y; h4x h4y; h5x h5y; h6x h6y; h7x h7y; h8x h8y];
   