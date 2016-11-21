function [all_theta] = oneVsAll(X, y, num_etiquetas, lambda)
  n = columns(X);
  X = [ones(rows(X), 1) X];
  
  initial_theta = zeros (n + 1, 1);
  
  options = optimset ( "GradObj" , "on" , "MaxIter" , 50);
  
  for i = 1:num_etiquetas
    all_theta(i, :) = fmincg (@(t)(firstCostFunction(t , X, ( y == i ), lambda)), initial_theta, options);
  endfor
  
endfunction