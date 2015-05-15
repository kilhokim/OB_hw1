function R = THICKNESS(gender, age)
% Calculate the thickness of the body to represent body volume
% with given gender and age

% The thickness of the body:
% r1: lower leg, r2: upper leg, r3: breast, 
% r4: upper arm, r5: lower arm

if(gender == 1 && 0 < age <30)
r1 = 5.97;
r2 = 9.02;
r3 = 15.27;
r4 = 4.12;
r5 = 2.67;
end

if(gender == 1 && 30 <= age < 40)
r1 = 6.01;
r2 = 9.15;
r3 = 15.78;
r4 = 4.14;
r5 = 2.67;
end

if(gender == 1 && 40 <= age < 50)
r1 = 6.06;
r2 = 9.01;
r3 = 15.74;
r4 = 3.59;
r5 = 2.71;
end

if(gender == 1 && 50 <= age < 60)
r1 = 5.81;
r2 = 8.40;
r3 = 15.34;
r4 = 3.96;
r5 = 2.69;
end

if(gender == 1 && 60 <= age)
r1 = 5.78;
r2 = 8.40;
r3 = 15.33;
r4 = 3.96;
r5 = 2.72;
end

if(gender == 0 && 0 < age <30)
r1 = 5.53;
r2 = 8.69;
r3 = 13.36;
r4 = 3.59;
r5 = 2.37;
end

if(gender == 0 && 30 <= age <40)
r1 = 5.54;
r2 = 8.61;
r3 = 13.74;
r4 = 3.66;
r5 = 2.41;
end

if(gender == 0 && 40 <= age <50)
r1 = 5.57;
r2 = 8.63;
r3 = 14.15;
r4 = 3.66;
r5 = 2.44;
end

if(gender == 0 && 50 <= age <60)
r1 = 5.54;
r2 = 8.82;
r3 = 14.44;
r4 = 3.80;
r5 = 2.55;
end

if(gender == 0 && 60 <= age)
r1 = 5.47;
r2 = 8.58;
r3 = 14.56;
r4 = 3.82;
r5 = 2.58;
end

R = [r1 r2 r3 r4 r5];

end
