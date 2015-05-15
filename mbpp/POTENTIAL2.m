function y = POTENTIAL2(L, P, B, C, flag_volume, R)
% Evaluate the potential function for a given posture

% Sensor coordinates to the body posture
if flag_volume == 1
    s = LOCATE_VOL(L, P, R);
else
    s = LOCATE_WOVOL(L, P);
end
flag = 0;

temp = size(s);
% Calculate the number of sensors' coordinates
numS = temp(1);

temp = size(B);
% Calculate the number of obstacles' info 
% (should be 1 at this case)
numB = temp(1);

temp = size(C);
numC = temp(1);

totalpt = 0;

for i=1:numS,
   Sx = s(i, 1);
   Sy = s(i, 2);
   
   for j=1:numB,
      
      Bx = B(j, 1);
      By = B(j, 2);
      Bw = B(j, 3);
      Bh = B(j, 4);
      
      % The center of the obstacle
      BCenterX = Bx + Bw/2;
      BCenterY = By - Bh/2;
      
      % If Sy is in [By, By+Bh] and Sx is in [Bx, Bx+Bw]
      % = if the sensor locations is within obstacle area:
      if ((Sy <= By+Bh) && (Sy >= By) && (Sx >= Bx) && (Sx <= (Bx+Bw)))
         
         distx = abs(Sx - BCenterX);
         disty = abs(Sy - BCenterY);
         
         % Calculate the squared distance 
         % between the sensor and the edge of obstacle
         pt = (Bh/2 - disty)^2 + (Bw/2 - distx)^2;
                  
         totalpt = totalpt + pt;
         
      end;
      
   end;  
   
   for j=1:numC
       Cx = C(j,1);
       Cy = C(j,2);
       Cr = C(j,3);
       
       % If the distance between (Sx,Sy) and (Cx,Cy) is shorter than Cr
       % = if the sensor location is within the range of circular obstacle:
       if norm([Sx Sy] - [Cx Cy]) <= Cr
           distx = abs(Sx - Cx);
           disty = abs(Sy - Cy);
           
           % Calculate the squared distance 
           % between the sensor and the edge of obstacle
           pt = Cr^2 - (distx^2 + disty^2);
           
           totalpt = totalpt + pt;
       end
       
       
   end
end;

y = totalpt;
