f = @(t, y) -20 * y + 7 * exp(-0.5 * t);

a = 0;
b = 0.5;
y0 = 5;
h = 0.1;
N = (b - a) / h;

[T, Y] = rko2(f, a, b, y0, N, "heun");
plot(T, Y);
y_aprox = Y(end);

fprintf("Aproximacion final %.5f\n\n", y_aprox);
