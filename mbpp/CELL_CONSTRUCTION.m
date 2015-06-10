function y = CELL_CONSTRUCTION();

for i=-60:10:150,
   for j=0:10:230,
      
      cname = ['CELL_X' num2str(i) 'Y' num2str(j)];
      
      cname = strrep(cname, '-', 'N');
      a = fopen(cname, 'a');
      fclose(a);
      
   end;
end;
