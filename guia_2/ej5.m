format long


x(1) = -3;
tol = 1e-6; % Definimos la tolerancia deseada


for k = 1:100 % Aumentamos el límite de iteraciones por seguridad
    a = x(k);

    % Calculamos la siguiente aproximación (Método de Newton-Raphson)
    x(k+1) = a - (exp(a)-sin(a))/(exp(a)-cos(a));

    % Calculamos el error absoluto entre iteraciones
    error = abs(x(k+1) - x(k));

    % Si el error es menor que la tolerancia, detenemos el bucle
    if error < tol
        fprintf('Convergencia alcanzada en la iteración %d\n', k);
        break;
    end
end


x' % Mostramos el vector con todas las aproximaciones