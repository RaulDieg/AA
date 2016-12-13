function e = errorHipotesis(X, y, Xtest, ytest, p)
  options = optimset('MaxIter', 100, 'GradObj', 'on');
  m = rows(X);
  Xnorm = adaptaRegresionPoli(X, p);
  [Xnorm, mu, sigma] = featureNormalize(Xnorm);  % Normalize
  Xnorm = [ones(m, 1), Xnorm];                   % Add Ones
  
  Xnorm_test  = adaptaRegresionPoli(Xtest, p);
  Xnorm_test  = bsxfun(@minus, Xnorm_test, mu);
  Xnorm_test  = bsxfun(@rdivide, Xnorm_test, sigma);
  Xnorm_test = [ones(rows(Xtest), 1) Xnorm_test];

  theta_ini_norm = zeros(columns(Xnorm), 1);
  
  costFunction = @(t) costeRegularizado(t, Xnorm, y, 3);
  theta = fmincg(costFunction, theta_ini_norm, options);

  e = costeRegularizado(theta, Xnorm_test, ytest, 0);
endfunction