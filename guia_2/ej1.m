
% =========================================================================
% Parte 1
% =========================================================================
a = 2; % tomando a=2 para el primer subitem
g = @(x) 0.5*(x + a./x); % definimos la funcion g a utilizar


x0 = 5; % valor inicial
N = 20; % numero de iteraciones


x = zeros(1,N);
x(1) = x0;


printf("k      x_k          error        ratio\n");


for k = 1:N-1
    x(k+1) = g(x(k));


    error = abs(x(k+1) - x(k));


    if k > 1
        ratio = error / prev_error;
        printf("%d   %.8f   %.8f   %.8f\n", k, x(k+1), error, ratio);
    else
        printf("%d   %.8f   %.8f\n", k, x(k+1), error);
    end


    prev_error = error;
end


% Grafica de g(x) y la recta y=x (identidad) para visualizar el proceso de convergencia
xx = linspace(0,5,200);


plot(xx,g(xx),'b',xx,xx,'r')


% Grafico de escalera que muestra el proceso de convergencia
hold on


for k=1:N-1
    plot([x(k) x(k)], [x(k) x(k+1)], 'k')
    plot([x(k) x(k+1)], [x(k+1) x(k+1)], 'k')
end


grid on
legend('g(x)','y=x')