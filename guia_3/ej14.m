f = @(t, v) 10 - 0.1 * v.^2;
v_exacta = @(t) 10 * tanh(t);

a = 0;
b = 1;
v0 = 0;
h = 0.1;
N = (b-a)/h;

% --- 1. CÁLCULOS Y GRÁFICAS ---

[t_e, v_e] = euler(f, a, b, v0, N);
plot(t_e, v_e, '-o');

hold on;

[t_h, v_h] = rko2(f, a, b, v0, N, 'heun');
plot(t_h, v_h, '-x');

% Evaluamos la función exacta
v_ex = v_exacta(t_e);
plot(t_e, v_ex, '-k');

legend('Euler', 'Heun', 'Exacta');
hold off;

% --- 2. TABLA COMPARATIVA ---

disp(' '); % Deja un renglón en blanco en la consola
disp(' k |   t   |   Euler    |    Heun    |   Exacta');
disp('--------------------------------------------------');

% Recorremos desde 1 hasta el largo de los vectores (N+1)
for i = 1:length(t_e)
    % Usamos i-1 para que la columna 'k' arranque en 0
    fprintf('%2d |  %.1f  |  %8.4f  |  %8.4f  |  %8.4f\n', ...
            i-1, t_e(i), v_e(i), v_h(i), v_ex(i));
end
