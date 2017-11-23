%% Завдання 1.1 
%% Моделювання стаціонарного випадкового процесу

fs = 200;
f0 = 5;
A = 0.5;
D = 0.25;
n = 1000;
t =(0:(n-1))/fs; % вектор часу
v = randn(size(t))*sqrt(D); 
s = A*cos(2*pi*f0*t);
x = s + v;  
figure(11)% Графіки отриманих сигналів
subplot(3,1,1),plot(t,s);
title('s(t)')
xlabel('Час'), 
ylabel('Амплітуда');
subplot(3,1,2),
plot(t,v);
title('v(t)')
xlabel('Час'), 
ylabel('Амплітуда');
subplot(3,1,3),
plot(t,x);
title('x(t)')
xlabel('Час'), 
ylabel('Амплітуда');

%% Завдання 1.2 
%% Обчислення оцінки дисперсії шуму, дисперсії сигналу та відношення шум/сигнал

fprintf('Дисперсія сигналу = %4.3g\n', var(s))
fprintf('Дисперсія шуму = %4.3g\n', var(v))
fprintf('Відношення шум/сигнал = %4.3g\n', snr(s, v))

%% Завдання 1.3 
%% Обчислення незміщеної оцінки АКФ змодельованого процесу  

maxlag = fix(0.1*length(x));
[v, lags] = xcorr(x, maxlag, 'unbiased');
figure(13)
plot(lags, v); 
title('Незміщена АКФ');
xlim([-5 5]);
xlabel('Відліки');
ylabel('Амплітуда');

%% Завдання 1.4 
%% Обчислення зміщеної оцінки АКФ змодельованого процесу  

maxlag2 = fix(0.9*length(x));
[v2, lags2] = xcorr(x, maxlag2, 'biased');
figure(3)
plot(lags2, v2); 
title('Зміщена АКФ');
xlim([-5 5]);
xlabel('Відліки'); 
ylabel('Амплітуда');

%% Завдання 1.5 
%% Обчислення оцінки АКФ змодельованого процесу при збільшенні тривалості процесу

t1 = 0:100; % вектор часу
v1 = randn(size(t1))*sqrt(D);
s1 = A*cos(2*pi*f0*t1);
x1 = s1 + v1;
maxlag3 = fix(0.3*length(x1));
[r1, lags3] = xcorr(x1, maxlag3, 'unbiased');
[r2, lags4] = xcorr(x1, maxlag3, 'biased');
figure(151)
subplot(2, 1, 1); 
plot(lags3, r1); 
title('Незміщена оцінка АКФ  при t = 100');
xlim([-40 40]);
ylabel('Амплітуда');
subplot(2, 1, 2); 
plot(lags4, r2); 
title('Зміщена оцінка АКФ  при t = 100');
xlim([-40 40]);
xlabel('Відліки'); 
ylabel('Амплітуда');

%t=1000
t2 = 0:1000; % вектор часу
v2 = randn(size(t2))*sqrt(D);
s2 = A*cos(2*pi*f0*t2);
x2 = s2 + v2;
maxlag4 = fix(0.3*length(x2));
[r3, lags5] = xcorr(x4, maxlag4, 'unbiased');
[r4, lags6] = xcorr(x4, maxlag4, 'biased');
figure(152)
subplot(2, 1, 1); 
plot(lags5, r3); 
title('Незміщена оцінка АКФ при t = 1000');
xlim([-40 40]);
ylabel('Амплітуда');
subplot(2, 1, 2);
plot(lags6, r4); 
title('Зміщена оцінка АКФ  при t = 1000');
xlim([-40 40]);
xlabel('Відліки'); 
ylabel('Амплітуда');
