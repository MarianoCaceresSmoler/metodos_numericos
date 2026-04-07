% Definimos la función f(t,y)
f = @(t, y) -y.^2;

disp('--- PARTE 2: Aproximaciones y Extrapolación ---');

% La solución exacta de y' = -y^2 con y(0)=1 es y(t) = 1/(t+1)
% Para t=0.1, y(0.1) = 1/1.1 = 0.9090909...
y_exacta = 1 / 1.1;
fprintf('Valor exacto en y(0.1): %.6f\n\n', y_exacta);

a = 0;
b = 0.1;
y0 = 1;

% a) Caso h = 0.02 (N = 5 pasos para llegar de 0 a 0.1)
h = 0.02;
[t_a, y_a] = rko2(f, a, b, y0, (b-a) / h, 'heun');
aprox_h02 = y_a(end);
error_h02 = abs(y_exacta - aprox_h02);
fprintf('a) Con h=0.02, y(0.1) = %.6f (Error: %.6f)\n', aprox_h02, error_h02);

% b) Caso h = 0.01 (N = 10 pasos para llegar de 0 a 0.1)
h = 0.01;
[t_b, y_b] = rko2(f, a, b, y0, (b-a) / h, 'heun');
aprox_h01 = y_b(end);
error_h01 = abs(y_exacta - aprox_h01);
fprintf('b) Con h=0.01, y(0.1) = %.6f (Error: %.6f)\n', aprox_h01, error_h01);

% Extrapolación de Richardson para mejorar la precisión
% p = 2 (Orden del método de Heun)
aprox_richardson = aprox_h01 + (aprox_h01 - aprox_h02) / (2^2 - 1);
error_richardson = abs(y_exacta - aprox_richardson);
fprintf('\nExtrapolación de Richardson: y(0.1) = %.6f\n', aprox_richardson);
fprintf('Error de Extrapolación: %.6f (Menor que 10^-3)\n\n', error_richardson);


disp('--- PARTE 3: Integración hacia atrás ---');

% 1. Integramos hacia adelante (h = 0.1, N = 1 paso de 0 a 0.1)

a = 0;
b = 0.1;
y0 = 1;
h = 0.1;
N = round((b - a) / h);

[t_fwd, y_fwd] = rko2(f, a, b, y0, N, 'heun');
y_end = y_fwd(end);
fprintf('Aproximación forward y(0.1) = %.6f\n', y_end);

% 2. Integramos hacia atrás (h = -0.1, N = 1 paso de 0.1 a 0)
% Tomamos como t0=0.1, tf=0 y como condición inicial el valor que acabamos de obtener (y_end)
[t_bwd, y_bwd] = rko2(f, b, a, y_end, N, 'heun');
ya_end = y_bwd(end);
fprintf('Aproximación backward y(0) = %.6f\n', ya_end);

% Diferencia con la condición inicial original y(0) = 1
diferencia = abs(1 - ya_end);
fprintf('Diferencia al volver: %.6f\n', diferencia);
