format long;

f = @(t,y) exp(-t^2);

a = 0;
b = 2;
y0 = 0;

disp('N = 4');
N = 4;
[T, Y] = rko4(f, a, b, y0, N);
disp(Y(length(Y)));

disp('N = 50');
N = 50;
[T, Y] = rko4(f, a, b, y0, N);
disp(Y(length(Y)));

disp('N = 100');
N = 100;
[T, Y] = rko4(f, a, b, y0, N);
disp(Y(length(Y)));
