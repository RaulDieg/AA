function p = damePorcentajeLineal(models, Xval, yval)
  m = columns(models);
  valores = [0.01, 0.03, 0.1, 0.3, 1, 3, 10, 30];
  fila = 1;

  for i = 1:m
    bienPredecidos = length(find((svmPredict(models(i), Xval) == yval) == 1));
    p(i) = (bienPredecidos/rows(yval)) * 100;
  endfor
  
  for i = valores
      fprintf(['C: %f; porcentaje: %f\n'], i, p(fila));
      fila++;
  endfor
  
  [maximo ind] = max(p);
  i = ceil(ind/columns(valores));
  fprintf(['Valor optimo->C: %f; porcentaje: %f\n'], valores(i), maximo);

endfunction