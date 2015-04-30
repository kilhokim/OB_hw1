function y = MEMORY_CONSTRUCTION(num_trials);

stature = 160;
L = LINK(stature);
thresh = 20;

num_registered_posture = 0;
rec =[];

for i=-60:10:130,
   for j=0:10:230,
      
      cell_name = ['CELL_X' num2str(i) 'Y' num2str(j)];
      cell_name = strrep(cell_name, '-', 'N');
      eval([cell_name ' = load(' ''''  cell_name  '''' ');']);
   end;
end;

for i=1:num_trials,
   
P = RANDOM_POSTURE;
COM_LOC = COM_LOCATION(L,P);
HAND_LOC = HAND_LOCATION(L,P);
SHOULDER_LOC = SHOULDER_LOCATION(L,P);

H_S_DIST = norm(HAND_LOC - SHOULDER_LOC);


while ((COM_LOC(1)>15) | (COM_LOC(1)<-5) | (HAND_LOC(1)<5) | (H_S_DIST < 20) | (HAND_LOC(2)<=0) ), 
   
   P = RANDOM_POSTURE;
   COM_LOC = COM_LOCATION(L,P);
   HAND_LOC = HAND_LOCATION(L,P);
   
   SHOULDER_LOC = SHOULDER_LOCATION(L,P);

	H_S_DIST = norm(HAND_LOC - SHOULDER_LOC);


end;  

XX = num2str(floor(HAND_LOC(1)/10)*10);
YY = num2str(floor(HAND_LOC(2)/10)*10);

cell_name = ['CELL_X' XX 'Y' YY];
cell_name = strrep(cell_name, '-', 'N');

eval(['a = ' cell_name ';']); 

temp = size(a);

if (temp(1) == 0),
   eval([cell_name ' = [' cell_name ' ; ' num2str(P) ' ' num2str(HAND_LOC) '];']);
end;

flag = 0;

if (temp(1)~=0),
   
   for j=1:temp(1),
      
      dist = sqrt((a(j,1)-P(1))^2 + (a(j,2)-P(2))^2 + (a(j,3)-P(3))^2 + (a(j,4)-P(4))^2+ (a(j,5)-P(5))^2);	
      
      if (dist<thresh),
         flag=1;
         break;
      end;
      
   end;
   
   if (flag==0),
      
      eval([cell_name ' = [' cell_name ' ; ' num2str(P) ' ' num2str(HAND_LOC) '];']);
      
      num_registered_posture = num_registered_posture + 1;
      
   end;
  

end;

if (mod(i,1000)==0),
   rec = [rec; i num_registered_posture];
end;


end;



for i=-60:10:130,
   for j=0:10:230,
      
      cell_name = ['CELL_X' num2str(i) 'Y' num2str(j)];
      cell_name = strrep(cell_name, '-', 'N');
      
      haha = fopen(cell_name,'w');
      
      eval(['a = ' cell_name ';']); 
      
      temp = size(a);
      
      for k=1:(temp(1)),
         fprintf(haha, '%f %f %f %f %f %f %f\n', a(k,1), a(k,2), a(k,3), a(k,4), a(k,5), a(k,6), a(k,7));
      end;
      
      fclose(haha);
      
   end;
end;

y = rec;
