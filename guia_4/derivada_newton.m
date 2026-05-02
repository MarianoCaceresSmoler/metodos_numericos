function yp = derivada_newton(c, x_nodos, x_eval)
    % Evalúa la derivada del polinomio de Newton en los puntos x_eval
    n = length(c);
    yp = zeros(size(x_eval));

    for i = 2:n
        suma_terminos = zeros(size(x_eval));
        % Regla del producto para la derivada de (x-x1)(x-x2)...(x-xi)
        for k = 1:(i-1)
            producto = ones(size(x_eval));
            for j = 1:(i-1)
                if j ~= k
                    producto = producto .* (x_eval - x_nodos(j));
                end
            end
            suma_terminos = suma_terminos + producto;
        end
        yp = yp + c(i) * suma_terminos;
    end
end
