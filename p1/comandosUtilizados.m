//UTILES PARA MEMORIA
//MOSTRAR QUE FUNCION DE COSTE VA DISMINUYENDO


//RECTA CON LA NUBE DE PUNTOS
[tata0,tata1] = descensoGradiente(0, 0, 0.01, 1500, ex1data1)
miRecta = @(x)hipotesis(x, tata0, tata1)
fplot(miRecta, [5 25],50)
hold on
plot(ex1data1(:,1),ex1data1(:,2),"xr")

//grafica surface
[X Y Z] = misurface(ex1data1);
surface(X,Y,Z);

//grafica contorno
contour(X,Y,Z,logspace(-2,3,20))
hold on
[teta0,teta1] = descensoGradiente(0,0,0.01,1500,ex1data1);
plot(teta0,teta1,"xr")