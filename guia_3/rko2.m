function [T,Y] = rko2(f, a, b, ya, N, metodo)
    % MÉTODO DE RUNGE-KUTTA ORDEN 2
    % f: función tal que y' = f(t, y)
    % a, b: extremos del intervalo
    % ya: condición inicial
    % N: número de pasos
    % metodo: 'heun', 'ralston' o 'euler'

    switch lower(metodo)
        case 'heun'
            A = 0.5; B = 0.5; P = 1; Q = 1;
        case 'ralston'
            A = 1/3; B = 2/3; P = 2/3; Q = 2/3;
        case 'euler'
            A = 0;   B = 1;   P = 0.5; Q = 0.5;
        otherwise
            error('Método no reconocido. Usar ''heun'', ''ralston'' o ''euler''.');
    end

    h = (b - a)/N;
    T = zeros(N+1, 1);
    Y = zeros(N+1, length(ya));
    T(1) = a;
    Y(1,:) = ya;

    for j = 1:N
        K1 = h * f(T(j), Y(j,:));
        T(j+1) = T(j) + P*h;
        K2 = h * f(T(j+1), Y(j,:) + Q*K1);
        Y(j+1,:) = Y(j,:) + A*K1 + B*K2;
    end
end