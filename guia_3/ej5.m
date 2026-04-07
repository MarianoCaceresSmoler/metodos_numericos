% --- DEFINICIÓN DEL PROBLEMA ORIGINAL ---
f = @(t, y) -y + t;  % Ecuación diferencial y' = -y + t

disp('======================================================');
disp('                      PARTE 2                         ');
disp('======================================================');

t0_2 = 0;
tf_2 = 1;
y0_2 = 3;

% Solución exacta y(t) = 4*exp(-t) + t - 1
y_exacta_2 = @(t) 4*exp(-t) + t - 1;
y1_verdadera = y_exacta_2(tf_2);

fprintf('Valor exacto de y(1) = %.6f\n\n', y1_verdadera);

h = 1;            % Comenzar con h = 1
tol = 0.01;       % Error global relativo del 1%
error_rel = 1;    % Inicialización

% Bucle de ensayo para encontrar el h adecuado
while true
    N = (tf_2 - t0_2) / h; % Número de pasos

    % Calculamos usando el método de Heun
    [~, y_heun] = rko2(f, t0_2, tf_2, y0_2, N, 'heun');
    y1_aprox = y_heun(end);

    % Cálculo del error global relativo
    error_rel = abs(y1_verdadera - y1_aprox) / y1_verdadera;

    fprintf('Probando con h = %.4f | Aprox y(1) = %.6f | Error Rel = %.4f%%\n', h, y1_aprox, error_rel * 100);

    % Chequeamos si el error es menor o igual al 1%
    if error_rel <= tol
        fprintf('\n¡Condición cumplida! El valor de h requerido es: %.4f\n', h);
        break;
    end

    % Si no se cumple, dividimos h a la mitad y probamos de nuevo
    h = h / 2;
end

disp(' ');
disp('======================================================');
disp('                      PARTE 3                         ');
disp('======================================================');

% Nuevas condiciones de la Parte 3
t0_3 = 1;
tf_3 = 1.1;
y0_3 = 2;
h_3 = 0.1;
N_3 = round((tf_3 - t0_3) / h_3); % Debería ser exactamente 1 paso

% Nueva solución exacta: y(t) = 2*exp(-(t-1)) + t - 1
y_exacta_3 = @(t) 2*exp(-(t-1)) + t - 1;
y11_verdadera = y_exacta_3(tf_3);

fprintf('Aproximando y(1.1) con h = 0.1 (Un solo paso)\n');
fprintf('Valor exacto de y(1.1) = %.6f\n\n', y11_verdadera);

% 1. Método de Euler
[~, y_eu] = euler(f, t0_3, tf_3, y0_3, N_3);
err_eu = abs(y11_verdadera - y_eu(end)) / y11_verdadera;
fprintf('Metodo EULER : Aprox = %.6f | Error Relativo = %.4f%%\n', y_eu(end), err_eu * 100);

% 2. Método de Heun (Runge-Kutta 2)
[~, y_h] = rko2(f, t0_3, tf_3, y0_3, N_3, 'heun');
err_h = abs(y11_verdadera - y_h(end)) / y11_verdadera;
fprintf('Metodo HEUN  : Aprox = %.6f | Error Relativo = %.4f%%\n', y_h(end), err_h * 100);

% 3. Método de Runge-Kutta 4
[~, y_rk4] = rko4(f, t0_3, tf_3, y0_3, N_3);
err_rk4 = abs(y11_verdadera - y_rk4(end)) / y11_verdadera;
fprintf('Metodo RK4   : Aprox = %.6f | Error Relativo = %.4f%%\n', y_rk4(end), err_rk4 * 100);

disp('======================================================');
