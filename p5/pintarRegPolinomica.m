function pintarRegPolinomica(X, y, p)
  options = optimset('MaxIter', 100, 'GradObj', 'on');
  m = rows(X);
  
  Xnorm = adaptaRegresionPoli(X, p);
  [Xnorm, mu, sigma] = featureNormalize(Xnorm);
  Xnorm = [ones(m, 1), Xnorm];                   


  Theta_ini= zeros(columns(Xnorm), 1);
  costFunction = @(t) costeRegularizado(t, Xnorm, y, 0);
  theta = fmincg(costFunction, Theta_ini, options);
  
  plotFit(-60, max(X), mu, sigma, theta, p)
  hold on
  plot(X, y, "xr",'MarkerSize', 7, 'LineWidth', 2)
  title('Regresion polinomica (lambda = 0)')
  xlabel('Cambio en el nivel del agua (x)')
  ylabel('Agua que derrama la presa (y)')
endfunction