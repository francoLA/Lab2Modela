%%%%%%%%%% parte 1 %%%%%%%%%%%%





%%%%%%%%%% parte 2 %%%%%%%%%%%%

%funcion1: 
num1 = [0,0,4,0];
den1 = [0,10,0,4];

sys1 = tf(num1, den1);

%funcion2: 
num2 = [0,0,0,3];
den2 = [0,0,6,16];

sys2 = tf(num2, den2);

%funcion3: 
num3 = [0,0,4,10];
den3 = [4,9,5,0];

sys3 = tf(num3, den3);

%funcion4: 
num4 = [0,0,0,1];
den4 = [0,0,7,10];

sys4 = tf(num4, den4);

%funcion5: 
num5 = [0,0,8,8];
den5 = [1,2,3,0];

sys5 = tf(num5, den5);

%funcion6: 
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
step(F);




