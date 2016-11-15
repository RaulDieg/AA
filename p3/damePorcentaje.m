function porcentaje = damePorcentaje(theta, X, y)
  numFils = rows(X);
  bienPredecidos = 0;
  h = hipotesis(X', theta');
  
  [maximo clase] = max(h);
  
  comparacion = (clase' == y);
  
  bienPredecidos = length(find(comparacion == 1));
  porcentaje = (bienPredecidos/length(comparacion)) * 100;
  
#########################################################  
## MODO SECUENCIAL ##
#########################################################  
#  for fila = 1:numFils
#    h = hipotesis(X(fila, :)', theta');
    
#    [maximo clase] = max(h);
    
#    if(y(fila) == clase)
#      bienPredecidos = bienPredecidos + 1;
#    endif
#  endfor
#  porcentaje = (bienPredecidos/numFils) * 100;
###########################################################
endfunction
