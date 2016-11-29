%1
num_entradas = 400;
num_ocultas = 25;   
num_etiquetas = 10;          
load('ex4data1.mat');
load('ex4weights.mat');
params_rn = [Theta1(:) ; Theta2(:)];

%2
J = costeRN(params_rn, num_entradas, num_ocultas, num_etiquetas, X, y, 0);


%3
Theta1_inicial = inicializaPesos(num_entradas, num_ocultas);
Theta2_inicial = inicializaPesos(num_ocultas, num_etiquetas);

params_rn_inicial = [Theta1_inicial(:) ; Theta2_inicial(:)];

%4
options = optimset('MaxIter', 50);
costFunction = @(t) costeRN(t,num_entradas, num_ocultas, num_etiquetas, X, y, 1);

[params_rn, J] = fmincg(costFunction, params_rn_inicial, options);

Theta11 = reshape(params_rn(1:num_ocultas * (num_entradas + 1)), num_ocultas, (num_entradas + 1));

Theta21 = reshape(params_rn((1 + (num_ocultas * (num_entradas + 1))):end), num_etiquetas, (num_ocultas + 1));

pred = damePorcentaje(Theta11, Theta21, X, y);

%LAMBDA 0
options = optimset('MaxIter', 50);
costFunction = @(t) costeRN(t,num_entradas, num_ocultas, num_etiquetas, X, y, 0);

[params_rn, J] = fmincg(costFunction, params_rn_inicial, options);

Theta11 = reshape(params_rn(1:num_ocultas * (num_entradas + 1)), num_ocultas, (num_entradas + 1));

Theta21 = reshape(params_rn((1 + (num_ocultas * (num_entradas + 1))):end), num_etiquetas, (num_ocultas + 1));

pred = damePorcentaje(Theta11, Theta21, X, y)

%LAMBDA 5
options = optimset('MaxIter', 50);
costFunction = @(t) costeRN(t,num_entradas, num_ocultas, num_etiquetas, X, y, 5);

[params_rn, J] = fmincg(costFunction, params_rn_inicial, options);

Theta11 = reshape(params_rn(1:num_ocultas * (num_entradas + 1)), num_ocultas, (num_entradas + 1));

Theta21 = reshape(params_rn((1 + (num_ocultas * (num_entradas + 1))):end), num_etiquetas, (num_ocultas + 1));

pred = damePorcentaje(Theta11, Theta21, X, y)

%LAMBDA 1 Y 250 iteraciones
options = optimset('MaxIter', 250);
costFunction = @(t) costeRN(t,num_entradas, num_ocultas, num_etiquetas, X, y, 1);

[params_rn, J] = fmincg(costFunction, params_rn_inicial, options);

Theta11 = reshape(params_rn(1:num_ocultas * (num_entradas + 1)), num_ocultas, (num_entradas + 1));

Theta21 = reshape(params_rn((1 + (num_ocultas * (num_entradas + 1))):end), num_etiquetas, (num_ocultas + 1));

pred = damePorcentaje(Theta11, Theta21, X, y)