% evaluate the potential function for a posture
function y = POTENTIAL2(L, P, B);

% Sensor coordinates to the body posture
s = LOCATE(L, P);
flag = 0;

temp = size(s);
% Calculate the number of sensors' coordinates
nums = temp(1);

temp = size(B);
% Calculate the number of obstacles' info 
% (should be 1 at this case)
numB = temp(1);

totalpt = 0;

for i=1:nums,
   for j=1:numB,
      
      Bx = B(j, 1);
      By = B(j, 2);
      Bw = B(j, 3);
      Bh = B(j, 4);
      
      Sx = s(i, 1);
      Sy = s(i, 2);
      
      % The center of the obstacle
      BCenterX = Bx + Bw/2;
      BCenterY = By - Bh/2;
      
      if ((Sy > By) | (Sy < (By-Bh)) | (Sx < Bx) | (Sx > (Bx+Bw)))
         
         totalpt = totalpt + 0;
         
      % If Sy is in [By-Bh, By] and Sx is in [Bx, Bx+Bw]
      % = if the sensor locations is within obstacle area:
      else
         
         distx = abs(Sx - BCenterX);
         disty = abs(Sy - BCenterY);
         
         % Calculate the squared distance 
         % between the sensor and the center of obstacle
         pt = (Bh/2 - disty)^2 + (Bw/2 - distx)^2;
         
         totalpt = totalpt + pt;
         
      end;
      
   end;  
end;

y = totalpt;
