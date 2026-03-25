function [p, iter] = newton_raphson(f, df, p0, tol, max_iter)
    p = p0;
    
    for iter = 1:max_iter
        fp = f(p);
        dfp = df(p);
        
        if dfp == 0
            error('La derivada es cero. El método de Newton falla.');
        end
        
        p_next = p - fp / dfp; % Fórmula de Newton-Raphson
        
        % Criterio de parada: si el salto entre p y p_next es muy pequeño
        if abs(p_next - p) < tol
            p = p_next;
            return;
        end
        
        p = p_next;
    end
    error('El método de Newton-Raphson no convergió en el número máximo de iteraciones.');
end