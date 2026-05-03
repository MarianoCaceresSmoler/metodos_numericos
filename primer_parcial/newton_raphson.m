function [p, iter] = newton_raphson(f, df, p0, tol, max_iter)
    p = p0;

    for iter = 1:max_iter
        fp = f(p);
        dfp = df(p);

        % Este error lo mantenemos porque si dfp es 0, hay división por cero y Matlab fallará.
        if dfp == 0
            error('La derivada es cero. El método de Newton falla en este punto.');
        end

        p_next = p - fp / dfp; % Fórmula de Newton-Raphson

        % Criterio de parada: si el salto entre p y p_next es muy pequeño
        if abs(p_next - p) < tol
            p = p_next;
            return;
        end

        p = p_next;
    end
end
