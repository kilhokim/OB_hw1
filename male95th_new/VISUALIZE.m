function y = VISUALIZE(fignum, L, P);

num_s = 21;
num_h = 8;
num_f = 21;
num_b = 21;

% Sensor coordinates to the body posture
s = LOCATE(L, P); 

% Head coordinates
h = s(num_s+1:num_s+8, :);

% ADDED: Front body coordinates
f = s(num_s+num_h+1:num_s+num_h+num_f, :);

% ADDED: Back body coordinates
b = s(num_s+num_h+num_f+1:num_s+num_h+num_f+num_b, :);

plot(s(1:num_s,1), s(1:num_s,2), '.-');
   
plot([s(13,1) h(1,1)], [s(13,2) h(1,2)], '.-');

% Plot head
plot([transpose(h(1:num_h,1)) h(1,1)], [transpose(h(1:num_h,2)) h(1,2)], '.-');
    
% ADDED: Plot the front and back of the body
plot(f(1:num_f,1), f(1:num_f,2), '.-');
plot(b(1:num_b,1), b(1:num_b,2), '.-');


com_loc = COM_LOCATION(L, P);

%plot([com_loc(1) com_loc(1)], [com_loc(2) com_loc(2)], '*');

%plot([s(21,1) s(21,1)], [s(21,2) s(21,2)], 'r*');


 
y = 1;




   
   
   
   