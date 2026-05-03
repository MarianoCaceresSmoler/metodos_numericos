format long;

%
% EJERCICIO 1
%

f = @(x) exp(2*x) - x - 6;
df = @(x) 2 * exp(2*x) - 1;

p0 = 0;

tol = 10^(-6);
max_iter = 10000;

[p, iter] = newton_raphson(f, df, p0, tol, max_iter);

res = p;

printf("Resultado: %.6f\n", res);

%
% EJERCICIO 2
%

f = @(x) -10 + 4*x^2 + 3*x^3;

a = 1;
b = 2;

tol = 10^(-4);
max_iter = 100000;

[p, iter] = biseccion(f, a, b, tol, max_iter);

res = p;
pasos = iter;

printf("Resultado: %.4f en %d pasos\n", res, pasos);

%
% EJERCICIO 3
%

f = @(t,y) t + 1 - y;
fp = @(t,y) y - t;

a = 0;
b = 1;
h = 0.25;
N = (b-a)/h;

y0 = 1;

[T, Y] = taylor2(f, fp, a, b, y0, N);

res = Y(end);

printf("Resultado: %.5f\n", res);

%
% EJERCICIO 4
%

f = @(t,y) 2*exp(-5*t) - 0.9 * y;

t0 = 0;
tf = 1;
h = 1/3;
N = (tf - t0) / h;

[T, Y] = euler(f, t0, tf, y0, N);

res = Y(end);

printf("Resultado: %.4f\n", res);

%
% EJERCICIO 5
%

g = @(x) exp(x) / (3*x + 1);
p0 = 1;

%g = @(x) exp(x) - 3*x^2;
%p0 = 1;

tol = 10^(-5);
max_iter = 100000;

[p, iter] = punto_fijo(g, p0, tol, max_iter);

res = p;

printf("Resultado: %.5f\n", res);



