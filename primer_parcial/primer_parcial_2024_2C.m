format long;

%
% EJERCICIO 1
%

f = @(t, y) t * (sin(y))^3;
y0 = 1;

a = 0;
b = 1;
h = 0.1;
N = (b - a) / h;

[T, Y] = euler(f, a, b, y0, N);

res = Y(end);

printf("Respuesta: %.5f\n", res);

%
% EJERCICIO 2
%

f = @(x) 0.95*x^3 - 5.9*x^2 + 10.9*x - 6;
df = @(x) 2.85*x^2 - 11.8*x + 10.9;

p0 = 4;

tol = 0;
max_iter = 4;

[p, iter] = newton_raphson(f, df, p0, tol, max_iter);

res = p;

printf("Respuesta: %.6f\n", res);

%
% EJERCICIO 3
%

f = @(x) -12*x^5 - 3.2*x + 12;

a = 0;
b = 1;

tol = 0;
max_iter = 8;

[p, iter] = biseccion(f, a, b, tol, max_iter);

res = p;

printf("Respuesta: %.6f\n", res);

%
% EJERCICIO 4
%

f = @(t, y) (1 + 2*t) * sqrt(y);

y0 = 1;

a = 0;
b = 1;
h = 0.1;
N = (b-a)/h;

metodo = 'heun';

[T,Y] = rko2(f, a, b, y0, N, metodo);

res = Y(end);

printf("Respuesta: %.7f\n", res);

%
% EJERCICIO 5
%

g = @(x) 5 / (e^(0.5*x)+1.2);
p0 = 1;

tol = 10^(-3);
max_iter = 100000;

[p, iter] = punto_fijo(g, p0, tol, max_iter);

res = p;

printf("Respuesta: %.3f\n", res);


