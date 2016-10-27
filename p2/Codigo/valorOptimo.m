function [theta,cost] = valorOptimo(X, y, theta_inicial)
  opciones = optimset('GradObj', 'on', 'MaxIter', 400);
  [theta, cost] = fminunc(@(t)(coste(t, X, y)), theta_inicial, opciones);
endfunction