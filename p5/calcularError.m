function e = calcularError(Theta, X, y)
  m = rows(X);
  numCols = rows(Theta);
  
  e = (1/(2*m)) * (sum((hipotesis(X, Theta) - y) .^ 2));
end