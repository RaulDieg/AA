function [J, grad] = costeRegularizado(Theta, X, y, lambda)
  m = rows(X);
  numCols = rows(Theta);
  
  J =((1/(2*m)) * (sum((hipotesis(X, Theta) - y) .^ 2))) + ((lambda/(2*m)) * sum(Theta(2:end).^2));
  
  
  grad = (1/m) * sum((hipotesis(X, Theta) - y) .* X);
  
  if (m > 1)
    grad(:,2:end) += ((lambda/m) * Theta(2:end)');
  endif
  
  grad = grad';
endfunction