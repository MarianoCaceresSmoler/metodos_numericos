f = @(x) 4*x.^3 - 2*x.^2 + 3;
df = @(x) 12*x.^2 - 4*x;

% Raiz real
p0 = -1;
tol = 10^(-3);
max_iter = 100;
[p, iter] = newton_raphson(f, df, p0, tol, max_iter);
p

% Raiz imaginaria con parte imaginaria positiva
p0 = i;
[p, iter] = newton_raphson(f, df, p0, tol, max_iter);
p

% Raiz imaginaria con parte imaginaria negativa
p0 = -i;
[p, iter] = newton_raphson(f, df, p0, tol, max_iter);
p


