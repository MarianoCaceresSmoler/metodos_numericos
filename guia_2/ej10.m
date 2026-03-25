R = 8;
raiz_exacta = R^(1/3);


% Definimos la función y su derivada
f = @(x) x.^3 - R;
df = @(x) 3*x.^2;


% Rango para graficar
x_plot = linspace(-1, 4, 100);


figure;
plot(x_plot, f(x_plot), 'b-', 'LineWidth', 2); hold on;


% Punto inicial x0 (puedes cambiarlo a 0.5 o 3.5 para ver qué pasa)
x_k = 1.5;


% Simulamos 10 iteraciones para ver las tangentes
for k = 1:10
    y_k = f(x_k);
    plot(x_k, y_k, 'ro', 'MarkerFaceColor', 'r'); % Punto en la curva

    % Calculamos siguiente x
    x_next = x_k - y_k/df(x_k);

    % Graficamos la recta tangente
    plot([x_k, x_next], [y_k, 0], 'r--', 'LineWidth', 1.5);
    plot(x_next, 0, 'go', 'MarkerFaceColor', 'g'); % Intersección con eje x

    % Mostramos el salto
    %pause(1); % Pausa de 1 segundo para ver el paso a paso
    plot([x_next, x_next], [0, f(x_next)], 'g:');
    x_k = x_next;
end


plot(raiz_exacta, 0, 'k*', 'MarkerSize', 10, 'LineWidth', 2);
title('Análisis gráfico: x_{k+1} = (2x_k^3 + R) / 3x_k^2');
xlabel('x'); ylabel('f(x)');
legend('f(x) = x^3 - R', 'Eje x', 'Eje y', 'Punto en curva', 'Tangente (Newton)', 'Nuevo x_{k+1}');
grid on; hold off;


fprintf('\nLa aproximación final a la raíz cúbica de %d es: %.10f\n', R, x_k);
