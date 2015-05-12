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
HeadDepth = 15;

t1 = P(1)*pi/180;
t2 = P(2)*pi/180;
t3 = P(3)*pi/180;
t4 = P(4)*pi/180;
t5 = P(5)*pi/180;

s1x = 0;
s1y = 0;
b1x = s1x;
b1y = s1y;
f1x = s1x;
f1y = s1y;

s9x = L1*cos(t1);
s9y = L1*sin(t1);
b9x = s9x + r2*cos(t1+t2+(pi-t2)/2);
b9y = s9y + r2*sin(t1+t2+(pi-t2)/2);
f9x = s9x + r2*cos(t1+t2+(pi-t2)/2 - pi);
f9y = s9y + r2*sin(t1+t2+(pi-t2)/2 - pi);

s17x = s9x + L2*cos(t1+t2);
s17y = s9y + L2*sin(t1+t2);
b17x = s17x + r3*cos(t1+t2+t3-(pi-t2)/2+pi);
b17y = s17y + r3*sin(t1+t2+t3-(pi-t2)/2+pi);
f17x = s17x + r3*cos(t1+t2+t3-(pi-t2)/2);
f17y = s17y + r3*sin(t1+t2+t3-(pi-t2)/2);

s25x = s17x + L3*cos(t1+t2+t3);
s25y = s17y + L3*sin(t1+t2+t3);
b25x = s25x;
b25y = s25y;
f25x = s25x;
f25y = s25y;

s33x = s25x + L4*cos(t1+t2+t3+t4); 
s33y = s25y + L4*sin(t1+t2+t3+t4);
b33x = s33x + r4*cos(t1+t2+t3+t4+t5-(pi-t4)/2 - pi);
b33y = s33y + r4*sin(t1+t2+t3+t4+t5-(pi-t4)/2 - pi);
f33x = s33x + r4*cos(t1+t2+t3+t4+t5-(pi-t4)/2);
f33y = s33y + r4*sin(t1+t2+t3+t4+t5-(pi-t4)/2);

s41x = s33x + L5*cos(t1+t2+t3+t4+t5);
s41y = s33y + L5*sin(t1+t2+t3+t4+t5);
b41x = s41x;
b41y = s41y;
f41x = s41x;
f41y = s41y;


s2x = s1x + 1/8*(s9x - s1x);
s2y = s1y + 1/8*(s9y - s1y);
b2x = s2x + r1*cos(t1 + pi/2);
b2y = s2y + r1*sin(t1 + pi/2);
f2x = s2x + r1*cos(t1 - pi/2);
f2y = s2y + r1*sin(t1 - pi/2);

s3x = s1x + 2/8*(s9x - s1x);
s3y = s1y + 2/8*(s9y - s1y);
b3x = s3x + r1*cos(t1 + pi/2);
b3y = s3y + r1*sin(t1 + pi/2);
f3x = s3x + r1*cos(t1 - pi/2);
f3y = s3y + r1*sin(t1 - pi/2);

s4x = s1x + 3/8*(s9x - s1x);
s4y = s1y + 3/8*(s9y - s1y);
b4x = s4x + r1*cos(t1 + pi/2);
b4y = s4y + r1*sin(t1 + pi/2);
f4x = s4x + r1*cos(t1 - pi/2);
f4y = s4y + r1*sin(t1 - pi/2);

s5x = s1x + 4/8*(s9x - s1x);
s5y = s1y + 4/8*(s9y - s1y);
b5x = s5x + r1*cos(t1 + pi/2);
b5y = s5y + r1*sin(t1 + pi/2);
f5x = s5x + r1*cos(t1 - pi/2);
f5y = s5y + r1*sin(t1 - pi/2);

s6x = s1x + 5/8*(s9x - s1x);
s6y = s1y + 5/8*(s9y - s1y);
b6x = s6x + r1*cos(t1 + pi/2);
b6y = s6y + r1*sin(t1 + pi/2);
f6x = s6x + r1*cos(t1 - pi/2);
f6y = s6y + r1*sin(t1 - pi/2);

s7x = s1x + 6/8*(s9x - s1x);
s7y = s1y + 6/8*(s9y - s1y);
b7x = s7x + r1*cos(t1 + pi/2);
b7y = s7y + r1*sin(t1 + pi/2);
f7x = s7x + r1*cos(t1 - pi/2);
f7y = s7y + r1*sin(t1 - pi/2);

s8x = s1x + 7/8*(s9x - s1x);
s8y = s1y + 7/8*(s9y - s1y);
b8x = s8x + r1*cos(t1 + pi/2);
b8y = s8y + r1*sin(t1 + pi/2);
f8x = s8x + r1*cos(t1 - pi/2);
f8y = s8y + r1*sin(t1 - pi/2);


s10x = s9x + 1/8*(s17x - s9x);
s10y = s9y + 1/8*(s17y - s9y);
b10x = s10x + r2*cos(t1+t2 + pi/2);
b10y = s10y + r2*sin(t1+t2 + pi/2);
f10x = s10x + r2*cos(t1+t2 - pi/2);
f10y = s10y + r2*sin(t1+t2 - pi/2);

s11x = s9x + 2/8*(s17x - s9x);
s11y = s9y + 2/8*(s17y - s9y);
b11x = s11x + r2*cos(t1+t2 + pi/2);
b11y = s11y + r2*sin(t1+t2 + pi/2);
f11x = s11x + r2*cos(t1+t2 - pi/2);
f11y = s11y + r2*sin(t1+t2 - pi/2);

s12x = s9x + 3/8*(s17x - s9x);
s12y = s9y + 3/8*(s17y - s9y);
b12x = s12x + r2*cos(t1+t2 + pi/2);
b12y = s12y + r2*sin(t1+t2 + pi/2);
f12x = s12x + r2*cos(t1+t2 - pi/2);
f12y = s12y + r2*sin(t1+t2 - pi/2);

s13x = s9x + 4/8*(s17x - s9x);
s13y = s9y + 4/8*(s17y - s9y);
b13x = s13x + r2*cos(t1+t2 + pi/2);
b13y = s13y + r2*sin(t1+t2 + pi/2);
f13x = s13x + r2*cos(t1+t2 - pi/2);
f13y = s13y + r2*sin(t1+t2 - pi/2);

s14x = s9x + 5/8*(s17x - s9x);
s14y = s9y + 5/8*(s17y - s9y);
b14x = s14x + r2*cos(t1+t2 + pi/2);
b14y = s14y + r2*sin(t1+t2 + pi/2);
f14x = s14x + r2*cos(t1+t2 - pi/2);
f14y = s14y + r2*sin(t1+t2 - pi/2);

s15x = s9x + 6/8*(s17x - s9x);
s15y = s9y + 6/8*(s17y - s9y);
b15x = s15x + r2*cos(t1+t2 + pi/2);
b15y = s15y + r2*sin(t1+t2 + pi/2);
f15x = s15x + r2*cos(t1+t2 - pi/2);
f15y = s15y + r2*sin(t1+t2 - pi/2);

s16x = s9x + 7/8*(s17x - s9x);
s16y = s9y + 7/8*(s17y - s9y);
b16x = s16x + r2*cos(t1+t2 + pi/2);
b16y = s16y + r2*sin(t1+t2 + pi/2);
f16x = s16x + r2*cos(t1+t2 - pi/2);
f16y = s16y + r2*sin(t1+t2 - pi/2);


s18x = s17x + 1/8*(s25x - s17x);
s18y = s17y + 1/8*(s25y - s17y);
b18x = s18x + r3*cos(t1+t2+t3 + pi/2);
b18y = s18y + r3*sin(t1+t2+t3 + pi/2);
f18x = s18x + r3*cos(t1+t2+t3 - pi/2);
f18y = s18y + r3*sin(t1+t2+t3 - pi/2);

s19x = s17x + 2/8*(s25x - s17x);
s19y = s17y + 2/8*(s25y - s17y);
b19x = s19x + r3*cos(t1+t2+t3 + pi/2);
b19y = s19y + r3*sin(t1+t2+t3 + pi/2);
f19x = s19x + r3*cos(t1+t2+t3 - pi/2);
f19y = s19y + r3*sin(t1+t2+t3 - pi/2);

s20x = s17x + 3/8*(s25x - s17x);
s20y = s17y + 3/8*(s25y - s17y);
b20x = s20x + r3*cos(t1+t2+t3 + pi/2);
b20y = s20y + r3*sin(t1+t2+t3 + pi/2);
f20x = s20x + r3*cos(t1+t2+t3 - pi/2);
f20y = s20y + r3*sin(t1+t2+t3 - pi/2);

s21x = s17x + 4/8*(s25x - s17x);
s21y = s17y + 4/8*(s25y - s17y);
b21x = s21x + r3*cos(t1+t2+t3 + pi/2);
b21y = s21y + r3*sin(t1+t2+t3 + pi/2);
f21x = s21x + r3*cos(t1+t2+t3 - pi/2);
f21y = s21y + r3*sin(t1+t2+t3 - pi/2);

s22x = s17x + 5/8*(s25x - s17x);
s22y = s17y + 5/8*(s25y - s17y);
b22x = s22x + r3*cos(t1+t2+t3 + pi/2);
b22y = s22y + r3*sin(t1+t2+t3 + pi/2);
f22x = s22x + r3*cos(t1+t2+t3 - pi/2);
f22y = s22y + r3*sin(t1+t2+t3 - pi/2);

s23x = s17x + 6/8*(s25x - s17x);
s23y = s17y + 6/8*(s25y - s17y);
b23x = s23x + r3*cos(t1+t2+t3 + pi/2);
b23y = s23y + r3*sin(t1+t2+t3 + pi/2);
f23x = s23x + r3*cos(t1+t2+t3 - pi/2);
f23y = s23y + r3*sin(t1+t2+t3 - pi/2);

s24x = s17x + 7/8*(s25x - s17x);
s24y = s17y + 7/8*(s25y - s17y);
b24x = s24x + r3*cos(t1+t2+t3 + pi/2);
b24y = s24y + r3*sin(t1+t2+t3 + pi/2);
f24x = s24x + r3*cos(t1+t2+t3 - pi/2);
f24y = s24y + r3*sin(t1+t2+t3 - pi/2);


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
b26x = s26x + r4*cos(t1+t2+t3+t4 + pi/2);
b26y = s26y + r4*sin(t1+t2+t3+t4 + pi/2);
f26x = s26x + r4*cos(t1+t2+t3+t4 - pi/2);
f26y = s26y + r4*sin(t1+t2+t3+t4 - pi/2);

s27x = s25x + 2/8*(s33x - s25x);
s27y = s25y + 2/8*(s33y - s25y);
b27x = s27x + r4*cos(t1+t2+t3+t4 + pi/2);
b27y = s27y + r4*sin(t1+t2+t3+t4 + pi/2);
f27x = s27x + r4*cos(t1+t2+t3+t4 - pi/2);
f27y = s27y + r4*sin(t1+t2+t3+t4 - pi/2);

s28x = s25x + 3/8*(s33x - s25x);
s28y = s25y + 3/8*(s33y - s25y);
b28x = s28x + r4*cos(t1+t2+t3+t4 + pi/2);
b28y = s28y + r4*sin(t1+t2+t3+t4 + pi/2);
f28x = s28x + r4*cos(t1+t2+t3+t4 - pi/2);
f28y = s28y + r4*sin(t1+t2+t3+t4 - pi/2);

s29x = s25x + 4/8*(s33x - s25x);
s29y = s25y + 4/8*(s33y - s25y);
b29x = s29x + r4*cos(t1+t2+t3+t4 + pi/2);
b29y = s29y + r4*sin(t1+t2+t3+t4 + pi/2);
f29x = s29x + r4*cos(t1+t2+t3+t4 - pi/2);
f29y = s29y + r4*sin(t1+t2+t3+t4 - pi/2);

s30x = s25x + 5/8*(s33x - s25x);
s30y = s25y + 5/8*(s33y - s25y);
b30x = s30x + r4*cos(t1+t2+t3+t4 + pi/2);
b30y = s30y + r4*sin(t1+t2+t3+t4 + pi/2);
f30x = s30x + r4*cos(t1+t2+t3+t4 - pi/2);
f30y = s30y + r4*sin(t1+t2+t3+t4 - pi/2);

s31x = s25x + 6/8*(s33x - s25x);
s31y = s25y + 6/8*(s33y - s25y);
b31x = s31x + r4*cos(t1+t2+t3+t4 + pi/2);
b31y = s31y + r4*sin(t1+t2+t3+t4 + pi/2);
f31x = s31x + r4*cos(t1+t2+t3+t4 - pi/2);
f31y = s31y + r4*sin(t1+t2+t3+t4 - pi/2);

s32x = s25x + 7/8*(s33x - s25x);
s32y = s25y + 7/8*(s33y - s25y);
b32x = s32x + r4*cos(t1+t2+t3+t4 + pi/2);
b32y = s32y + r4*sin(t1+t2+t3+t4 + pi/2);
f32x = s32x + r4*cos(t1+t2+t3+t4 - pi/2);
f32y = s32y + r4*sin(t1+t2+t3+t4 - pi/2);


s34x = s33x + 1/8*(s41x - s33x);
s34y = s33y + 1/8*(s41y - s33y);
b34x = s34x + r5*cos(t1+t2+t3+t4+t5 + pi/2);
b34y = s34y + r5*sin(t1+t2+t3+t4+t5 + pi/2);
f34x = s34x + r5*cos(t1+t2+t3+t4+t5 - pi/2);
f34y = s34y + r5*sin(t1+t2+t3+t4+t5 - pi/2);

s35x = s33x + 2/8*(s41x - s33x);
s35y = s33y + 2/8*(s41y - s33y);
b35x = s35x + r5*cos(t1+t2+t3+t4+t5 + pi/2);
b35y = s35y + r5*sin(t1+t2+t3+t4+t5 + pi/2);
f35x = s35x + r5*cos(t1+t2+t3+t4+t5 - pi/2);
f35y = s35y + r5*sin(t1+t2+t3+t4+t5 - pi/2);

s36x = s33x + 3/8*(s41x - s33x);
s36y = s33y + 3/8*(s41y - s33y);
b36x = s36x + r5*cos(t1+t2+t3+t4+t5 + pi/2);
b36y = s36y + r5*sin(t1+t2+t3+t4+t5 + pi/2);
f36x = s36x + r5*cos(t1+t2+t3+t4+t5 - pi/2);
f36y = s36y + r5*sin(t1+t2+t3+t4+t5 - pi/2);

s37x = s33x + 4/8*(s41x - s33x);
s37y = s33y + 4/8*(s41y - s33y);
b37x = s37x + r5*cos(t1+t2+t3+t4+t5 + pi/2);
b37y = s37y + r5*sin(t1+t2+t3+t4+t5 + pi/2);
f37x = s37x + r5*cos(t1+t2+t3+t4+t5 - pi/2);
f37y = s37y + r5*sin(t1+t2+t3+t4+t5 - pi/2);

s38x = s33x + 5/8*(s41x - s33x);
s38y = s33y + 5/8*(s41y - s33y);
b38x = s38x + r5*cos(t1+t2+t3+t4+t5 + pi/2);
b38y = s38y + r5*sin(t1+t2+t3+t4+t5 + pi/2);
f38x = s38x + r5*cos(t1+t2+t3+t4+t5 - pi/2);
f38y = s38y + r5*sin(t1+t2+t3+t4+t5 - pi/2);

s39x = s33x + 6/8*(s41x - s33x);
s39y = s33y + 6/8*(s41y - s33y);
b39x = s39x + r5*cos(t1+t2+t3+t4+t5 + pi/2);
b39y = s39y + r5*sin(t1+t2+t3+t4+t5 + pi/2);
f39x = s39x + r5*cos(t1+t2+t3+t4+t5 - pi/2);
f39y = s39y + r5*sin(t1+t2+t3+t4+t5 - pi/2);

s40x = s33x + 7/8*(s41x - s33x);
s40y = s33y + 7/8*(s41y - s33y);
b40x = s40x + r5*cos(t1+t2+t3+t4+t5 + pi/2);
b40y = s40y + r5*sin(t1+t2+t3+t4+t5 + pi/2);
f40x = s40x + r5*cos(t1+t2+t3+t4+t5 - pi/2);
f40y = s40y + r5*sin(t1+t2+t3+t4+t5 - pi/2);


y = [s1x s1y; s2x s2y; s3x s3y; s4x s4y; s5x s5y; s6x s6y; s7x s7y; s8x s8y; ...
     s9x s9y; s10x s10y; s11x s11y; s12x s12y; s13x s13y; s14x s14y; s15x s15y; s16x s16y; ...
     s17x s17y; s18x s18y; s19x s19y; s20x s20y; s21x s21y; s22x s22y; s23x s23y; s24x s24y; ...
     s25x s25y; s26x s26y; s27x s27y; s28x s28y; s29x s29y; s30x s30y; s31x s31y; s32x s32y; ...
     s33x s33y; s34x s34y; s35x s35y; s36x s36y; s37x s37y; s38x s38y; s39x s39y; s40x s40y; ...
     s41x s41y; ...
     h1x h1y; h2x h2y; h3x h3y; h4x h4y; h5x h5y; h6x h6y; h7x h7y; h8x h8y; ...
     f1x f1y; f2x f2y; f3x f3y; f4x f4y; f5x f5y; f6x f6y; f7x f7y; f8x f8y; ...
     f9x f9y; f10x f10y; f11x f11y; f12x f12y; f13x f13y; f14x f14y; f15x f15y; f16x f16y; ...
     f17x f17y; f18x f18y; f19x f19y; f20x f20y; f21x f21y; f22x f22y; f23x f23y; f24x f24y; ...
     f25x f25y; f26x f26y; f27x f27y; f28x f28y; f29x f29y; f30x f30y; f31x f31y; f32x f32y; ...
     f33x f33y; f34x f34y; f35x f35y; f36x f36y; f37x f37y; f38x f38y; f39x f39y; f40x f40y; ...
     f41x f41y; ...
     b1x b1y; b2x b2y; b3x b3y; b4x b4y; b5x b5y; b6x b6y; b7x b7y; b8x b8y; ...
     b9x b9y; b10x b10y; b11x b11y; b12x b12y; b13x b13y; b14x b14y; b15x b15y; b16x b16y; ...
     b17x b17y; b18x b18y; b19x b19y; b20x b20y; b21x b21y; b22x b22y; b23x b23y; b24x b24y; ...
     b25x b25y; b26x b26y; b27x b27y; b28x b28y; b29x b29y; b30x b30y; b31x b31y; b32x b32y; ...
     b33x b33y; b34x b34y; b35x b35y; b36x b36y; b37x b37y; b38x b38y; b39x b39y; b40x b40y; ...
     b41x b41y ];
   