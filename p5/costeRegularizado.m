function [J, grad] = costeRegularizado(Theta, X, y, lambda)
  Theta0 = Theta(1)
  Theta1 = Theta(2)
  numCols = columns(X);
  numFils = rows(X);
  grad = zeros(rows(Theta), 1);
  
  %grad = 2x1
  
  grad0 = (1/numFils) * sum((hipotesis(X, Theta)' - y) * X);
  grad1 = (1/numFils) * sum((hipotesis(X, Theta)' - y) * X)+LAMBDA;
  
  J = (1/(2 * numFils)) * sum(((hipotesis(X, Theta) - y) .^ 2)) + ((lambda/(2 * numFils)) * sum(Theta(2:end) .^ 2)); 
endfunction