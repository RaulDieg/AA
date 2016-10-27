function p = obtengoPorcentaje(X, y, theta)
  numFils = rows(X);
  puntosTotales = 0;
  bienPredecidos = 0;
  
  for fila = 1:numFils
    h = hipotesis(X(fila,:)', theta);
    
    if(h >= 0.5)
      h = 1;
    else
      h = 0;
    endif
 
    if(y(fila) == h)
      bienPredecidos = bienPredecidos + 1;
    endif
    
  endfor
  p = (bienPredecidos/numFils) * 100;
endfunction