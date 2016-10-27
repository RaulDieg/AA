function y = coste(teta0, teta1, datos)
  y = 1/(2*rows(datos)) * sum((hipotesis(datos(:, 1),teta0, teta1) - datos(:, 2)).^2);
  
endfunction