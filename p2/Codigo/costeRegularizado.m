function [J, grad] = costeRegularizado(theta, X, y, lambda)

  numCols = columns(X);
  numFils = rows(X);
  
  grad = (1/numFils) * ((hipotesis(X', theta) - y') * X);
  grad = grad';
  grad(2:numCols, 1) = grad(2:numCols, 1) + ((lambda/numFils) * theta(2:numCols)); 
  
  J = ((1/numFils) * sum((-y .* (log(hipotesis(X', theta)))') - ((1 - y) .* (log(1 - hipotesis(X', theta)))'))) + ((lambda/(2*numFils)) * sum(theta.^2));
endfunction