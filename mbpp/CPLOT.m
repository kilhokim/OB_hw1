function y = CPLOT(C, flag)
% Plot circular obstacles

hold on;

temp = size(C);
numC = temp(1);

for j = 1:numC
    x = C(j,1);
    y = C(j,2);
    r = C(j,3);
    
    ang = 0:0.01:2*pi;
    xp = r*cos(ang);
    yp = r*sin(ang);
    
    if (flag == 0) 
        plot(x+xp, y+yp, '-');
    end
    
    if (flag == 1) 
        fill(x+xp, y+yp, 'c');
    end
                    
end
