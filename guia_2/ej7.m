% =========================================================================
% --- PARTE 2 ---
% =========================================================================

g = @(x) (x+1).^(1/3);


x(1)=1;


for k=1:50
    x(k+1)=g(x(k));
    error = abs(x(k+1)-x(k));


    printf("%2d  %.8f  error=%.8f\n",k,x(k+1),error);


    if error < 1e-4
        break
    end
end


xx = linspace(1,2,200);


plot(xx,g(xx),'b',xx,xx,'r')
hold on


for k=1:6
    plot([x(k) x(k)], [x(k) x(k+1)], 'k')
    plot([x(k) x(k+1)], [x(k+1) x(k+1)], 'k')
end


grid on
legend('g(x)','y=x')


% =========================================================================
% --- PARTE 3 ---
% =========================================================================

g = @(x) sqrt(1 + 1./x);


x(1)=1;


printf(" k     x_k          error        ratio\n");
for k=1:50
    x(k+1)=g(x(k));
    error = abs(x(k+1)-x(k));


    if k > 1
        ratio = error / prev_error;
        printf("%2d  %.8f  %.8f  %.8f\n",k,x(k+1),error,ratio);
    else
        printf("%2d  %.8f  %.8f\n",k,x(k+1),error);
    end


    prev_error = error;


    if error < 1e-4
        break
    end
end


xx = linspace(1,2,200);


plot(xx,g(xx),'b',xx,xx,'r')
hold on


for k=1:6
    plot([x(k) x(k)], [x(k) x(k+1)], 'k')
    plot([x(k) x(k+1)], [x(k+1) x(k+1)], 'k')
end


grid on
legend('g(x)','y=x')


% =========================================================================
% --- PARTE 4 ---
% =========================================================================

f = @(x) x.^3 - x - 1;
df = @(x) 3*x.^2 - 1;


x(1)=1.5;


for k=1:20
    x(k+1)=x(k)-f(x(k))/df(x(k));
    error=abs(x(k+1)-x(k));


    printf("%2d %.10f error=%.10f\n",k,x(k+1),error);


    if error<1e-10
        break
    end
end


E = abs(diff(x));


for k=1:4
    printf("E_{k+1}/E_k^2 = %.6f\n", E(k+1)/(E(k)^2));
end
