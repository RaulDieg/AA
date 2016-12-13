function D = adaptaRegresionPoli(X, p)
  %X -> m x 1
  m = rows(X);

  D = zeros(m, p - 1); %p - 1 porque posteriormente ingreso la primer columna como X

  D = [X D];
  for i = 2 : p
    D(:, i) = (D(:, 1) .^ i);
  endfor

end