function coefs = lagrange(x, y)
%   Calcula los coeficientes del polinomio interpolador de Lagrange
%   coefs = lagrange(x, y) devuelve los coeficientes para cada término
%   base L_i(x) que se usa en la forma de Lagrange.
%
%   p(x) = sum_i (coefs(i) * L_i(x))
%   donde L_i(x) = producto_j≠i [(x - xj) / (xi - xj)]

    n = length(x);
    coefs = zeros(1, n); % Inicializar vector de coeficientes

    for i = 1:n
        denom = 1;
        for j = 1:n
            if j ~= i
                denom = denom * (x(i) - x(j));
            end
        end
        coefs(i) = y(i) / denom;
    end
end
