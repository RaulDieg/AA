function [J, grad] = coste(theta, X, y)

  numCols = columns(X);
  numFils = rows(X);
  
  grad = (1/numFils) * ((hipotesis(X', theta) - y') * X);
  grad = grad';
  
  J = (1/numFils) * sum((-y .* (log(hipotesis(X', theta)))') - ((1 - y) .* (log(1 - hipotesis(X', theta)))'));

endfunction