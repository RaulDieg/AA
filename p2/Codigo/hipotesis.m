function h = hipotesis(x, theta)

  #revisar resultados :=O
  h = sigmoide(theta' * x);

endfunction