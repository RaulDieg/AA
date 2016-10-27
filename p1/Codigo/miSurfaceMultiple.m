function [X,Y,Z] = miSurfaceMultiple(datos)
  vector1 = [-10:0.2:10];
  vector2 = [-1:0.1:4];
  
  
  [X Y] = meshgrid(vector1, vector2);
  
  for j=1:length(vector2)
    for i=1:length(vector1)
      Z(j,i) = coste(vector1(i),vector2(j), datos);
    endfor
  endfor
  
endfunction 