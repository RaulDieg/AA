function visualizaEx2data2(datos)

  negativos = find(datos(:, columns(datos)) == 0);

  plot(datos(negativos, 1), datos(negativos, 2), 'ko', 'MarkerFaceColor', 'y', 'MarkerSize', 7);
  xlabel("Microchip test 1")
  ylabel("Microchip test 2")
  
  hold on
  
  positivos = find(datos(:, columns(datos)) == 1);

  plot(datos(positivos, 1), datos(positivos, 2), '+', 'MarkerFaceColor', 'y', 'MarkerSize', 7);

  legend(gca(), 'y = 0', 'y = 1');
endfunction