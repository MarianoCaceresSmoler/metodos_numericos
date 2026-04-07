function [T, Y] = taylor3(f, fp, fpp, a, b, ya, N)
    % MÉTODO DE TAYLOR DE ORDEN 3
    % f: función tal que y'(t) = f(t, y(t))
    % fp: derivada total primera de f respecto a t
    % fpp: derivada total segunda de f respecto a t
    % a, b: extremos del intervalo
    % ya: condición inicial
    % N: número de pasos

    h = (b - a) / N;
    T = zeros(N+1, 1);
    Y = zeros(N+1, length(ya));
    T(1) = a;
    Y(1,:) = ya;

    for j = 1:N
        T(j+1) = T(j) + h;

        K1 = h       * f(T(j), Y(j,:));
        K2 = (h^2)/2 * fp(T(j), Y(j,:));
        K3 = (h^3)/6 * fpp(T(j), Y(j,:));

        Y(j+1,:) = Y(j,:) + K1 + K2 + K3;
    end
end