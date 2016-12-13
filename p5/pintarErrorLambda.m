function pintarErrorLambda(X, y, Xval, yval, p)
  lambda = [0, 0.001, 0.003, 0.01, 0.03, 1, 3, 10];
  
  options = optimset('MaxIter', 100, 'GradObj', 'on');
  m = rows(X);
  Xnorm = adaptaRegresionPoli(X, p);
  [Xnorm, mu, sigma] = featureNormalize(Xnorm);  % Normalize
  Xnorm = [ones(m, 1), Xnorm];                   % Add Ones

  Xnorm_val = adaptaRegresionPoli(Xval, p);
  Xnorm_val = bsxfun(@minus, Xnorm_val, mu);
  Xnorm_val = bsxfun(@rdivide, Xnorm_val, sigma);
  Xnorm_val = [ones(rows(Xnorm_val), 1), Xnorm_val];  

  Theta_ini= zeros(columns(Xnorm), 1);
  
  for i = 1:columns(lambda)
    costFunction = @(t) costeRegularizado(t, Xnorm, y, lambda(i));
    theta = fmincg(costFunction, Theta_ini, options);
    J(i) = calcularError(theta, Xnorm, y);
    Jval(i) = calcularError(theta, Xnorm_val, yval);
  endfor
  
  plot(lambda, J, 'LineWidth', 3, lambda, Jval, 'LineWidth', 3)
  
  axis([0 10 0 20])
  legend('Entrenamiento', 'Validacion')
  xlabel('Lambda')
  ylabel('Error')
  
end