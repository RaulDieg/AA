function porcentaje = damePorcentaje(theta, X, y)
  numFils = rows(X);
  bienPredecidos = 0;
  
  for fila = 1:numFils
    h = hipotesis(X(fila, :)', theta');
    
    [maximo clase] = max(h);
    
    if(y(fila) == clase)
      bienPredecidos = bienPredecidos + 1;
    endif
  endfor
  porcentaje = (bienPredecidos/numFils) * 100;

endfunction
