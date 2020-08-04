%%%%%%%%%% Parte 1 %%%%%%%%%%%%
%Función1: H(s) = 8s/(6s+2)
numerador1 = [8 0];
denominador1 = [6 2];

%Lazo abierto
lazoAbierto1= tf(numerador1, denominador1);
figure
plot(step(lazoAbierto1));
title('Respuesta del lazo abierto de F1 a un escalón unitario');
xlabel('Tiempo (segundos)');
ylabel('Amplitud');
grid;

%Lazo cerrado
[numerador1Cerrado,denominador1Cerrado] = cloop(numerador1, denominador1);
lazoCerrado1 = tf(numerador1Cerrado, denominador1Cerrado);
figure
plot(step(lazoCerrado1));
title('Respuesta del lazo cerrado de F1 a un escalón unitario');
xlabel('Tiempo (segundos)');
ylabel('Amplitud');
grid;

%Comparación
[ceros1, polos1, gananciaEstatica1] = tf2zp(numerador1, denominador1)
info1 = stepinfo(lazoAbierto1)

[ceros1Cerrado, polos1Cerrado, gananciaEstatica1Cerrado] = tf2zp(numerador1Cerrado, denominador1Cerrado);
info1Cerrado = stepinfo(lazoCerrado1);

%Funcion2: H(s) = (5s^2+7s+4)/(s^2+6s+3)
numerador2 = [5 7 4];
denominador2 = [1 6 3];

%Lazo abierto
lazoAbierto2= tf(numerador2, denominador2);
figure
plot(step(lazoAbierto2));
title('Respuesta del lazo abierto de F2 a un escalón unitario');
xlabel('Tiempo (segundos)');
ylabel('Amplitud');
grid;

%Lazo cerrado
[numerador2Cerrado,denominador2Cerrado] = cloop(numerador2, denominador2);
lazoCerrado2 = tf(numerador2Cerrado, denominador2Cerrado);
figure
plot(step(lazoCerrado2));
title('Respuesta del lazo cerrado de F2 a un escalón unitario');
xlabel('Tiempo (segundos)');
ylabel('Amplitud');
grid;

%Comparación
[ceros2, polos2, gananciaEstatica2] = tf2zp(numerador2, denominador2)
info2 = stepinfo(lazoAbierto2)

[ceros2Cerrado, polos2Cerrado, gananciaEstatica2Cerrado] = tf2zp(numerador2Cerrado, denominador2Cerrado);
info2Cerrado = stepinfo(lazoCerrado2);

%Función3: H(s) = 16/(s^3+2^s2+4s+8)
numerador3 = [0 0 0 16];
denominador3 = [1 2 4 8];

%Lazo abierto
lazoAbierto3= tf(numerador3, denominador3);
figure
plot(step(lazoAbierto3));
title('Respuesta del lazo abierto de F3 a un escalón unitario');
xlabel('Tiempo (segundos)');
ylabel('Amplitud');
grid;

%Lazo cerrado
[numerador3Cerrado,denominador3Cerrado] = cloop(numerador3, denominador3);
lazoCerrado3 = tf(numerador3Cerrado, denominador3Cerrado);
figure
plot(step(lazoCerrado3));
title('Respuesta del lazo cerrado de F3 a un escalón unitario');
xlabel('Tiempo (segundos)');
ylabel('Amplitud');
grid;

%Comparación
[ceros3, polos3, gananciaEstatica3] = tf2zp(numerador3, denominador3)
info3 = stepinfo(lazoAbierto3)

[ceros3Cerrado, polos3Cerrado, gananciaEstatica3Cerrado] = tf2zp(numerador3Cerrado, denominador3Cerrado);
info3Cerrado = stepinfo(lazoCerrado3);


%%%%%%%%%% Parte 2 %%%%%%%%%%%%

%Funcion1: 
num1 = [0,0,4,0];
den1 = [0,10,0,4];

sys1 = tf(num1, den1);

%Funcion2: 
num2 = [0,0,0,3];
den2 = [0,0,6,16];

sys2 = tf(num2, den2);

%Funcion3: 
num3 = [0,0,4,10];
den3 = [4,9,5,0];

sys3 = tf(num3, den3);

%Funcion4: 
num4 = [0,0,0,1];
den4 = [0,0,7,10];

sys4 = tf(num4, den4);

%Funcion5: 
num5 = [0,0,8,8];
den5 = [1,2,3,0];

sys5 = tf(num5, den5);

%Funcion6: 
num6 = [0,0,3,2];
den6 = [0,5,7,10];

sys6 = tf(num6, den6);

%Lazo cerrado funcion 3:
F1 = feedback(sys3, 1);

% (1) Serie lazo cerrado funcion 3 con funcion 5:
F2 = series(F1, sys5);

% (2) Serie lazo cerrado funcion 3 con funcion 4:
F3 = series(F1, sys4);

% (3) Paralelo de (1) y (2):
F4 = parallel(F2, F3); 

% (4) Serie de (3) con funcion 6:
F5 = series(F4, sys6);

% Sumador paralelo final:
F6 = parallel(sys1, sys2);
F = parallel(F6, F5);

% Grafico respuesta al escalon:
figure
plot(step(F));
title('Respuesta del diagrama de bloque a un escalón unitario');
xlabel('Tiempo (segundos)');
ylabel('Amplitud');
grid;




