function model = obtenerModelosLineal(X, y)
  valores = [0.01, 0.03, 0.1, 0.3, 1, 3, 10, 30];
  fila = 1;
  for i = valores
    model(fila) = svmTrain(X, y, i,  @linearKernel , 1e-3, 20);
    fila++;
  endfor

endfunction