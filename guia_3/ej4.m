% =========================================================================
% Parte 1: Ecuacion en diferencias
%
% F = ma = mg - k v^2
% m dv/dt = mg - k v^2
% dv/dt = v'(t) = g - k/m v^2(t)
%
% Sabemos que la ecuacion en diferencias del metodo de Euler se expresa
% como v_n+1 = vn + h f(t_n, y_n).
% Ahora, como tenemos 2 etapas de resistencia diferentes, la ecuacion
% se divide tambien en 2 tramos

% Para los primeros 50 segundos (caida libre): k = 0.5
% v_n+1 = vn + h (10 - 0.5/75 * (v_n)^2) = vn + h (10 - 1/150 * (v_n)^2)
%
% Despues de abrir el paracaidas (caida libre): k = 10
% v_n+1 = vn + h (10 - 10/75 * (v_n)^2) = vn + h (10 - 2/15 * (v_n)^2)
%
% Esto tambien se puede expresar programaticamente usando una variable
% t que represente el tiempo transcurrido. Asi queda:
% k1 = 0,5; k2 = 10;
% v_n+1 = vn + h (10 - k_1/75 * (t <= 50) * (v_n)^2 - k_2/75 * (t > 50) * (v_n)^2)
%
%
% =========================================================================

% =========================================================================
% Parte 1: Simulacion en octave
%
% Para ver la velocidad limite, sabemos que esta se alcanza cuando la resistencia
% del aire iguala al peso y la aceleracion se hace cero: g - k/m v^2 = 0
%
% Para la parte anterior a la apertura del paracaidas queda:
% 10 = 1/150 * v^2 => v^2 = 1500 => v = 38.73
%
% Para la parte posterior a la apertura del paracaidas queda:
% 10 = 2/15 * v^2 => v^2 = 75 => v = 8.66
% =========================================================================

% FASE 1
% Definimos la función de la derivada para la Fase 1 (t <= 50)
f1 = @(t, v) 10 - (1/150) * v^2;

% Parametros de la simulacion
t0 = 0;
tf = 50;
y0 = 0; % Parte desde el reposo
h = 0.2;
M = (tf - t0) / h;

% Llamada a la funcion de Euler
[t, v] = euler(f1, t0, tf, y0, M);

% Imprimir la tabla solo para múltiplos de 4
fprintf('Tiempo (t)\tVelocidad (v)\n');
fprintf('------------------------\n');

step = 4;
for i = t0:step:tf
    % Calculamos el índice correspondiente en el vector
    idx = (i / h) + 1;
    fprintf('%d\t\t%.4f\n', t(idx), v(idx));
end

% FASE 2
% Definimos la función de la derivada para la Fase 2 (t > 50)
f2 = @(t, v) 10 - (2/15) * v^2;

% Parametros de la simulacion
t0 = 0;
tf = 50;
y0 = 38.73; % Usando la velocidad asintotica de la primera parte
h = 0.2;
M = (tf - t0) / h;

% Llamada a la funcion de Euler
[t, v] = euler(f2, t0, tf, y0, M);

% Imprimir la tabla solo para múltiplos de 4
fprintf('Tiempo (t)\tVelocidad (v)\n');
fprintf('------------------------\n');

step = 4;
for i = t0:step:tf
    % Calculamos el índice correspondiente en el vector
    idx = (i / h) + 1;
    fprintf('%d\t\t%.4f\n', t(idx), v(idx));
end

% =========================================================================
% Parte 3: Codigo de la consigna y calculo de la distancia recorrida%
%
% Sabemos que la distancia recorrida es la integral de la velocidad respecto al tiempo.
% Sin embargo, dado que no tenemos una función continua $v(t)$ fácil de integrar,
% sino un vector de datos discretos generados por el método de Euler (tiempo y velocidad),
% debemos aproximar esta integral numéricamente.
%
% Opción 1: Suma de rectángulos (Consistente con Euler)
% Como el método de Euler avanza calculando el área de pequeños rectángulos de base h,
% la forma más directa de obtener la distancia es sumar el aporte de cada paso

% Opcion 2: Regla del trapecio
% Octave tiene una función nativa llamada trapz que calcula el área
% bajo la curva uniendo los puntos con líneas rectas (trapecios),
% lo cual suele dar una estimación ligeramente mejor que los rectángulos simples.
%
% =========================================================================

m=75;TL=50;T=100;
g=10;b1=0.5;b2=10;

h=0.055; % se omite de esta manera el instante de apertura
N=ceil(T/h);
t=0;v=zeros(1,N);acel=zeros(1,N);k=1;
while(t<T)
  beta=b1*(t<TL)+b2*(t>=TL);
  acel(k)=g-beta*(v(k)*v(k))/m;
  v(k+1)=v(k)+h*acel(k);
  k=k+1;
  t=t+h;
end
tiempo=0:h:T;
velocidad=v(1:length(tiempo));
aceleracion=acel(1:length(tiempo));
plot(tiempo,velocidad), hold on
plot(tiempo,aceleracion)

% Aproximación rectangular de la integral
H_aprox = sum(velocidad(1:end-1)) * h;
fprintf('La altura aproximada H (por rectángulos) es: %.2f metros\n', H_aprox);

% Aproximación usando la regla del trapecio
H_aprox_trapz = trapz(tiempo, velocidad);
fprintf('La altura aproximada H (por trapecios) es: %.2f metros\n', H_aprox_trapz);

