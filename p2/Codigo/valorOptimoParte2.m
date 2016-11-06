function [theta,cost] = valorOptimoParte2(X, y, theta_inicial, lambda)
  opciones = optimset('GradObj', 'on', 'MaxIter', 400);
  [theta, cost] = fminunc(@(t)(costeRegularizado(t, X, y, lambda)), theta_inicial, opciones);
endfunction