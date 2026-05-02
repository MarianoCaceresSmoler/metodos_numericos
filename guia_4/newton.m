function coefs = newton(x, y)
    n = length(x);
    A = zeros(n);

    for i = 1:n
        for j = 1:i
            A(i,j) = 1;
            for k = 1:j-1
                A(i,j) = A(i,j) * (x(i) - x(k));
            end
        end
    end

    coefs = A \ y(:);

    disp('Los coeficientes devueltos corresponden a la base de Newton:');
    disp('coefs(1) + coefs(2)*(x - x0) + coefs(3)*(x - x0)*(x - x1) + ...');
end
