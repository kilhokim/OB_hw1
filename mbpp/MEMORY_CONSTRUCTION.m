function y = MEMORY_CONSTRUCTION(stature, num_trials, thresh)
% Populate postures and register them in cells

L = LINK(stature);  % Calculate lengths for each body link [L1, L2, L3, L4, L5, HeadNeck]

num_registered_posture = 0;
rec = [];

for i=-60:10:130,
   for j=0:10:230,
      
      cell_name = ['CELL_S' num2str(stature) '_X' num2str(i) 'Y' num2str(j)];
      cell_name = strrep(cell_name, '-', 'N');
      eval([cell_name ' = load(' ''''  fullfile('CELL', cell_name)  '''' ');']);
   end;
end;

for i=1:num_trials,
   
    P = RANDOM_POSTURE;  % Generate a new random posture [p1, p2, p3, p4, p5]
    COM_LOC = COM_LOCATION(L,P);  % Calculate a location of COM(center of mass)
    HAND_LOC = HAND_LOCATION(L,P);  % Calculate a location of hand [h1, h2]
    SHOULDER_LOC = SHOULDER_LOCATION(L,P);  % Calculate a location of shoulder

    H_S_DIST = norm(HAND_LOC - SHOULDER_LOC);  % Calculate a distance between hand and shoulder


    % If the COM isn't between (-5, 15)
    % or the hand location isn't on left or under (5, 0)
    % or the H-S distance is shorter than 20,
    % generate a new random posture and calculate values again:
    while ((COM_LOC(1)>15) || (COM_LOC(1)<-5) || (HAND_LOC(1)<5) || (H_S_DIST < 20) || (HAND_LOC(2)<=0) ), 

       P = RANDOM_POSTURE;
       COM_LOC = COM_LOCATION(L,P);
       HAND_LOC = HAND_LOCATION(L,P);
       SHOULDER_LOC = SHOULDER_LOCATION(L,P);

       H_S_DIST = norm(HAND_LOC - SHOULDER_LOC);


    end;  

    XX = num2str(floor(HAND_LOC(1)/10)*10);  % Round down at unit digit (to make it as a multiple of 10)
    YY = num2str(floor(HAND_LOC(2)/10)*10);  % Round down at unit digit (to make it as a multiple of 10)

    cell_name = ['CELL_S' num2str(stature) '_X' XX 'Y' YY];
    cell_name = strrep(cell_name, '-', 'N');

    % Save CELL_S###_X##Y## matrix as a temporary matrix a
    eval(['a = ' cell_name ';']); 

    temp = size(a);

    if (temp(1) == 0),
       % Add a new row to CELL_S###_X##Y## matrix with [p1, p2, p3, p4, p5, h1, h2]
       eval([cell_name ' = [' cell_name ' ; ' num2str(P) ' ' num2str(HAND_LOC) '];']);
    end;

    flag = 0;

    if (temp(1)~=0),

       for j=1:temp(1),

          % Calculate the distance between the row of a and P
          dist = sqrt((a(j,1)-P(1))^2 + (a(j,2)-P(2))^2 + (a(j,3)-P(3))^2 + (a(j,4)-P(4))^2+ (a(j,5)-P(5))^2);	

          % If the distance gets under the threshold, break loop
          if (dist<thresh),
             flag=1;
             break;
          end;

       end;

       % If the flag is still 0, repeat the same procedure
       if (flag==0),
          % Add a new row to CELL_S###_X##Y## matrix with [p1, p2, p3, p4, p5, h1, h2]
          eval([cell_name ' = [' cell_name ' ; ' num2str(P) ' ' num2str(HAND_LOC) '];']);

          % And increase the number of registered postures by 1
          num_registered_posture = num_registered_posture + 1;

       end;


    end;

    if (mod(i,1000)==0),
       rec = [rec; i num_registered_posture];
    end;


end;


% Write CELL_S###_X##Y## matrices to file
for i=-60:10:130,
   for j=0:10:230,
      
      cell_name = ['CELL_S' num2str(stature) '_X' num2str(i) 'Y' num2str(j)];
      cell_name = strrep(cell_name, '-', 'N');
      
      haha = fopen(fullfile('CELL', cell_name),'w');
      
      eval(['a = ' cell_name ';']); 
      
      temp = size(a);
      
      for k=1:(temp(1)),
         fprintf(haha, '%f %f %f %f %f %f %f\n', a(k,1), a(k,2), a(k,3), a(k,4), a(k,5), a(k,6), a(k,7));
      end;
      
      fclose(haha);
      
   end;
end;

y = rec;
