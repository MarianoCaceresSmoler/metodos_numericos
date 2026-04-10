% Definición de la EDO y parámetros
f = @(t, y) t + y^2;

a = 0;
b = 0.2;
h = 0.1;
N = round((b-a)/h);
y0 = 1;

% Llamada a la función rko4
[T, Y] = rko4(f, a, b, y0, N);

% Impresión de resultados
disp('  t   |    y_aprox');
disp('-------------------');
for k = 1:length(Y)
    % Agregamos el tiempo T(k) y un salto de línea \n al final
    fprintf('%.1f  |  %.8f\n', T(k), Y(k));
end

