function z = recta1(t)
  a0 = 0;
  a1 = 2;
  v = @(x) recta(x, a0, a1);
  z = v(t);
endfunction