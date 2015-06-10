function CELL_POSTURE_ANALYSIS()


temp_mean_file = zeros(22, 24);
temp_std_file = zeros(22, 24);

for i=-60:10:150
   for j=0:10:230
      
      cell_name = ['CELL_X' num2str(i) 'Y' num2str(j)];
      cell_name = strrep(cell_name, '-', 'N');      
      haha = importdata(cell_name);
      temp_size = size(haha);
      temp_length = temp_size(1);
      
      if temp_length ~= 1 && temp_length ~=0
            cell_posture_distance = zeros(1, 1000);
            num_target_pair = 1000;
            num_registered_pair = 0;
            
            while num_registered_pair < num_target_pair
                random_index1 = randi([1, temp_length]);
                random_index2 = randi([1, temp_length]);
                while random_index2 == random_index1
                    random_index2 = randi([1, temp_length]);
                end
                
                sample1 = haha(random_index1, :);
                sample2 = haha(random_index2, :);
                
                a1 = BODY_POINT_LOCATION(sample1(10:14), sample1(1:5));
                a2 = BODY_POINT_LOCATION(sample2(10:14), sample2(1:5));
                
                distance = norm(a1-a2);
                cell_posture_distance(1, num_registered_pair+1) = distance;
                num_registered_pair = num_registered_pair+1;
                
            end
            
            temp_mean_file((i/10+7), (j/10+1)) = mean(cell_posture_distance);
            temp_std_file((i/10+7), (j/10+1)) = std(cell_posture_distance);         

      end
      
   end;
end;

xlswrite('cell_posture_mean.xlsx', temp_mean_file);
xlswrite('cell_posture_std.xlsx', temp_std_file);

end

