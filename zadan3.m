%% Завдання 3.1 
%% Завантаження сигналу ЕЕГ файл (eeg1-o2.dat)
fs = 100;
eeg = load('eeg1-o2.txt');
eeg1 = detrend(eeg);
t = (0:length(eeg1)-1)/fs;
eeg2 = load('eeg1-c3.txt');
eeg3 = detrend(eeg2);
ts = (0:length(eeg3)-1)/fs;
figure(31)
subplot (2, 1, 1)
plot(t,eeg1)
title ('ЕЕГ (eeg1-o2.txt)')
xlabel('Час'), 
ylabel('Амплітуда');
subplot (2, 1, 2)
plot(ts,eeg3)
title ('ЕЕГ (eeg1-c3.txt)')
xlabel('Час'), 
ylabel('Амплітуда');


%% Завдання 3.2 
%% Виділення епохи сигналу ЕЕГ від t1 = 5,71 с до t2 = 6,78 с
t1 = 5.71;
t2 = 6.78;
n1 = fix(t1*fs)+1;
n2 = fix(t2*fs)+1;
eeg4 = detrend(eeg(n1:n2));
eeg5 = detrend(eeg2(n1:n2));
figure(32)
subplot (2, 1, 1)
plot(t(n1:n2),eeg1(n1:n2)), grid on
xlim([5.71 6.78]);
title ('Епоха сигналу ЕЕГ на інтервалі від 5.71 до 6.78 (eeg1-o2.txt)')
xlabel('Час'), 
ylabel('Амплітуда');
subplot (2, 1, 2)
plot(ts(n1:n2),eeg3(n1:n2)), grid on
xlim([5.71 6.78]);
title ('Епоха сигналу ЕЕГ на інтервалі від 5.71 до 6.78 (eeg1-c3.txt)')
xlabel('Час'), 
ylabel('Амплітуда');

%% Завдання 3.3 
%% Обчислення ВКФ сигналів ЕЕГ
lgd1 = xcorr(eeg1, eeg3, maxlag);
figure(33)
plot(lgd1);
title('Оцінка взаємокореляційної фунції сигналу ЕЕГ');
xlabel('Відліки'); 
ylabel('Значення');

%% Завдання 3.4
%% Обчислення спектральної щільності сигналу

Sx = abs(fft(lgd1)/length(lgd1));
Sy = Sx(1:length(lgd1)/2+1);
Sy(2:end-1)=2*Sy(2:end-1);
f = fs*(0:(length(lgd1)/2))/length(lgd1);
figure(34)
plot(f,Sy), grid on;
title('Спектральна щільність сигналу ЕЕГ');
xlabel('Частота'); 
ylabel('Значення');








