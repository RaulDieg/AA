function sd = sigmoideDerivada(z)
  sd = sigmoide(z) .* (1 - sigmoide(z));
endfunction