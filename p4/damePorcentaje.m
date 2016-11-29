function porcentaje = damePorcentaje(Theta1, Theta2, X, y)
  m = rows(X);
  
  a1 = [ones(rows(X), 1) X];
  z2 = Theta1 * a1';
  a2 = sigmoide(z2);
  a2 = [ones(1, columns(a2)); a2];
  z3 = Theta2 * a2; %aqui
  a3 = sigmoide(z3);
  h = a3; %10x5000
  
  [maximo clase] = max(h);

  comparacion = (clase' == y);
  
  bienPredecidos = length(find(comparacion == 1));
  
  porcentaje = (bienPredecidos/m) * 100;
  
endfunction