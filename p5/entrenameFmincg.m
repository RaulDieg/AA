function [Theta] = entrenameFmincg(X, y, lambda)
  options = optimset('MaxIter', 100, 'GradObj', 'on');
  X = [ones(rows(X), 1) X];
  Theta_ini = zeros(columns(X), 1);
  
  costFunction = @(t) costeRegularizado(t, X, y, lambda);
  Theta = fmincg(costFunction, Theta_ini, options);
endfunction