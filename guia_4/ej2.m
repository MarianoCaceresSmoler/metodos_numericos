x = [-1, 0, 2, 3];
y = [-1, 3, 11, 27];

disp('--- 1. Método de coeficientes indeterminados ---');
% Armamos la matriz para P(x) = ax^3 + bx^2 + cx + d
V = [x.^3; x.^2; x; ones(1, 4)]';
coefs_indeterminados = V \ y';
disp('Coeficientes [a; b; c; d]:');
disp(coefs_indeterminados)


disp('--- 2. Forma de Lagrange ---');
% La función devuelve los pesos de cada término: y_i / den_i
pesos_lagrange = lagrange(x, y);
disp('Pesos de Lagrange calculados por tu función:');
disp(pesos_lagrange)
disp('Nota: El polinomio se forma como la suma de (peso_i * productos(x - x_j))');


disp('--- 3. Verificar equivalencia ---');
% Vamos a evaluar el polinomio de coeficientes indeterminados y el de
% Lagrange en varios puntos para demostrar que son la misma curva.
puntos_prueba = linspace(-1, 3, 50);
y_indeterminados = polyval(coefs_indeterminados, puntos_prueba);

y_lagrange = zeros(size(puntos_prueba));
for k = 1:length(puntos_prueba)
    xt = puntos_prueba(k);
    val = 0;
    for i = 1:4
        num = 1;
        for j = 1:4
            if i ~= j
                num = num * (xt - x(j));
            end
        end
        % Usamos el peso calculado por tu función
        val = val + pesos_lagrange(i) * num;
    end
    y_lagrange(k) = val;
end

error_maximo = max(abs(y_indeterminados - y_lagrange));
disp(['Diferencia máxima al evaluar ambas formas: ', num2str(error_maximo)]);
if error_maximo < 1e-10
    disp('¡Verificado! Las formas son matemáticamente equivalentes.');
end


disp('--- 4. Forma de Newton y evaluaciones ---');
% La función resuelve el sistema triangular para hallar los coeficientes
coefs_newton = newton(x, y);

% Evaluamos P(1) usando los coeficientes que devolvió la función
% Fórmula: c1 + c2(x-x1) + c3(x-x1)(x-x2) + c4(x-x1)(x-x2)(x-x3)
c = coefs_newton; % Para acortar el nombre
P_en_1 = c(1) + c(2)*(1 - x(1)) + c(3)*(1 - x(1))*(1 - x(2)) + c(4)*(1 - x(1))*(1 - x(2))*(1 - x(3));
disp(['Evaluación P(1) = ', num2str(P_en_1)]);

% Evaluamos P'(0) derivando analíticamente la expresión de Newton y evaluando en x=0
% P'(x) = c2 + c3[(x-x1) + (x-x2)] + c4[(x-x2)(x-x3) + (x-x1)(x-x3) + (x-x1)(x-x2)]
P_prima_en_0 = c(2) + c(3)*((0 - x(1)) + (0 - x(2))) + c(4)*((0 - x(2))*(0 - x(3)) + (0 - x(1))*(0 - x(3)) + (0 - x(1))*(0 - x(2)));
disp(['Evaluación P''(0) = ', num2str(P_prima_en_0)]);

