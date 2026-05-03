function [T,Y] = taylor4(f, fp, fpp, fppp, a, b, ya, N)
    % MÉTODO DE TAYLOR DE ORDEN 4
    % f: función tal que y'(t) = f(t, y(t))
    % fp: primera derivada total
    % fpp: segunda derivada total
    % fppp: tercera derivada total
    % a: inicio del intervalo
    % b: fin del intervalo
    % ya: condición inicial
    % N: número de pasos

    h = (b - a) / N;
    T = zeros(N+1, 1);
    Y = zeros(N+1, length(ya));
    T(1) = a;
    Y(1,:) = ya;

    for j = 1:N
        T(j+1) = T(j) + h;

        K1 = h         * f(T(j), Y(j,:));
        K2 = (h^2)/2   * fp(T(j), Y(j,:));
        K3 = (h^3)/6   * fpp(T(j), Y(j,:));
        K4 = (h^4)/24  * fppp(T(j), Y(j,:));

        Y(j+1,:) = Y(j,:) + K1 + K2 + K3 + K4;
    end
end
