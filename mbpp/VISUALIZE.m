function posture_plots = VISUALIZE(fignum, L, P, R, W, cmap_row)


num_s = 41;
pos_neck = 25;
num_h = 8;
num_f = 41;
num_b = 41;

% 다리 추가
num_ls = 17;
num_lf = 17;
num_lb = 17;

% Sensor coordinates to the body posture
[s, ns] = LOCATE_VOL_W(L, P, R, W);

% Head coordinates
h = s(num_s+1:num_s+num_h, :);

% plot(s(1:num_s,1), s(1:num_s,2), '.-k');

p1 = plot([ns(1,1) ns(3,1) ns(4,1) ns(2,1)], [ns(1,2) ns(3,2) ns(4,2) ns(2,2)], '.-','Color', cmap_row);

% Plot head
p2 = plot([transpose(h(1:num_h,1)) h(1,1)], [transpose(h(1:num_h,2)) h(1,2)], '.-', 'Color', cmap_row);


% ADDED: Front body coordinates
f = s(num_s+num_h+1:num_s+num_h+num_f, :);

% ADDED: Back body coordinates
b = s(num_s+num_h+num_f+1:num_s+num_h+num_f+num_b, :);

% ADDED: Plot the front and back of the body
p3 = plot(f(1:num_f,1), f(1:num_f,2), '.-k');
p4 = plot(b(1:num_b,1), b(1:num_b,2), '.-k');
p5 = plot([f(1:num_f,1); b(num_b:-1:1,1)], [f(1:num_f,2); b(num_b:-1:1,2)], '.-', 'Color', cmap_row);


% 다리 추가 그리기
if P(6)~=0 && P(7)~=0
    % plot(s(num_s+num_h+num_f+num_b+1:num_s+num_h+num_f+num_b+num_ls,1), s(num_s+num_h+num_f+num_b+1:num_s+num_h+num_f+num_b+num_ls,2), '.-k');
    % ADDED: Front body coordinates
    lf = s(num_s+num_h+num_f+num_b+num_ls+1:num_s+num_h+num_f+num_b+num_ls+num_lf, :);

    % ADDED: Back body coordinates
    lb = s(num_s+num_h+num_f+num_b+num_ls+num_lf+1:num_s+num_h+num_f+num_b+num_ls+num_lf+num_lb, :);
    
    % plot(lf(1:num_lf,1), lf(1:num_lf,2), '.-k');
    % plot(lb(1:num_lb,1), lb(1:num_lb,2), '.-k');
    p6 = plot([lf(1:num_lf,1); lb(num_lb:-1:1,1)], [lf(1:num_lf,2); lb(num_lb:-1:1,2)], '.-', 'Color', cmap_row);
end

if exist('p6', 'var')
    posture_plots = [p1 p2 p3 p4 p5 p6];
else
    posture_plots = [p1 p2 p3 p4 p5 -1];
end


% com_loc = COM_LOCATION(L, P);
%plot([com_loc(1) com_loc(1)], [com_loc(2) com_loc(2)], '*');
%plot([s(21,1) s(21,1)], [s(21,2) s(21,2)], 'r*');
% y = 1;