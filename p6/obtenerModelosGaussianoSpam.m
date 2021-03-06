function p = obtenerModelosGaussianoSpam(X, y, Xval, yval)
  valores = [0.01, 0.03, 0.1, 0.3, 1, 3, 10, 30];
  fila = 1;
  for i = valores
    for j = valores
      model = svmTrain(X, y, i, @(x1 , x2) gaussianKernel (x1 , x2 , j));
      p(fila) = damePorcentajeGaussiano(model , Xval, yval);
      fila++;
    endfor
  endfor

endfunction