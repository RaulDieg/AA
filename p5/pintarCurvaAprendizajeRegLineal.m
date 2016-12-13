function pintarCurvaAprendizajeRegLineal(X, y, Xval, yval, lambda)
  m = rows(X);
  X = [ones(rows(X), 1) X];
  Xval = [ones(rows(Xval), 1) Xval];
  Theta_ini = zeros(2, 1);
  options = optimset('MaxIter', 100, 'GradObj', 'on');

  for i = 1 : m
    costFunction = @(t) costeRegularizado(t, X(1:i, :), y(1:i), 0);
    theta = fmincg(costFunction, Theta_ini, options);
    J(i) = costeRegularizado(theta, X(1:i, :), y(1:i), 0);
    Jval(i) = costeRegularizado(theta, Xval, yval, 0);
  endfor

  plot(1:m, J, 1:m, Jval);
  title('Curva de aprendizaje para la regresion lineal')
  legend('Entrenamiento', 'Validacion')
  xlabel('Numero de ejemplos de entrenamiento')
  ylabel('Error')
  axis([0 12 0 150])
endfunction