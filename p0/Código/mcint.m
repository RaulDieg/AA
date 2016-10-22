function I = mcint(fun, a, b, num_puntos)
  maximo = dameMaximo(fun, a, 0.01, b);
  puntosRandom = generaPuntosAleatorios(a, b, maximo, num_puntos);
  plot(puntosRandom(1,:),puntosRandom(2,:))
  tic();
  nDebajo = numPuntosDebajoIterativo(fun, puntosRandom);
  I = (nDebajo/num_puntos) * (b - a) * maximo
  tiempo_iterativo = toc()
  
  tic();
  nDebajo = numPuntosDebajoVectores(fun, puntosRandom);
  I = (nDebajo/num_puntos) * (b - a) * maximo
  tiempo_vectores = toc()

endfunction