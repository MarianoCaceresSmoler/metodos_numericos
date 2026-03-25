function [t, y] = euler(f, t0, tf, y0, M)
    h = (tf - t0) / M;           % Tamaño del paso
    t = linspace(t0, tf, M+1)';  % Vector de tiempos de t0 a tf
    y = zeros(M+1, 1);           % Vector para almacenar la solución
    y(1) = y0;                   % Condición inicial

    for k = 1:M
        y(k+1) = y(k) + h * f(t(k), y(k));
    end
end
