% Problema de valor inicial para la integral
f = @(t, y) 1 ./ (1 + t.^2);
a = 0; b = 1; y0 = 0;
I_exacta = pi / 4;

% Casos de N = 1, 2 y 4
N_vals = [1, 2, 4];

disp(' N |     h    |   Aproximacion I   |   Error Relativo');
disp('-------------------------------------------------------');

for i = 1:length(N_vals)
    N = N_vals(i);
    h = (b - a) / N;
    [T, Y] = rko4(f, a, b, y0, N);

    I_aprox = Y(end); % El último valor es el resultado de la integral
    error_rel = abs(I_exacta - I_aprox) / I_exacta;

    fprintf('%2d |  %.3f   |    %.10f  |    %.3e\n', N, h, I_aprox, error_rel);
end

I_aprox = 0.785;
error_rel = abs(I_exacta - I_aprox) / I_exacta;
fprintf('Error relativo de la aproximacion redondeada a 3 decimales: %.2f porciento \n', error_rel * 100);


