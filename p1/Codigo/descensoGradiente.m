function [a, b]  = descensoGradiente(a, b, alfa, iteraciones, datos)
  for j = 1:iteraciones
    #probamos que vaya disminuyendo la funcion de coste
    #miCoste = coste(a, b, datos)
    sumatorio0 = sum(hipotesis(datos(:, 1), a, b) - datos(:, 2));
    sumatorio1 = sum((hipotesis(datos(:, 1), a, b) - datos(:, 2)) .* datos(:, 1));
    a = a - alfa * (1/rows(datos)) * sumatorio0;
    b = b - alfa * (1/rows(datos)) * sumatorio1;
  endfor
endfunction