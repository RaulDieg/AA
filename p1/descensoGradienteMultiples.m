function T = descensoGradienteMultiples(T, alfa, iteraciones, datos)

  numCols = columns(datos);
  numFils = rows(datos);
  
  
  
  for j = 1:iteraciones
    #probamos que vaya disminuyendo la funcion de coste
    #miCoste = coste(a, b, datos)
    sumatorio = zeros(numCols - 1, 1);
    for col = 1: numCols - 1
      for fila = 1:numFils
           X = datos(fila,1:numCols - 1);
           sumatorio(col, 1) =  sumatorio(col, 1) + (hipotesisMultiples(X', T) - datos(fila, numCols)) .* datos(fila, col);
      endfor
    endfor
    
    T = T - (alfa * (1/rows(datos))* sumatorio);
  endfor
endfunction