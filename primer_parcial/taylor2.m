function [T, Y] = taylor2(f, fp, a, b, ya, N)
    % MÉTODO DE TAYLOR DE ORDEN 2
    % f: función que define y'(t)
    % fp: derivada total de f respecto a t
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

        K1 = h * f(T(j), Y(j,:));
        K2 = (h^2)/2 * fp(T(j), Y(j,:));

        Y(j+1,:) = Y(j,:) + K1 + K2;
    end
end