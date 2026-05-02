x = [1, 2, 3, 4, 5];
y = [0.6931, 1.0986, 1.3863, 1.6094, 1.7918];

disp('--- 1. Obtencion del polinomio interpolador ---');
% Vamos a usar la forma de Newton
% Fórmula: c1 + c2(x-x1) + c3(x-x1)(x-x2) + c4(x-x1)(x-x2)(x-x3) + c5(x-x1)(x-x2)(x-x3)(x-x4)
coefs_newton = newton(x, y);
display(coefs_newton);

disp('--- 2. Aproximacion de la derivada de f en x=3 ---');
% Evaluamos P'(3) derivando analíticamente la expresión de Newton y evaluando en x=3
% P'(x) = c2 + c3[(x-x1) + (x-x2)] + c4[(x-x2)(x-x3) + (x-x1)(x-x3) + (x-x1)(x-x2)] + c5[(x-x2)(x-x3)(x-x4) + (x-x1)(x-x3)(x-x4) + (x-x1)(x-x2)(x-x4) + (x-x1)(x-x2)(x-x3)]
c = coefs_newton; % Para acortar el nombre
P_prima_en_3 = c(2) + c(3)*((3 - x(1)) + (3 - x(2))) + c(4)*((3 - x(2))*(3 - x(3)) + (3 - x(1))*(3 - x(3)) + (3 - x(1))*(3 - x(2))) + c(5)*((3 - x(2))*(3 - x(3))*(3 - x(4)) + (3 - x(1))*(3 - x(3))*(3 - x(4)) + (3 - x(1))*(3 - x(2))*(3 - x(4)) + (3 - x(1))*(3 - x(2))*(3 - x(3)));
disp(['Evaluación P''(3) = ', num2str(P_prima_en_3)]);

disp('--- 3. Aproximacion de la integral de f en (2,4) ---');
% Integramos analíticamente la expresión de Newton y hacemos Barrow entre 2 y 4
% Definimos la función primitiva P(t)
Primitiva = @(t) c(1)*(t) + ...
                 c(2)*(t^2/2 - t) + ...
                 c(3)*(t^3/3 - 3*t^2/2 + 2*t) + ...
                 c(4)*(t^4/4 - 2*t^3 + 11*t^2/2 - 6*t) + ...
                 c(5)*(t^5/5 - 5*t^4/2 + 35*t^3/3 - 25*t^2 + 24*t);

% Aplicamos la regla de Barrow: Integral de 2 a 4 = Primitiva(4) - Primitiva(2)
integral_aprox = Primitiva(4) - Primitiva(2);
disp(['Aprox de la integral de f en (2,4) = ', num2str(integral_aprox)]);

disp('--- 4. Comparacion con la f real ---');
f_real = @(x) log(1+x);
f_prima = @(x) 1/(1+x);
f_primitiva = @(x) (1+x).*log(1+x) - (1+x);

% Comparacion la derivada de f en 3
derivada_exacta = f_prima(3);
disp(['Derivada exacta f''(3) = ', num2str(derivada_exacta)]);
disp(['Error en la derivada = ', num2str(abs(derivada_exacta - P_prima_en_3))]);

% Comparacion con la integral de f en (2,4)
integral_exacta = f_primitiva(4) - f_primitiva(2);
disp(['Integral exacta en (2,4) = ', num2str(integral_exacta)]);
disp(['Error en la integral = ', num2str(abs(integral_exacta - integral_aprox))]);

disp('--- 5. Aproximacion de f(2.2) y cota de error ---');
% Evaluamos P(2.2) usando la forma de Newton
x_eval = 2.2;
P_en_2_2 = c(1) + c(2)*(x_eval - x(1)) + ...
           c(3)*(x_eval - x(1))*(x_eval - x(2)) + ...
           c(4)*(x_eval - x(1))*(x_eval - x(2))*(x_eval - x(3)) + ...
           c(5)*(x_eval - x(1))*(x_eval - x(2))*(x_eval - x(3))*(x_eval - x(4));

disp(['Aproximación P(2.2) = ', num2str(P_en_2_2)]);

% Cálculo de la cota de error teórica
w_2_2 = (x_eval - 1) * (x_eval - 2) * (x_eval - 3) * (x_eval - 4) * (x_eval - 5);
M5 = factorial(4) / (2^5); % Cota dada de f^(5)(x)
cota_error = (abs(w_2_2) * M5) / factorial(5);
disp(['Cota teórica del error en x=2.2: ', num2str(cota_error)]);

% Comparamos con el error real
error_real_2_2 = abs(log(1 + 2.2) - P_en_2_2);
disp(['Error real en x=2.2 = ', num2str(error_real_2_2)]);


disp('--- 6. Representacion grafica y Norma Infinito ---');
% Creamos un vector con pasos de 0.001 en [1, 5]
xv = 1:0.001:5;

% Evaluamos la función exacta
y_exacta = log(1 + xv);

% Evaluamos el polinomio de Newton usando operaciones vectorizadas (con el punto '.')
y_aprox = c(1) + c(2).*(xv - x(1)) + ...
          c(3).*(xv - x(1)).*(xv - x(2)) + ...
          c(4).*(xv - x(1)).*(xv - x(2)).*(xv - x(3)) + ...
          c(5).*(xv - x(1)).*(xv - x(2)).*(xv - x(3)).*(xv - x(4));

% Calculamos la norma infinito (el error máximo en todo el intervalo vectorizado)
errores = abs(y_exacta - y_aprox);
norma_infinito = max(errores);
disp(['Cota de error en norma infinito empírica en [1,5] = ', num2str(norma_infinito)]);

% Gráfica
figure;
plot(xv, y_exacta, 'b-', 'LineWidth', 1.5); hold on;
plot(xv, y_aprox, 'r--', 'LineWidth', 1.5);
plot(x, y, 'ko', 'MarkerSize', 6, 'MarkerFaceColor', 'k');
title('Interpolación de f(x) = \ln(1+x) usando Polinomio de Newton');
xlabel('x');
ylabel('y');
legend('f(x) = \ln(1+x)', 'P_4(x) interpolador', 'Nodos de interpolación', 'Location', 'SouthEast');
grid on;

