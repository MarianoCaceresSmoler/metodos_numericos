g = @(x) exp(x/4);

x(1) = 1;


for k=1:20
    x(k+1) = g(x(k));
    error = abs(x(k+1)-x(k));

    printf("%2d  %.8f  error=%.8f\n",k,x(k+1),error);


    if error < 10e-4
        break
    end
end
