function visualizaEx2data1(datos)

  negativos = find(datos(:, columns(datos)) == 0);

  plot(datos(negativos, 1), datos(negativos, 2), 'ko', 'MarkerFaceColor', 'y', 'MarkerSize', 7);
  xlabel("Exam1 score")
  ylabel("Exam2 score")
  
  
  
  hold on
  
  positivos = find(datos(:, columns(datos)) == 1);

  plot(datos(positivos, 1), datos(positivos, 2), '+', 'MarkerFaceColor', 'y', 'MarkerSize', 7);
  legend(gca(), 'Admitted', 'Not admitted');
endfunction