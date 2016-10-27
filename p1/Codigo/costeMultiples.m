function w = costeMultiples(T, datos)
  colsFtr = columns(datos) - 1;
  X = datos(:,1:colsFtr);
  y = datos(:,colsFtr + 1);
  
  w = (1/(2*rows(datos))) * ((X * T - y )' * (X * T - y));
endfunction