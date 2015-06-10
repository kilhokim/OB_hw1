function y = NECK(L, P, T_center)

y = -1000;

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

h5x = s25x + HeadNeck*(s25x - s17x)/sqrt((s25x-s17x)^2+(s25y-s17y)^2);
h5y = s25y + HeadNeck*(s25y - s17y)/sqrt((s25x-s17x)^2+(s25y-s17y)^2);

h1x = s25x + 2/5*HeadNeck*(s25x - s17x)/sqrt((s25x-s17x)^2+(s25y-s17y)^2);
h1y = s25y + 2/5*HeadNeck*(s25y - s17y)/sqrt((s25x-s17x)^2+(s25y-s17y)^2);

h6x = h1x + cos(t1+t2+t3)*3/5*HeadNeck - sin(t1+t2+t3)*(-HeadDepth/2);
h6y = h1y + sin(t1+t2+t3)*3/5*HeadNeck + cos(t1+t2+t3)*(-HeadDepth/2);

h8x = h1x + cos(t1+t2+t3)*0 - sin(t1+t2+t3)*(-HeadDepth/2);
h8y = h1y + sin(t1+t2+t3)*0 + cos(t1+t2+t3)*(-HeadDepth/2);

% Eye location: h7
h7x = (h6x + h8x)/2;
h7y = (h6y + h8y)/2;


head_center = [(h5x+h1x)/2 (h5y+h1y)/2];
eye = [h7x h7y];
p3 = [s25x s25y];

head_target_dist = norm(head_center - T_center);
head_target_dist_y = head_center(2) - T_center(2);
head_target_angle = asind(head_target_dist_y/head_target_dist);

current_head_angle = 90 - (P(1)+P(2)+P(3));

diff = current_head_angle - head_target_angle;

if eye(1) > T_center(1) || p3(1) > T_center(1)
    return
end

    if diff > 0    
        temp1 = norm(head_center-p3)/norm(p3-T_center);
        
        if temp1>1 || temp1 <-1
            return
        end        
        
        alpha1 = acosd(temp1);
        
        % alpah2
        temp2 = (T_center(2)-p3(2))/norm(p3-T_center);

        if temp2>1 || temp2 <-1
            return
        end   
        alpha2 = asind(temp2);   
        
        neck = alpha1+alpha2 - (t1*180/pi+t2*180/pi+t3*180/pi);
 
    elseif diff < -15 
        temp3 = norm(p3-head_center)/norm(p3-eye);
        
        if temp3>1 || temp3 <-1
            return
        end   
        alpha3 = acosd(temp3);
        
        temp1 = norm(eye-p3)/norm(p3-T_center);
        
        if temp1>1 || temp1 <-1
            return
        end   
        alpha1 = acosd(temp1);
        
        % alpah2
        temp2 = (T_center(2)-p3(2))/norm(p3-T_center);

        if temp2>1 || temp2 <-1
            return
        end   
        alpha2 = asind(temp2);           

        neck = alpha1+alpha2+alpha3 - (t1*180/pi+t2*180/pi+t3*180/pi);        
    else 
        return
    end  
    
    if neck<-70 || neck > 45
        return
    end   
    
y = neck;
end


