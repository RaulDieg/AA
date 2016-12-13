##############1.1 LINEAR KERNEL#######
load("ex6data1.mat")
plotData(X, y)

C = 1
model = svmTrain(X, y, C,  @linearKernel , 1e-3, 20)
visualizeBoundaryLinear(X, y model)

C = 100
model = svmTrain(X, y, C,  @linearKernel , 1e-3, 20)
visualizeBoundaryLinear(X, y, model)

##############1.2 KERNEL GAUSSIANO#######
C = 1
sigma = 0.1
model= svmTrain(X, y, C, @(x1 , x2) gaussianKernel (x1 , x2 , sigma));
visualizeBoundary(X, y, model);

##############1.3 ELECCION DE LOS PARAMATROS C Y SIGMA#######
model = obtenerModelos(X, y, Xval, yval);
p = damePorcentaje(model, Xval, yval);

C = 1
sigma = 0.1
model= svmTrain(X, y, C, @(x1 , x2) gaussianKernel (x1 , x2 , sigma));
visualizeBoundary(X, y, model);

###############2. SPAM####################################
file_contents = readFile("easy_ham/0024.txt");
email = processEmail(file_contents);
vocablist = getVocabList();

for i=1:length(vocablist)
  vocabulario.(vocablist{i}) = i;
endfor

directorio = "easy_ham";
X = zeros(1, length(vocablist));
for i=1:2551
  file_name = sprintf("%s/%04d.txt", directorio, i);
  file_contents = readFile(file_name);
  email = processEmail(file_contents);
  Xaux = zeros(1, length(vocablist));
  while -isempty(email)
    [str, email] = strtok(email, [' ']);
    if(isfield(vocabulario, str) > 0)
      Xaux(1, vocabulario.(str)) = 1;
    endif 
  endwhile
  X = [X; Xaux]
endfor