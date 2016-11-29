%Cargar datos
load('ex5data1.mat');
X = [ones(rows(X), 1) X];
Theta_ini = [1;1];
lambda = 1;
[J, grad] = costeRegularizado(Theta_ini, X, y, lambda)