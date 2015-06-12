function rows = PICK_PEOPLE(num, gender, age_lower, age_upper)

% num = 100;
% gender = 1 | 2 | 3;
% age_lower = 30;
% age_upper = 40;
pop = csvread('population_link.csv',1);

idx = (pop(:,3) >= age_lower) & (pop(:,3) <= age_upper);
if (gender == 1 | gender == 2) 
    idx = idx & (pop(:,2) == gender);
end

pop_filtered_rows = pop(idx,:);
shuffled_rows = pop_filtered_rows(randperm(length(pop_filtered_rows)), :);

rows = shuffled_rows(1:num,:);
end
