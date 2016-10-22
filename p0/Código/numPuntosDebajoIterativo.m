function num = numPuntosDebajoIterativo(f, puntosRandom)
  num = 0;
  
  for i = 1:columns(puntosRandom)
    fy = f(puntosRandom(1, i));
    y = puntosRandom(2, i);
    if (fy > y)
      num++;
    endif
  endfor
  
endfunction