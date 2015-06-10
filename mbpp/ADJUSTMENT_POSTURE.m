function y = ADJUSTMENT_POSTURE(training_posture, training_length, L, modification_type)
y=1;
p1_L = 45;
p1_U = 90;

p2_L = 0;
p2_U = 160;

p3_L = -160;
p3_U = 0;

p4_L = -180;
p4_U = -20;

p5_L = 30;
p5_U = 180;

t6 = 0;
t7 = 0;
t6_kil = 0;


switch modification_type
    case 2   % 어깨 손 위치 고정, 정강이 각도 유지
        p3 = SHOULDER_LOCATION(training_length, training_posture);
        p5 = HAND_LOCATION(training_length, training_posture);
        t1 = training_posture(1);
        
        p1 = [L(1)*cosd(t1) L(1)*sind(t1)];
        
        temp1 = (L(2)^2 + L(3)^2 - norm(p1-p3)^2)/(2*L(2)*L(3));
        if temp1<-1 || temp1 >1
            return;
        end
        t3 = -180+acosd(temp1);
        
        temp2 = (L(4)^2 + L(5)^2 - norm(p3-p5)^2)/(2*L(4)*L(5));
        if temp2<-1 || temp2>1
            return;
        end
        t5 = 180 - acosd(temp2);
        
        temp31 = (L(2)^2 + norm(p1-p3)^2 - L(3)^2)/(2*L(2)*norm(p1-p3));
        if temp31<-1 || temp31 >1
            return;
        end
        t21 = acosd(temp31);
        
        temp32 = (p3(1)-p1(1))/(norm(p1-p3));
        if temp32<-1 || temp32 > 1
            return;
        end
        t22 = acosd(temp32)-t1;
        
        t2 = t21+t22;
        
        temp41 = (p5(1)-p3(1))/(norm(p3-p5));
        if temp41<-1 || temp41>1
            return;
        end
        
        t41 = acosd(temp41)-t1-t2-t3;
        if p3(2) > p5(2)
            t41 = -acosd(temp41)-t1-t2-t3;
        end
        
        temp42 = (L(4)^2 + norm(p3-p5)^2 - L(5)^2)/(2*L(4)*norm(p3-p5));
        if temp42 <-1 || temp42 >1
            return;
        end
        t42 = acosd(temp42);
        t4 = t41-t42;
        
    case 3 % 어깨 손 위치 고정, 등 각도 유지
        p3 = SHOULDER_LOCATION(training_length, training_posture);
        p5 = HAND_LOCATION(training_length, training_posture);
        p0 = [0 0];
        
        x2 = p3(1)-L(3)*cosd(training_posture(1)+training_posture(2)+training_posture(3));
        y2 = p3(2)-L(3)*sind(training_posture(1)+training_posture(2)+training_posture(3));
        p2 = [x2 y2];
        
        
        temp2 = (L(1)^2 + L(2)^2 - norm(p0-p2)^2)/(2*L(1)*L(2));
        if temp2<-1 || temp2 >1
            return;
        end
        t2=180-acosd(temp2);
        
        temp5 = (L(4)^2 + L(5)^2 - norm(p3-p5)^2)/(2*L(4)*L(5));
        if temp5<-1 || temp5 >1
            return;
        end
        t5 = 180 - acosd(temp5);
        
        temp12 = (p0(1)-p2(1))/norm(p0-p2);
        if temp12 < -1 || temp12 >1
            return;
        end
        t12 = acosd(temp12);
        
        temp11 = (L(1)^2+norm(p0-p2)^2-L(2)^2)/(2*L(1)*norm(p0-p2));
        if temp11 <-1 || temp11 >1
            return;
        end
        t11= acosd(temp11);
        t1 = 180-(t11 +t12);
        
        t3 = (training_posture(1)+training_posture(2)+training_posture(3))-(t1+t2);
        
        % %         case 2와 동일
        temp41 = (p5(1)-p3(1))/(norm(p3-p5));
        if temp41<-1 || temp41>1
            return;
        end
        
        t41 = acosd(temp41)-t1-t2-t3;
        if p3(2) > p5(2)
            t41 = -acosd(temp41)-t1-t2-t3;
        end
        
        temp42 = (L(4)^2 + norm(p3-p5)^2 - L(5)^2)/(2*L(4)*norm(p3-p5));
        if temp42 <-1 || temp42 >1
            return;
        end
        t42 = acosd(temp42);
        t4 = t41-t42;
        
    case 4 % 골반 손 위치 고정 등각도 유지
        p2 = HIP_LOCATION(training_length, training_posture);
        p5 = HAND_LOCATION(training_length, training_posture);
        p0 = [0 0];
        
        x3 = p2(1)+L(3)*cosd(training_posture(1)+training_posture(2)+training_posture(3));
        y3 = p2(2)+L(3)*sind(training_posture(1)+training_posture(2)+training_posture(3));
        p3 = [x3 y3];
        
        % %         case3과 동일
        temp2 = (L(1)^2 + L(2)^2 - norm(p0-p2)^2)/(2*L(1)*L(2));
        if temp2<-1 || temp2 >1
            return;
        end
        t2=180-acosd(temp2);
        
        temp5 = (L(4)^2 + L(5)^2 - norm(p3-p5)^2)/(2*L(4)*L(5));
        if temp5<-1 || temp5 >1
            return;
        end
        t5 = 180 - acosd(temp5);
        
        temp12 = (p0(1)-p2(1))/norm(p0-p2);
        if temp12 < -1 || temp12 >1
            return;
        end
        t12 = acosd(temp12);
        
        temp11 = (L(1)^2+norm(p0-p2)^2-L(2)^2)/(2*L(1)*norm(p0-p2));
        if temp11 <-1 || temp11 >1
            return;
        end
        t11= acosd(temp11);
        t1 = 180-(t11 +t12);
        
        t3 = (training_posture(1)+training_posture(2)+training_posture(3))-(t1+t2);
        
        temp41 = (p5(1)-p3(1))/(norm(p3-p5));
        if temp41<-1 || temp41>1
            return;
        end
        
        t41 = acosd(temp41)-t1-t2-t3;
        if p3(2) > p5(2)
            t41 = -acosd(temp41)-t1-t2-t3;
        end
        
        temp42 = (L(4)^2 + norm(p3-p5)^2 - L(5)^2)/(2*L(4)*norm(p3-p5));
        if temp42 <-1 || temp42 >1
            return;
        end
        t42 = acosd(temp42);
        t4 = t41-t42;
        
        
    case 5 % 골반 손 위치 고정, 앞팔 각도 유지
        p2 = HIP_LOCATION(training_length, training_posture);
        p5 = HAND_LOCATION(training_length, training_posture);
        p0 = [0 0];
        
        x4 = p5(1)-L(5)*cosd(training_posture(1)+training_posture(2)+training_posture(3)+training_posture(4)+training_posture(5));
        y4 = p5(2)-L(5)*sind(training_posture(1)+training_posture(2)+training_posture(3)+training_posture(4)+training_posture(5));
        p4 = [x4 y4];
        
        %        case3과 동일 부분
        temp2 = (L(1)^2 + L(2)^2 - norm(p0-p2)^2)/(2*L(1)*L(2));
        if temp2<-1 || temp2 >1
            return;
        end
        t2=180-acosd(temp2);
        
        temp12 = (p0(1)-p2(1))/norm(p0-p2);
        if temp12 < -1 || temp12 >1
            return;
        end
        t12 = acosd(temp12);
        
        temp11 = (L(1)^2+norm(p0-p2)^2-L(2)^2)/(2*L(1)*norm(p0-p2));
        if temp11 <-1 || temp11 >1
            return;
        end
        t11= acosd(temp11);
        t1 = 180-(t11 +t12);
        
        % %
        temp4 = (L(3)^2 + L(4)^2 - norm(p2-p4)^2)/(2*L(3)*L(4));
        if temp4 < -1 || temp4 >1
            return;
        end
        t4 = acosd(temp4)-180;
        
        temp32 = (-p2(1)+p4(1))/norm(p2-p4);
        if temp32 <-1 || temp32 >1
            return;
        end
        
        if p2(2)>p4(2)
            t32 = -acosd(temp32)-(t1+t2);
        else
            t32 = acosd(temp32)-(t1+t2);
        end
        
        
        temp31 = (L(3)^2 + norm(p2-p4)^2 - L(4)^2)/(2*L(3)*norm(p2-p4));
        if temp31 <-1 || temp31 >1
            return;
        end
        t31 = acosd(temp31);
        
        t3 = t31+t32;
        t5 = training_posture(1)+training_posture(2)+training_posture(3)+training_posture(4)+training_posture(5)-t1-t2-t3-t4;
end

new_posture = [t1, t2, t3, t4, t5, training_posture(6), training_posture(7)];
if training_posture(6)~=0 & training_posture(7)~=0

    temp_location = COM_LOCATION(training_length, training_posture);
    new_foot = [temp_location(3), 0];
      
    p2 = HIP_LOCATION(L, new_posture);
    
    temp71 = (new_foot(1)-p2(1))/(norm(p2-new_foot));
    if temp71 <-1 || temp71 >1
        return;
    end
    t71 = acosd(temp71);
    
    temp72 = (L(1)^2+norm(p2-new_foot)^2-L(2)^2)/(2*L(1)*norm(p2-new_foot));
    if temp72 <-1 || temp72 >1
        return;
    end
    t72 = acosd(temp72);
    t7 = 180-t71-t72;
    
    temp6 = (L(1)^2+L(2)^2-norm(p2-new_foot)^2)/(2*L(1)*L(2));
    if temp6 <-1 || temp6 >1
        return;
    end
    
    t6_kil = 180-acosd(temp6);
    t6 = -(180-t7-t6_kil);
    
    %   가능여부 파악하는 로직 
    p6_L = -(180-t1-t2);
    p6_U = 0;
    
    if t6 < p6_L || t6 > p6_U
        return
    end
end

y = [t1 t2 t3 t4 t5 t6 t7 0];





