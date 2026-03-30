
a = 0;
b = 2;

f = @(t,y) -2*y;
y0 = 2;

y_exacta = @(t) 2*exp(-2*t);

% =========================================================================
% Partes 1 y 2: Aproximacion y ER en (O,2) con pasos h = 0.25, 0.20, 0.10, 0.05 y 0.01
% =========================================================================
fprintf('--- Partes 1 y 2: Aproximacion en t=2 y Error Relativo ---\n');

h_vals = [0.25, 0.20, 0.10, 0.05, 0.01];

y2_real = y_exacta(2);
fprintf('Solución exacta en t=2: %e\n\n', y2_real);

fprintf('   h\t y_aprox(2)\t Error Relativo\t Razón (Err/h)\n');
for i = 1:length(h_vals)
    % Calculamos la aproximación con nuestra función
    h_temp = h_vals(i);
    M_temp = (b - a) / h_temp;
    [t_temp, y_temp] = euler(f, a, b, y0, M_temp);

    % Calculo de errores
    y_aprox = y_temp(end);
    y_real = y_exacta(2);

    error_abs = abs(y_aprox - y_real);
    error_rel = error_abs / abs(y_real);

    % Razón entre error y h para verificar el orden
    razon = error_rel / h_temp;

    fprintf('  %.2f\t %e\t %e\t %f\n', h_temp, y_aprox, error_rel, razon);
end

disp(' ');
disp('Conclusión:');
disp('Como la razón (Error Relativo / h) se mantiene acotada y relativamente');
disp('constante, verificamos que el orden del error global es O(h), es decir, 1.');

% =========================================================================
% Parte 3: Solución Analítica (Ecuacion en diferencias)
% y'(t) = -2y(t)
% y_k+1 = y_k + h * f(t_k, y_k) = y_k + h * (-2y_k) = y_k * (1 - 2h)
%
% Iterando desde y0 = 2, obtenemos y_k = 2(1-2h)^k
%
% a) Como queremos que y_k se anule a partir de k = 1:
% y1= = 2(1-2h)^1 = 0 => 2h = 1 => h = 1/2
%
% b) Para que oscile con amplitud constante debe haber un (-1)^k:
% 1-2h = -1 => h = 1
%
% c) Para que la sucesion sea positiva y decreciente:
% 0 < 1-2h < 1 => -1 < -2h < 0 => 0 < h < 1/2
%
% d) Separemos el limite en dos partes:
% I: lim h->0 (e^(-2kh)) = 1
%
% II: lim h->0 (1-2h)^k = 1^k = 1
%
% El resultado final queda: 2 |I - II| = 2 * 0 = 0
%
% =========================================================================













