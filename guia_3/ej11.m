% Parámetros iniciales
h = 0.25;
t = 0:h:2;
N = length(t);

% Vectores para resultados
x = zeros(1, N);
y = zeros(1, N);
x(1) = 4;
y(1) = 2;

% Matriz A y Vector B evaluados en h=0.25
A = [0.6, -0.3; -0.05, 0.65];
B = [0.2; 0.65];

disp(' k |   t  |    xk    |    yk    ');
disp('---------------------------------');
fprintf('%2d | %.2f |  %.4f |  %.4f\n', 0, t(1), x(1), y(1));

for k = 1:(N-1)
    % Iteración matricial
    sig = A * [x(k); y(k)] + B;
    x(k+1) = sig(1);
    y(k+1) = sig(2);

    fprintf('%2d | %.2f | %8.4f | %8.4f\n', k, t(k+1), x(k+1), y(k+1));
end
