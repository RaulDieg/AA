function [J, grad] = costeRegularizado(Theta, X, y, lambda)
  m = rows(X);
  numCols = columns(X);
  
  grad = (1/m) * sum((hipotesis(X, Theta) - y) .* X)
  grad(:,2:numCols) += ((lambda/m) * Theta(2:numCols)); 
  J =(1/(2*m)) * (sum((hipotesis(X, Theta) - y) .^ 2) + (lambda/(2*m)) * sum(Theta(2:end).^2));
  
endfunction