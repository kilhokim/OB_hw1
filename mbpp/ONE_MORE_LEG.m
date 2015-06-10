function y = ONE_MORE_LEG(L,P);

    L1 = L(1);
    L2 = L(2);

    p1 = P(1);
    p2 = P(2);
    p3 = P(3);
    p4 = P(4);
    p5 = P(5);
    
    bottom_to_hip = L1*sin(p1*pi/180) + L2*sin((p1+p2)*pi/180);

    p6_L = -(180-p1-p2);
    p6_U = -asin((bottom_to_hip-L1)/L2)*180/pi;

    if p6_U - p6_L > 0,
        p6 = p6_L + rand(1)*(p6_U - p6_L);
        thigh_vertical = L2*(-sin(p6*pi/180));
        calf_vertical = bottom_to_hip - thigh_vertical;
        
        p7_1 = 180 - asin(calf_vertical/L1)*180/pi;
        p7_2 = asin(calf_vertical/L1)*180/pi;
        
        tmp1_P = [p1 p2 p3 p4 p5 p6 p7_1];
        tmp2_P = [p1 p2 p3 p4 p5 p6 p7_2];
        
        torq1 = sum(abs(JOINT_TORQUE(L,tmp1_P)));
        torq2 = sum(abs(JOINT_TORQUE(L,tmp2_P)));
        
         if (torq1 < torq2) & (abs(p6) + p7_1 <= 180) % torque 1 is better
             p7 = p7_1;
         else % rear
             p7 = p7_2;
         end           

    else
        p6 = 0;
        p7 = 0;   
    end

y = [p1 p2 p3 p4 p5 p6 p7];