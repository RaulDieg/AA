function [X_norm, mu, sigma] = normalizaAtributo(X)
  mu = mean(X);
  sigma = std(X);
  
  //X_norm = (X - mu)./sigma //REVISAR ESTO
endfunction