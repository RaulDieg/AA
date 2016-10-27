function [J, grad] = coste(theta, X, y)

  numCols = columns(X);
  numFils = rows(X);

  sumatorio = zeros(numCols, 1);
  suma = 0;
  
  for col = 1: numCols
    for fila = 1: numFils
         sumatorio(col, 1) =  sumatorio(col, 1) + (hipotesis((X(fila, :))', theta) -  y(fila)) .* X(fila, col);
    endfor
  endfor

  for fila = 1:numFils
    suma = suma + (-y(fila)*log(hipotesis(X(fila, :)', theta))) - ((1 - y(fila))*log(1 - hipotesis(X(fila, :)', theta)));
  endfor
  
  grad = (1/numFils) * sumatorio;
  J = (1/numFils) * suma;

endfunction