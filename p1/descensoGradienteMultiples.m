function T = descensoGradienteMultiples(T, alfa, iteraciones, datos)

  numCols = columns(datos);
  numFils = rows(datos);

  for j = 1:iteraciones
    sumatorio = zeros(numCols - 1, 1);
    for col = 1: numCols - 1
      for fila = 1:numFils
           X = datos(fila,1:numCols - 1);
           sumatorio(col, 1) =  sumatorio(col, 1) + (hipotesisMultiples(X', T) - datos(fila, numCols)) .* datos(fila, col);
      endfor
    endfor
    J(j) = costeMultiples(T,datos);
    T = T - (alfa * (1/rows(datos))* sumatorio);
  endfor
  ################################################
  ##Descomentar para pintar la funcion de coste ##
  ################################################
  #plot(0:(iteraciones-1), J(1:iteraciones), '-')
  #xlabel('Numero de iteraciones')
  #ylabel('Coste J')
  
endfunction