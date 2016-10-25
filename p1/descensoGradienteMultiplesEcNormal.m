function T = descensoGradienteMultiplesEcNormal(datos)
  
  colsFtr = columns(datos) - 1;
  X = datos(:,1:colsFtr);
  y = datos(:,colsFtr + 1);
  
  T = pinv(X'*X)*X'*y;
endfunction