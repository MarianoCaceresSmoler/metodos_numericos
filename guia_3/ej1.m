
f = @(t,y) t*y;

a = 0;
b = 1;
y0 = 1;

y_exacta = exp(1/2);

% =========================================================================
% Parte 1: Tabla con h = 0.25
% =========================================================================
fprintf('--- Parte 1: Tabla de aproximación con h = 0.25 ---\n');
h = 0.25;
M = (b - a) / h; % Cantidad de pasos

[t1, y1] = euler(f, a, b, y0, M);

disp('       t_k      y_k');
disp([t1, y1]);

% =========================================================================
% Parte 2: Aproximación de y(1) y error global con h = 0.2, 0.1, 0.05
% =========================================================================
fprintf('\n--- Parte 2: Error global en t=1 variando h ---\n');

h_vals = [0.2, 0.1, 0.05];

fprintf('   h\t y_aprox(1)\t Error Global\n');
for i = 1:length(h_vals)
    h_temp = h_vals(i);
    M_temp = (b - a) / h_temp;
    [t_temp, y_temp] = euler(f, a, b, y0, M_temp);

    y_final = y_temp(end);
    error_global = abs(y_final - yf_exacta);
    fprintf('  %.2f\t %f\t %f\n', h_temp, y_final, error_global);
end

% =========================================================================
% Parte 3: Ejecución del código mostrado en la imagen
% =========================================================================
fprintf('\n--- Ejecución del código del enunciado ---\n');
N = 5;
H = [];
E = [];

for k = 1:8
    [t, y] = euler(f, 0, 1, 1, N);
    H = [H; 1/N];
    N = 2*N;
    E = [E; abs(y(end) - y_exacta)];
end

fprintf('   h\t\t Error\n');
disp([H, E]);

disp('Razón (Error / h) para el menor h:');
razon = E(end) / H(end);
disp(razon);
