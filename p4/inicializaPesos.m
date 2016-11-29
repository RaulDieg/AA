function  W = inicializaPesos(L_in, L_out)
  eini = sqrt(6)/sqrt(L_in + L_out); %Deberia dar 0.12
  sup = eini;
  inf = -eini;
  
  W = [inf + (sup - inf) * rand(L_out, 1 + L_in )]; %Reutilizado de la P1
endfunction