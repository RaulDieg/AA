function [X_norm, mu, sigma] = normalizaAtributo(X)

  cols = columns(X)-1;
  matrizFtrs = X(:,1:cols);
  
  mu = mean(matrizFtrs);
  sigma = std(matrizFtrs);
  
  X_norm = [(matrizFtrs - mu)./sigma X(:,columns(X))];
  
endfunction