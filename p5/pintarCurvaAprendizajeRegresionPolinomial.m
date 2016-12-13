function pintarCurvaAprendizajeRegresionPolinomial(X, y, Xval, yval, lambda, p)
  options = optimset('MaxIter', 100, 'GradObj', 'on');
  m = rows(X);
  
  Xnorm = adaptaRegresionPoli(X, p);
  [Xnorm, mu, sigma] = featureNormalize(Xnorm);  % Normalize
  Xnorm = [ones(m, 1), Xnorm];                   % Add Ones

  Xnorm_val = adaptaRegresionPoli(Xval, p);
  Xnorm_val = bsxfun(@minus, Xnorm_val, mu);
  Xnorm_val = bsxfun(@rdivide, Xnorm_val, sigma);
  Xnorm_val = [ones(size(Xnorm_val, 1), 1), Xnorm_val];  

  Theta_ini= zeros(columns(Xnorm), 1);
  costFunction = @(t) costeRegularizado(t, Xnorm, y, 0);
  theta = fmincg(costFunction, Theta_ini, options);
  
  

  for i = 1 : m
    costFunction = @(t) costeRegularizado(t, Xnorm(1:i, :), y(1:i), lambda);
    theta = fmincg(costFunction, Theta_ini, options);
    J(i) = calcularError(theta, Xnorm(1:i, :), y(1:i));
    Jval(i) = calcularError(theta, Xnorm_val, yval);
  endfor
  
  plot(1:m, J, 'LineWidth', 3, (1:m), Jval, 'LineWidth', 2)
  axis([0 13 0 100])
  title('Curva de aprendizaaje para la regresion polinomica (lambda = 100)')
  legend('Entrenamiento', 'Validacion')
  xlabel('Numero de ejemplos de entrenamiento')
  ylabel('Error')
end