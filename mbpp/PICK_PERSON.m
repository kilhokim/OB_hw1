function row = PICK_PERSON(gender, age, height, weight)

% gender = 1;
% age = 30;
% height = 180;
% weight = 70;

% pick the most similar person
pop = csvread('population_link.csv',1);

idx = (pop(:,2) == gender & floor(pop(:,3)/10) == floor(age/10));
pop_filtered = pop(idx,:);

diff = horzcat(pop_filtered(:,4) - height, pop_filtered(:,5) - weight);
dist = sqrt(diff(:,1).^2 +diff(:,2).^2);
[~, smallest_idx] = min(dist);

row = pop_filtered(smallest_idx,:);
end
