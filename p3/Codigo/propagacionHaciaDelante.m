function h = propagacionHaciaDelante(theta1, theta2, X)
  a2 = sigmoide(theta1 * X');
  a2 = a2';
  a2 = [ones(rows(a2), 1) a2];
  
  h = sigmoide(theta2 * a2');
endfunction 