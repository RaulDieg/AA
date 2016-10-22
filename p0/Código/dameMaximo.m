function maximo = dameMaximo(f, inf, d, sup)
  valores = inf:d:sup;
  maximo = max(f(valores));
endfunction