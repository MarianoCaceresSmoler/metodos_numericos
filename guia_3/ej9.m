% Definimos las funciones para que dependan EXCLUSIVAMENTE de (t, y).
% Como en Octave una función anónima puede llamar a otra definida anteriormente,
% hacemos que fpp llame a fp y f, fppp llame a fpp, fp y f, etc.
f    = @(t, y) cos(t) - sin(y) + t.^2;
fp   = @(t, y) -sin(t) - f(t,y).*cos(y) + 2.*t;
fpp  = @(t, y) -cos(t) - fp(t,y).*cos(y) + (f(t,y).^2).*sin(y) + 2;
fppp = @(t, y) sin(t) - fpp(t,y).*cos(y) + 3.*f(t,y).*fp(t,y).*sin(y) + (f(t,y).^3).*cos(y);

disp('--- PARTE 1: Verificación de los 2 primeros pasos ---');
a1 = -1;
b1 = -0.98;
y0_1 = 3;
N1 = 2; % 2 pasos para que h = (b-a)/N = 0.01

% Llamamos a la función taylor4
[T1, Y1] = taylor4(f, fp, fpp, fppp, a1, b1, y0_1, N1);

fprintf('Vector de aproximaciones [y(-1), y(-0.99), y(-0.98)]:\n');
fprintf('[%.5f, %.5f, %.5f]\n\n', Y1(1), Y1(2), Y1(3));


disp('--- PARTE 2: Integración Forward (M = 200 pasos) ---');
a2 = -1;
b2 = 1;
y0_2 = 3;
M = 200; % 200 pasos para que h = 0.01

[T2, Y2] = taylor4(f, fp, fpp, fppp, a2, b2, y0_2, M);

y1_aprox = Y2(end);
fprintf('Aproximación para y(1) obtenida: %.5f\n\n', y1_aprox);


disp('--- PARTE 3: Integración Backward ---');
% Volvemos a realizar el proceso tomando como inicial y(1) y h = -0.01
% Al poner a=1 y b=-1 con N=200, la función taylor4 calcula h = (-1-1)/200 = -0.01 internamente.
a3 = 1;
b3 = -1;
y0_3 = y1_aprox; % Arrancamos del valor que recién obtuvimos (6.42194)
N3 = 200;

[T3, Y3] = taylor4(f, fp, fpp, fppp, a3, b3, y0_3, N3);

ym1_aprox = Y3(end);
fprintf('Aproximación al volver a y(-1): %.5f\n', ym1_aprox);
