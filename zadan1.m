fs = 200;
f0 = 5;
A = 0.5;
D = 0.25;
n = 1000;
t =(0:(n-1))/fs;% вектор часу
v = randn(size(t))*sqrt(D); 
s = A*cos(2*pi*f0*t);
x = s + v;  
figure(11)% Графіки отриманих сигналів
y=filter(v,s,x)
subplot(3,1,1),plot(t,s);
title('s(t)')
xlabel('Час'), ylabel('Амплітуда');
subplot(3,1,2),plot(t,v);
title('v(t)')
xlabel('Час'), ylabel('Амплітуда');
subplot(3,1,3),plot(t,x);
title('x(t)')
xlabel('Час'), ylabel('Амплітуда');
fprintf('Математичне сподівання сигналу = %4.3g\n', mean(s))
fprintf('Дисперсія сигналу = %4.3g\n', var(s))
fprintf('Дисперсія шуму = %4.3g\n', var(v))
fprintf('Математичне сподівання сигнал + шум = %4.3g\n', mean(x))
fprintf('Дисперсія сигнал + шум = %4.3g\n', var(x))

maxlag = fix(0.3*length(s));
[v, lags]=xcorr(s, maxlag, 'unbiased');
figure(13)
plot(t,x), xlim ([-5, 5]);
title ('x(t)')
xlabel('Час'), ylabel('Амплітуда');

maxlag = fix(0.9*length(s))
[v, lags]=xcorr(s, maxlag, 'biased');
figure(14)
plot(t,x), xlim ([-5, 5]);
title ('x(t)')
xlabel('Час'), 
ylabel('Амплітуда');

%При t=100
n = 1000;
t = 0:100;
v = randn(size(t))*sqrt(D);
s = A*cos(2*pi*f0*t);
x = s + v
maxlag = fix(0.3*length(s));
[v, lags]= xcorr(s,maxlag,'unbiased');
figure(151)
plot(t,x)
title ('x(t)')
xlabel('Час'), ylabel('Амплітуда');

%При t=1000
n = 1000;
t = 0:1000;
v = randn(size(t))*sqrt(D);
s = A*cos(2*pi*f0*t);
x = s + v
maxlag = fix(0.9*length(s));
[r, lags]= xcorr(s,maxlag,'unbiased');
figure(152)
plot(t,x)
title ('x(t)')
xlabel('Час'), ylabel('Амплітуда');