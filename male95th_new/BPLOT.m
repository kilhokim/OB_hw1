function y = BPLOT(B, flag);

hold on;

temp = size(B);
numB = temp(1);


for j = 1:numB,
   x = B(j,1);
   y = B(j,2);
   w = B(j,3);
   h = B(j,4);
   
   if (flag == 0) plot ([x x+w x+w x x], [y y y+h y+h y],'-');
   end;
   
   if (flag == 1) fill([x x+w x+w x x], [y y y+h y+h y],'c');
   end;
   
end;

y = 1;

   
   