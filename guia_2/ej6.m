% =========================================================================
% --- PARTE 2: Método de Newton ---
% =========================================================================

g = @(x) log(x+1) + 1;
a = 2; % Extremo izquierdo de J
x_pf(1) = a;
tol = 1e-6;


% Iteraciones
for k = 1:50
    x_pf(k+1) = g(x_pf(k));
    if abs(x_pf(k+1) - x_pf(k)) < tol
        fprintf('Punto fijo convergió en %d iteraciones. Raíz r = %.7f\n', k, x_pf(k+1));
        break;
    end
end


% Gráfica de la "marcha al punto fijo atractor" (Telaraña / Cobweb)
figure;
t = linspace(2, 3, 100);
plot(t, t, 'k-', 'LineWidth', 1.5); hold on; % Función identidad
plot(t, g(t), 'b-', 'LineWidth', 1.5);       % Función g(x)


% Trazado de la poligonal
% Vértices: (x0, x0), (x0, x1), (x1, x1), (x1, x2), ...
px = [x_pf(1)]; py = [x_pf(1)]; % Empezamos en (a, x0) que es (x0, x0)
for i = 1:length(x_pf)-1
    px = [px, x_pf(i), x_pf(i+1)];
    py = [py, x_pf(i+1), x_pf(i+1)];
end
plot(px, py, 'r.-', 'MarkerSize', 12);
title('Marcha al Punto Fijo en J \times J');
xlabel('x'); ylabel('y');
legend('y = x', 'y = g(x)', 'Poligonal');
grid on; hold off;

% =========================================================================
% --- PARTE 2: Método de Newton ---
% =========================================================================

f = @(x) log(x+1) - x + 1;
df = @(x) 1./(x+1) - 1;


x_newton(1) = -0.99; % Valor inicial x0
E = []; % Vector para guardar los errores


fprintf('\n--- Método de Newton ---\n');
for k = 1:15
    % Iteración de Newton
    x_newton(k+1) = x_newton(k) - f(x_newton(k))/df(x_newton(k));

    % Cálculo del error Ek
    E(k) = abs(x_newton(k+1) - x_newton(k));

    % Verificación Ek+1 ≈ 4*Ek^2 (se calcula a partir de k=2)
    if k > 1
        relacion = E(k) / (E(k-1)^2);
        fprintf('Iteración %d: E_%d / E_%d^2 = %.4f\n', k, k, k-1, relacion);
    end

    % Corte por máxima precisión (usamos eps que es la precisión de la máquina)
    if E(k) < eps
        break;
    end
end


fprintf('Raíz negativa aproximada: %.15f\n', x_newton(end));
