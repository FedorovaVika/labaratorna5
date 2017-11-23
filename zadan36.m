%% Завдання 3.6 
%% Завантаження сигналу ЕЕГ файл 

fs = 100;
eeg = load('eeg1-f3.txt');
eeg1 = detrend(eeg);
t = (0:length(eeg1)-1)/fs;
eeg2 = load('eeg1-f4.txt');
eeg3 = detrend(eeg2);
ts = (0:length(eeg3)-1)/fs;
figure(361)
subplot (2, 1, 1)
plot(t,eeg1)
title ('ЕЕГ (eeg1-f3.txt)')
xlabel('Час'), 
ylabel('Амплітуда');
subplot (2, 1, 2)
plot(ts,eeg3)
title ('ЕЕГ (eeg1-f4.txt)')
xlabel('Час'), 
ylabel('Амплітуда');

%% Виділення епохи сигналу ЕЕГ від t1 = 5,71 с до t2 = 6,78 с
t1 = 4.13;
t2 = 4.96;
t3 = 1.43;
t4 = 2.26;
n1 = fix(t1*fs)+1;
n2 = fix(t2*fs)+1;
n3 = fix(t3*fs)+1;
n4 = fix(t4*fs)+1;
eeg4 = detrend(eeg(n1:n2));
eeg5 = detrend(eeg2(n3:n4));
figure(362)
subplot (2, 1, 1)
plot(t(n1:n2),eeg1(n1:n2)), grid on
xlim([4.13 4.96]);
title ('Епоха сигналу ЕЕГ на інтервалі від 4.13 до 4.96(eeg1-f3.txt)')
xlabel('Час'), 
ylabel('Амплітуда');
subplot (2, 1, 2)
plot(ts(n3:n4),eeg3(n3:n4)), grid on
xlim([1.43 2.26]);
title ('Епоха сигналу ЕЕГ на інтервалі від 1.43 до 2.26 (eeg1-f4.txt)')
xlabel('Час'), 
ylabel('Амплітуда');


%% Обчислення ВКФ сигналів ЕЕГ
maxlag=250;
lgd1 = xcorr(eeg1, eeg3, maxlag);
figure(363)
plot(lgd1);
title('Оцінка взаємокореляційної фунції сигналу ЕЕГ');
xlabel('Відліки'); 
ylabel('Значення');


%% Обчислення спектральної щільності сигналу
Sx = abs(fft(lgd1)/length(lgd1));
Sy = Sx(1:length(lgd1)/2+1);
Sy(2:end-1)=2*Sy(2:end-1);
f = fs*(0:(length(lgd1)/2))/length(lgd1);
figure(364)
plot(f,Sy), grid on;
title('Спектральна щільність сигналу ЕЕГ');
xlabel('Частота'); 
ylabel('Значення');

