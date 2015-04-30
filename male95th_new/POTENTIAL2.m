% evaluate the potential function for a posture
function y = POTENTIAL2(L, P, B);

s = LOCATE(L, P);
flag = 0;

temp = size(s);
nums = temp(1);

temp = size(B);
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
      
      BCenterX = Bx + Bw/2;
      BCenterY = By - Bh/2;
      
      if ((Sy > By) | (Sy < (By-Bh)) | (Sx < Bx) | (Sx > (Bx+Bw)))
         
         totalpt = totalpt + 0;
         
      else
         
         distx = abs(Sx - BCenterX);
         disty = abs(Sy - BCenterY);
         
         pt = (Bh/2 - disty)^2 + (Bw/2 - distx)^2;
         
         totalpt = totalpt + pt;
         
      end;
      
   end;  
end;

y = totalpt;
