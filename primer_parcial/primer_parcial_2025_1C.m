format long;

%%%
% EJERCICIO 1
%%%
f = @(t,y) (t)^3 * y - 1.25 * y;
t0 = 0;
tf = 2;
y0 = 1;
h = 0.25;
M = (tf - t0) / h;

[T, Y] = euler(f, t0, tf, y0, M);
yf = Y(end)
printf("Respuesta = %.6f\n", yf);

%%%
% EJERCICIO 2
%%%
g = 9.8;
m = 80;
t = 4;
v_objetivo = 5;

% Función objetivo: f(c) = 0
f = @(c) (g * m ./ c) .* (1 - exp(-(c ./ m) .* t)) - v_objetivo;

a = 156;
b = 157;

% Forzamos la detención en la iteración 5 (m_4)
tol = 0;
max_iter = 5;

[m4, iter_realizadas] = biseccion(f, a, b, tol, max_iter);
res_final = m4;

printf("Respuesta = %.6f\n", m4);

%%%
% EJERCICIO 3
%%%
f = @(t, y) 1 + y^2;
fp = @(t, y) 2 * y * (1 + y^2);

y0 = 1;

a = 0;
b = 1;
h = 0.2;
N = (b - a) / h;

[T, Y] = taylor2(f, fp, a, b, y0, N);

yf = Y(end);
printf("Respuesta = %.6f\n", yf);

%%%
% EJERCICIO 4
%%%

% Probando con la calculadora: la raiz esta entre 1 y 2:
% f(1) = -24 y f'(1) = 86
f = @(x) x^4 + 8 * x^3 + 13 * x^2 - 16 * x - 30;
df = @(x) 4 * x^3 + 24 * x^2 + 26 * x - 16;

p0 = 2;
tol = 0;
max_iter = 5; % Queremos exactamente 5 iteraciones para llegar a x_5

[x5, iter_realizadas] = newton_raphson(f, df, p0, tol, max_iter);

printf("Respuesta = %.7f\n", x5);

%%%
% EJERCICIO 4
%%%



