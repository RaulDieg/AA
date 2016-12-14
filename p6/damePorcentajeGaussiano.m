function p = damePorcentajeGaussiano(models, Xval, yval)
  m = columns(models);
  valores = [0.01, 0.03, 0.1, 0.3, 1, 3, 10, 30];
  fila = 1;

  for i = 1:m
    bienPredecidos = length(find((svmPredict(models(i), Xval) == yval) == 1));
    p(i) = (bienPredecidos/rows(yval)) * 100;
  endfor
  
  for i = valores
    for j = valores
      fprintf(['C: %f; sigma: %f; porcentaje: %f\n'], i, j, p(fila));
      fila++;
    endfor
  endfor
  
  [maximo ind] = max(p);
  i = ceil(ind/columns(valores));
  j = ind - ((i - 1) * columns(valores));
  fprintf(['Valor optimo->C: %f; sigma: %f; porcentaje: %f\n'], valores(i), valores(j), maximo);

endfunction