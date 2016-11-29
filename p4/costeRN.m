function [J grad] = costeRN (params_rn, num_entradas, num_ocultas, num_etiquetas, X, y, lambda)
  Theta1 = reshape(params_rn(1:num_ocultas * (num_entradas + 1)), num_ocultas, (num_entradas + 1));
  Theta2 = reshape(params_rn((1 + (num_ocultas * (num_entradas + 1))):end), num_etiquetas, (num_ocultas + 1));
  m = rows(X);
  
  yidentidad = eye(num_etiquetas); #generar matriz identidad
  ycodificada = yidentidad(y, :);
  
  a1 = [ones(rows(X), 1) X];
  z2 = Theta1 * a1';
  a2 = sigmoide(z2);
  a2 = [ones(1, columns(a2)); a2];
  z3 = Theta2 * a2; %aqui
  a3 = sigmoide(z3);
  h = a3;
  

  J = sum(sum((((-ycodificada) .* log(h)') - ((1 - ycodificada) .* log(1 - h)'))))/m;
  J = J + (lambda/(2 * m)) * (sum(sum(Theta1(:, 2:end) .^ 2)) + sum(sum(Theta2(:, 2:end) .^ 2)));
  
  sig3 = a3' - ycodificada; %CUIDAO
  sig2 = (Theta2' * sig3') .* sigmoideDerivada([ones(1, columns(z2)); z2]);
  
  d1 = sig2(2:end, :) * a1; 
  d2 = sig3' * a2';
  
  grad1 = ((1/m) * d1);
  grad2 = ((1/m) * d2);
  
  grad1(:, 2:end) += (lambda/m) * Theta1(:, 2:end);
  grad2(:, 2:end) += (lambda/m) * Theta2(:, 2:end);
  grad = [grad1(:); grad2(:)];
  
endfunction
