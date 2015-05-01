function y = VISUALIZE(fignum, L, P);

% Sensor coordinates to the body posture
s = LOCATE(L, P); 

% Head coordinates
h = s(22:29, :);

plot([s(1,1) s(2,1) s(3,1) s(4,1) s(5,1) s(6,1) s(7,1) s(8,1) ...
      s(9,1) s(10,1) s(11,1) s(12,1) s(13,1) s(14,1) s(15,1) s(16,1) ...
   s(17,1) s(18,1) s(19,1) s(20,1) s(21,1)], ...
      [s(1,2) s(2,2) s(3,2) s(4,2) s(5,2) s(6,2) s(7,2) s(8,2) ...
         s(9,2) s(10,2) s(11,2) s(12,2) s(13,2) s(14,2) s(15,2) s(16,2) ...
         s(17,2) s(18,2) s(19,2) s(20,2) s(21,2)], '.-');
   
plot([s(13,1) h(1,1)], [s(13,2) h(1,2)], '.-');

% Plot head
plot([h(1,1) h(2,1) h(3,1) h(4,1) h(5,1) h(6,1) h(7,1) h(8,1) h(1,1)], ...
   [h(1,2) h(2,2) h(3,2) h(4,2) h(5,2) h(6,2) h(7,2) h(8,2) h(1,2)], '.-');
    
com_loc = COM_LOCATION(L, P);

%plot([com_loc(1) com_loc(1)], [com_loc(2) com_loc(2)], '*');

%plot([s(21,1) s(21,1)], [s(21,2) s(21,2)], 'r*');


 
y = 1;




   
   
   
   