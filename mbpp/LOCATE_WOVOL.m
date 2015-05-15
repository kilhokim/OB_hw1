function y = LOCATE_WOVOL(L, P)
%  Place sensors to a given posture P (without body volume)

L1 = L(1);
L2 = L(2);
L3 = L(3);
L4 = L(4);
L5 = L(5);

HeadNeck = L(6);
HeadDepth = 15;

t1 = P(1)*pi/180;
t2 = P(2)*pi/180;
t3 = P(3)*pi/180;
t4 = P(4)*pi/180;
t5 = P(5)*pi/180;

s1x = 0;
s1y = 0;

s9x = L1*cos(t1);
s9y = L1*sin(t1);

s17x = s9x + L2*cos(t1+t2);
s17y = s9y + L2*sin(t1+t2);


s25x = s17x + L3*cos(t1+t2+t3);
s25y = s17y + L3*sin(t1+t2+t3);

s33x = s25x + L4*cos(t1+t2+t3+t4); 
s33y = s25y + L4*sin(t1+t2+t3+t4);

s41x = s33x + L5*cos(t1+t2+t3+t4+t5);
s41y = s33y + L5*sin(t1+t2+t3+t4+t5);


s2x = s1x + 1/8*(s9x - s1x);
s2y = s1y + 1/8*(s9y - s1y);

s3x = s1x + 2/8*(s9x - s1x);
s3y = s1y + 2/8*(s9y - s1y);

s4x = s1x + 3/8*(s9x - s1x);
s4y = s1y + 3/8*(s9y - s1y);

s5x = s1x + 4/8*(s9x - s1x);
s5y = s1y + 4/8*(s9y - s1y);

s6x = s1x + 5/8*(s9x - s1x);
s6y = s1y + 5/8*(s9y - s1y);

s7x = s1x + 6/8*(s9x - s1x);
s7y = s1y + 6/8*(s9y - s1y);

s8x = s1x + 7/8*(s9x - s1x);
s8y = s1y + 7/8*(s9y - s1y);


s10x = s9x + 1/8*(s17x - s9x);
s10y = s9y + 1/8*(s17y - s9y);

s11x = s9x + 2/8*(s17x - s9x);
s11y = s9y + 2/8*(s17y - s9y);

s12x = s9x + 3/8*(s17x - s9x);
s12y = s9y + 3/8*(s17y - s9y);

s13x = s9x + 4/8*(s17x - s9x);
s13y = s9y + 4/8*(s17y - s9y);

s14x = s9x + 5/8*(s17x - s9x);
s14y = s9y + 5/8*(s17y - s9y);

s15x = s9x + 6/8*(s17x - s9x);
s15y = s9y + 6/8*(s17y - s9y);

s16x = s9x + 7/8*(s17x - s9x);
s16y = s9y + 7/8*(s17y - s9y);


s18x = s17x + 1/8*(s25x - s17x);
s18y = s17y + 1/8*(s25y - s17y);

s19x = s17x + 2/8*(s25x - s17x);
s19y = s17y + 2/8*(s25y - s17y);

s20x = s17x + 3/8*(s25x - s17x);
s20y = s17y + 3/8*(s25y - s17y);

s21x = s17x + 4/8*(s25x - s17x);
s21y = s17y + 4/8*(s25y - s17y);

s22x = s17x + 5/8*(s25x - s17x);
s22y = s17y + 5/8*(s25y - s17y);

s23x = s17x + 6/8*(s25x - s17x);
s23y = s17y + 6/8*(s25y - s17y);

s24x = s17x + 7/8*(s25x - s17x);
s24y = s17y + 7/8*(s25y - s17y);


h5x = s25x + HeadNeck*(s25x - s17x)/sqrt((s25x-s17x)^2+(s25y-s17y)^2);
h5y = s25y + HeadNeck*(s25y - s17y)/sqrt((s25x-s17x)^2+(s25y-s17y)^2);

h1x = s25x + 2/5*HeadNeck*(s25x - s17x)/sqrt((s25x-s17x)^2+(s25y-s17y)^2);
h1y = s25y + 2/5*HeadNeck*(s25y - s17y)/sqrt((s25x-s17x)^2+(s25y-s17y)^2);

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


s26x = s25x + 1/8*(s33x - s25x);
s26y = s25y + 1/8*(s33y - s25y);

s27x = s25x + 2/8*(s33x - s25x);
s27y = s25y + 2/8*(s33y - s25y);

s28x = s25x + 3/8*(s33x - s25x);
s28y = s25y + 3/8*(s33y - s25y);

s29x = s25x + 4/8*(s33x - s25x);
s29y = s25y + 4/8*(s33y - s25y);

s30x = s25x + 5/8*(s33x - s25x);
s30y = s25y + 5/8*(s33y - s25y);

s31x = s25x + 6/8*(s33x - s25x);
s31y = s25y + 6/8*(s33y - s25y);

s32x = s25x + 7/8*(s33x - s25x);
s32y = s25y + 7/8*(s33y - s25y);


s34x = s33x + 1/8*(s41x - s33x);
s34y = s33y + 1/8*(s41y - s33y);

s35x = s33x + 2/8*(s41x - s33x);
s35y = s33y + 2/8*(s41y - s33y);

s36x = s33x + 3/8*(s41x - s33x);
s36y = s33y + 3/8*(s41y - s33y);

s37x = s33x + 4/8*(s41x - s33x);
s37y = s33y + 4/8*(s41y - s33y);

s38x = s33x + 5/8*(s41x - s33x);
s38y = s33y + 5/8*(s41y - s33y);

s39x = s33x + 6/8*(s41x - s33x);
s39y = s33y + 6/8*(s41y - s33y);

s40x = s33x + 7/8*(s41x - s33x);
s40y = s33y + 7/8*(s41y - s33y);


y = [s1x s1y; s2x s2y; s3x s3y; s4x s4y; s5x s5y; s6x s6y; s7x s7y; s8x s8y; ...
     s9x s9y; s10x s10y; s11x s11y; s12x s12y; s13x s13y; s14x s14y; s15x s15y; s16x s16y; ...
     s17x s17y; s18x s18y; s19x s19y; s20x s20y; s21x s21y; s22x s22y; s23x s23y; s24x s24y; ...
     s25x s25y; s26x s26y; s27x s27y; s28x s28y; s29x s29y; s30x s30y; s31x s31y; s32x s32y; ...
     s33x s33y; s34x s34y; s35x s35y; s36x s36y; s37x s37y; s38x s38y; s39x s39y; s40x s40y; ...
     s41x s41y; ...
     h1x h1y; h2x h2y; h3x h3y; h4x h4y; h5x h5y; h6x h6y; h7x h7y; h8x h8y ];
   