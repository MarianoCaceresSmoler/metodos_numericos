function [T, Y] = rko4(f, a, b, ya, N)
    % MÉTODO DE RUNGE-KUTTA ORDEN 4
    % f: función tal que y' = f(t, y)
    % a, b: extremos del intervalo
    % ya: condición inicial (vector fila o escalar)
    % N: número de pasos

    h = (b - a)/N;
    T = zeros(N+1, 1);
    Y = zeros(N+1, length(ya));

    T(1) = a;
    Y(1,:) = ya;

    for j = 1:N
        tj = T(j);
        yj = Y(j,:);

        K1 = f(tj, yj);
        K2 = f(tj + h/2, yj + (h/2)*K1);
        K3 = f(tj + h/2, yj + (h/2)*K2);
        K4 = f(tj + h, yj + h*K3);

        T(j+1) = a + j*h; % Mejor precisión que ir sumando h
        Y(j+1,:) = yj + (h/6)*(K1 + 2*K2 + 2*K3 + K4);
    end
end
