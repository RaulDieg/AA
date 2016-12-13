function pintarEntrenamientoRegLin(X, y)
  [Theta] = entrenameFmincg(X, y, 0);
  m = rows(X);
  plot(X, y, 'rx', 'MarkerSize', 10, 'LineWidth', 1.5);
  xlabel('Change in water level (x)');
  ylabel('Water flowing out of the dam (y)');
  hold on;
  plot(X, hipotesis([ones(m, 1) X], Theta), 'LineWidth', 2)
endfunction