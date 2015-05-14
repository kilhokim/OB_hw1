function y = CELL_CONSTRUCTION(stature)

for i=-60:10:130,
   for j=0:10:230,
      
      cname = ['CELL_S' num2str(stature) '_X' num2str(i) 'Y' num2str(j)];
      
      cname = strrep(cname, '-', 'N');
      a = fopen(fullfile('CELL', cname), 'a');
      fclose(a);
      
   end;
end;
