
a = 0;
b = 4;

f = @(t,y) (t - y) / 2;
y0 = 1;

y_exacta = @(t) 3*exp(-t/2) + t - 2;

% =========================================================================
% Parte 1: Aproximacion en (O,4) con pasos h = 1 y h = 0.5
% =========================================================================
fprintf('--- Parte 1: Tabla redondeando con maxima precision con h = 1 y h = 0.5 ---\n');

h_vals = [1, 0.5];

fprintf('   h\t y_aprox(1)\n');
for i = 1:length(h_vals)
    h_temp = h_vals(i);
    M_temp = (b - a) / h_temp;
    [t_temp, y_temp] = euler(f, a, b, y0, M_temp);

    y_final = y_temp(end);
    fprintf('  %.1f\t %.3f\n', h_temp, y_final);
end

% =========================================================================
% Parte 2: Aproximación de y(4) y error global con varios h
% =========================================================================
fprintf('\n--- Parte 2: Error global en t=4 variando h ---\n');

h_vals = [1, 0.5, 0.25, 0.125];
yf_exacta_4 = y_exacta(4);

fprintf('   h\t y_aprox(4)\t Error Global\n');
for i = 1:length(h_vals)
    h_temp = h_vals(i);
    M_temp = (b - a) / h_temp;
    [~, y_temp] = euler(f, a, b, y0, M_temp);

    y_final = y_temp(end);
    error_global = abs(y_final - yf_exacta_4);
    fprintf('  %.3f\t %f\t %f\n', h_temp, y_final, error_global);
end

% =========================================================================
% PARTE 3: Verificación asintótica en t=3 y t=4
% =========================================================================
fprintf('\n--- Parte 3: Error global en t=3 y t=4 con h pequeño ---\n');

h_vals = [0.001, 0.005, 0.0001]; % Elegimos valores de  h chicos

for i = 1:length(h_vals)
  h = h_vals(i);
  % Tomando b = 3
  b = 3;
  M = (b - a) / h;
  [~, y3_small] = euler(f, a, b, y0, M);
  error_t3 = abs(y3_small(end) - y_exacta(3));

  % Tomando b = 4
  b = 4;
  M = (b - a) / h;
  [~, y4_small] = euler(f, a, b, y0, M);
  error_t4 = abs(y4_small(end) - y_exacta(4));

  fprintf('  Con h = %.4f:\n', h);
  fprintf('  Error en t=3: %f\n', error_t3);
  fprintf('  Error en t=4: %f\n', error_t4);
  fprintf(' \n');
end

% =========================================================================
% PARTE 4: Integración adelante-atrás en [0, 3]
% =========================================================================
fprintf('\n--- Parte 4: Proceso Adelante-Atrás en [0, 3] ---\n');

b = 3;

N=b-a;
H=[];
F=[];

for k=1:6;
  % Hacia delante
  [t,y]=euler(f,a,b,y0,N);
  % Hacia atras
  % Nota: La función euler calculará un paso h negativo automáticamente porque tf (0) es menor que t0 (3).
  [t,y1]=euler(f,b,a,y(end),N);

  H=[H;(b-a)/N];
  N=2*N;
  F=[F;y1(end)];
end;
[H F]
[H(end) F(end)]

