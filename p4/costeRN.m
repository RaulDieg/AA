function [J grad] = costeRN (params_rn, num_entradas, num_ocultas, num_etiquetas, X, y, lambda)
  Theta1 = reshape(params_rn(1:num_ocultas * (num_entradas + 1)), num_ocultas, (num_entradas + 1));
  Theta2 = reshape(params_rn((1 + (num_ocultas * (num_entradas + 1))):end), num_etiquetas, (num_ocultas + 1));
  X = [ones(rows(X), 1) X];
  m = rows(X);
  
  ycodificado = eye(num_etiquetas);
  
  for k = 1:num_etiquetas
    (ycodificado(:, k) * log())
  
  endfor
  
  J = (1/m) * 

  
endfunction
