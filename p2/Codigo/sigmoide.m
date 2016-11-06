function s = sigmoide(z)
  s = 1 ./ (1 + exp(-z));
endfunction