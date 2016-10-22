function surface()
  vector1 = [-10:1:10]
  vector2 = [-1:1:4]
  
  for i=1:length(vector1)
    for j=1:length(vector2)
      Z(i,j) = coste(vector1(i),vector2(j), datos)
    endfor
  endfor

endfunction 