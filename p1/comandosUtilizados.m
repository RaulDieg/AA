//UTILES PARA MEMORIA
//MOSTRAR QUE FUNCION DE COSTE VA DISMINUYENDO


//RECTA CON LA NUBE DE PUNTOS
[tata0,tata1] = descensoGradiente(0, 0, 0.01, 1500, ex1data1)
miRecta = @(x)hipotesis(x, tata0, tata1)
fplot(miRecta, [5 25],50)
hold on
plot(ex1data1(:,1),ex1data1(:,2),"xr")