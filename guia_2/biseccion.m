function [p, iter] = biseccion(f, a, b, tol, max_iter)
    % Verificamos que haya un cambio de signo en el intervalo
    if f(a) * f(b) > 0
        error('La función debe tener signos opuestos en los extremos a y b.');
    end
    
    for iter = 1:max_iter
        p = (a + b) / 2; % Punto medio
        
        % Criterio de parada: si f(p) es casi 0 o el intervalo es muy chico
        if abs(f(p)) < tol || (b - a) / 2 < tol
            return;
        end
        
        % Reemplazamos el límite correspondiente
        if f(a) * f(p) < 0
            b = p;
        else
            a = p;
        end
    end
    error('El método de Bisección no convergió en el número máximo de iteraciones.');
end