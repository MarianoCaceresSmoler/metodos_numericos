function [p, iter] = punto_fijo(g, p0, tol, max_iter)
    p = p0;
    
    for iter = 1:max_iter
        p_next = g(p); % Evaluamos en la función g(x)
        
        % Criterio de parada: el valor ya no cambia significativamente
        if abs(p_next - p) < tol
            p = p_next;
            return;
        end
        
        p = p_next;
    end
    error('El método de Punto Fijo no convergió en el número máximo de iteraciones.');
end