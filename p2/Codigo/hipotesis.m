function h = hipotesis(x, theta)
  h = sigmoide(theta' * x);
endfunction