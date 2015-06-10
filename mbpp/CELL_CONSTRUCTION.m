function y = CELL_CONSTRUCTION();
% Construct cells in the ./CELL folder

if ~exist('CELL', 'dir')
    mkdir('CELL')
end

for i=-60:10:150,
   for j=0:10:230,
      
      cname = ['CELL_X' num2str(i) 'Y' num2str(j)];
      
      cname = strrep(cname, '-', 'N');
      a = fopen(fullfile('CELL', cname), 'a');
      fclose(a);
      
   end;
end;
