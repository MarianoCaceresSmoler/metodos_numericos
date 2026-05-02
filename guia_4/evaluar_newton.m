function y_eval = evaluar_newton(c, x_nodos, x_eval)
    % Evalúa el polinomio de Newton en los puntos x_eval
    n = length(c);
    y_eval = c(1) * ones(size(x_eval)); % Inicializa con c_1
    termino_acumulado = ones(size(x_eval));

    for i = 2:n
        % Va multiplicando por (x - x_{i-1}) iterativamente
        termino_acumulado = termino_acumulado .* (x_eval - x_nodos(i-1));
        y_eval = y_eval + c(i) * termino_acumulado;
    end
end
