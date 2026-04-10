% --- EJERCICIO 16: EDO de 2do orden con Euler ---
clc; clear;

% Parámetros
h = 0.2;
t = 0:h:1.0;
p = [1.0, 1.0, 2.0, 2.5, 2.5, 2.0]; % Valores de la tabla
N = length(t) - 1;

% Vectores para almacenar resultados
y = zeros(1, N+1);
v = zeros(1, N+1);

% Condiciones iniciales
y(1) = 0;
v(1) = 1;

disp(' k |  tk | p(tk)|    vk    |    yk    ');
disp('--------------------------------------');
fprintf('%2d | %.1f |  %.1f |  %.5f |  %.5f\n', 0, t(1), p(1), v(1), y(1));

for k = 1:N
    % Calculamos el paso siguiente
    y(k+1) = y(k) + h * v(k);
    v(k+1) = v(k) * (1 - h / 2) + h * p(k); % p(k) corresponde a p(t_k)

    fprintf('%2d | %.1f |  %.1f |  %.5f |  %.5f\n', k, t(k+1), p(k+1), v(k+1), y(k+1));
end
