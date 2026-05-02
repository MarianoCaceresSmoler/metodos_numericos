function p_canonica = newton_a_canonica(c, x_nodos)
    % Convierte los coeficientes de Newton a coeficientes polinomiales estándar
    % p_canonica queda listo para usar con polyval, polyder y polyint
    n = length(c);
    p_canonica = [c(1)]; % Inicializamos con el término independiente c1
    base = [1]; % Representa el polinomio neutro "1"

    for i = 2:n
        % conv() multiplica polinomios: base actual * (x - x_{i-1})
        base = conv(base, [1, -x_nodos(i-1)]);

        % Sumamos al polinomio total (rellenando con ceros a la izquierda para alinear los grados)
        p_canonica = [zeros(1, length(base) - length(p_canonica)), p_canonica] + c(i) * base;
    end
end
