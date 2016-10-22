function puntos = generaPuntosAleatorios(inf, sup, maximo, numPuntos)
  puntos = [inf + (sup - inf) * rand(1, numPuntos); 0 + (maximo - 0) * rand(1, numPuntos)];
  
  #La primera fila de la matriz son las coordenadas X
  #y la segunda fila las coordenadas Y de los puntos
endfunction