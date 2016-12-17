##############1.1 LINEAR KERNEL#######
load("ex6data1.mat")
plotData(X, y)

C = 1;
model = svmTrain(X, y, C,  @linearKernel , 1e-3, 20);
visualizeBoundaryLinear(X, y, model)

C = 100
model = svmTrain(X, y, C,  @linearKernel , 1e-3, 20)
visualizeBoundaryLinear(X, y, model)

##############1.2 KERNEL GAUSSIANO#######
load("ex6data2.mat")
plotData(X, y)
C = 1
sigma = 0.1
model= svmTrain(X, y, C, @(x1 , x2) gaussianKernel (x1 , x2 , sigma));
visualizeBoundary(X, y, model);

##############1.3 ELECCION DE LOS PARAMATROS C Y SIGMA#######
load("ex6data3.mat")
model = obtenerModelosGaussiano(X, y);
p = damePorcentajeGaussiano(model, Xval, yval);
C = 1
sigma = 0.1
model= svmTrain(X, y, C, @(x1 , x2) gaussianKernel (x1 , x2 , sigma));
visualizeBoundary(X, y, model);

###############2. SPAM####################################
vocablist = getVocabList();

for i=1:length(vocablist)
  vocabulario.(vocablist{i}) = i;
endfor

[Xeasyham, yeasyham] = generaDatosEmails("easy_ham", 2551, 0, vocablist, vocabulario);
[Xhardham, yhardham] = generaDatosEmails("hard_ham", 250, 0, vocablist, vocabulario);
[Xspam, yspam] = generaDatosEmails("spam", 500, 1, vocablist, vocabulario);

Xent = [Xeasyham(1:1786, :); Xhardham(1:175, :); Xspam(1:350, :)];
Xval = [Xeasyham(1787:end, :); Xhardham(176:end, :); Xspam(351:end, :)];
yent = [yeasyham(1:1786, :); yhardham(1:175, :); yspam(1:350, :)];
yval = [yeasyham(1787:end, :); yhardham(176:end, :); yspam(351:end, :)];


##CALCULO MODELO LINEAL########
model = obtenerModelosLineal(Xent, yent);
p = damePorcentajeLineal(model, Xval, yval);

##CALCULO MODELO GAUSSIANO#####
p = obtenerModelosGaussianosSpam(Xent, yent, Xval, yval);

 for i = valores
    for j = valores
      fprintf(['C: %f; sigma: %f; porcentaje: %f\n'], i, j, p(fila));
      fila++;
    endfor
  endfor
  
  [maximo ind] = max(p);
  i = ceil(ind/columns(valores));
  j = ind - ((i - 1) * columns(valores));
  fprintf(['Valor optimo->C: %f; sigma: %f; porcentaje: %f\n'], valores(i), valores(j), maximo);