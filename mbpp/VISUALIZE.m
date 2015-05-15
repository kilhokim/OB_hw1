function y = VISUALIZE(fignum, L, P, flag_volume, R)
% Visualize body

num_s = 41;
pos_neck = 25;
num_h = 8;
num_f = 41;
num_b = 41;


% Sensor coordinates to the body posture
if flag_volume == 1
    s = LOCATE_VOL(L, P, R); 
else
    s = LOCATE_WOVOL(L, P); 
end

% Head coordinates
h = s(num_s+1:num_s+num_h, :);

plot(s(1:num_s,1), s(1:num_s,2), '.-');

plot([s(pos_neck,1) h(1,1)], [s(pos_neck,2) h(1,2)], '.-');

% Plot head
plot([transpose(h(1:num_h,1)) h(1,1)], [transpose(h(1:num_h,2)) h(1,2)], '.-');


if flag_volume == 1
    % ADDED: Front body coordinates
    f = s(num_s+num_h+1:num_s+num_h+num_f, :);

    % ADDED: Back body coordinates
    b = s(num_s+num_h+num_f+1:num_s+num_h+num_f+num_b, :);

    % ADDED: Plot the front and back of the body
    plot(f(1:num_f,1), f(1:num_f,2), '.-');
    plot(b(1:num_b,1), b(1:num_b,2), '.-');
end

com_loc = COM_LOCATION(L, P);

%plot([com_loc(1) com_loc(1)], [com_loc(2) com_loc(2)], '*');

%plot([s(21,1) s(21,1)], [s(21,2) s(21,2)], 'r*'); 

 
y = 1;




   
   
   
   