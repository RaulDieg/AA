function num = numPuntosDebajoVectores(f, puntosRandom)
  fy = f(puntosRandom(1, :));
  y = puntosRandom(2, :);
  
  num = length(find(fy > y))
endfunction