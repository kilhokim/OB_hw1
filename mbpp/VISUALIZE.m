function y = VISUALIZE(fignum, L, P, R);

num_s = 41;
pos_neck = 25;
num_h = 8;
num_f = 41;
num_b = 41;

% �ٸ� �߰�
num_ls = 17;
num_lf = 17;
num_lb = 17;

% Sensor coordinates to the body posture
s = LOCATE_VOL(L, P, R);

% Head coordinates
h = s(num_s+1:num_s+num_h, :);

plot(s(1:num_s,1), s(1:num_s,2), '.-k');

plot([s(pos_neck,1) h(1,1)], [s(pos_neck,2) h(1,2)], '.-k');

% Plot head
plot([transpose(h(1:num_h,1)) h(1,1)], [transpose(h(1:num_h,2)) h(1,2)], '.-k');


% ADDED: Front body coordinates
f = s(num_s+num_h+1:num_s+num_h+num_f, :);

% ADDED: Back body coordinates
b = s(num_s+num_h+num_f+1:num_s+num_h+num_f+num_b, :);

% ADDED: Plot the front and back of the body
plot(f(1:num_f,1), f(1:num_f,2), '.-k');
plot(b(1:num_b,1), b(1:num_b,2), '.-k');


% �ٸ� �߰� �׸���
if P(6)~=0 && P(7)~=0
    plot(s(num_s+num_h+num_f+num_b+1:num_s+num_h+num_f+num_b+num_ls,1), s(num_s+num_h+num_f+num_b+1:num_s+num_h+num_f+num_b+num_ls,2), '.-k');
    % ADDED: Front body coordinates
    lf = s(num_s+num_h+num_f+num_b+num_ls+1:num_s+num_h+num_f+num_b+num_ls+num_lf, :);

    % ADDED: Back body coordinates
    lb = s(num_s+num_h+num_f+num_b+num_ls+num_lf+1:num_s+num_h+num_f+num_b+num_ls+num_lf+num_lb, :);
    
    plot(lf(1:num_lf,1), lf(1:num_lf,2), '.-k');
    plot(lb(1:num_lb,1), lb(1:num_lb,2), '.-k');
end




% com_loc = COM_LOCATION(L, P);
%plot([com_loc(1) com_loc(1)], [com_loc(2) com_loc(2)], '*');
%plot([s(21,1) s(21,1)], [s(21,2) s(21,2)], 'r*');
y = 1;