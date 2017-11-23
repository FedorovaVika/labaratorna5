%%Завдання 2.1 
%% Завантаження сигналу ЕЕГ файл (eeg1-p4.txt)
fs = 100;
eeg = load('eeg1-p4.txt');
eeg1 = detrend(eeg);
t = (0:length(eeg1)-1)/fs;
figure(21)
plot(t,eeg1)
title ('ЕЕГ (eeg1-p4.txt)')
xlabel('Час'), 
ylabel('Амплітуда');

%% Завдання 2.2 
%% Виділення епохи сигналу ЕЕГ від t1 = 4,7 с до t2 = 5,8 с
t1 = 4.7;
t2 = 5.8;
n1 = fix(t1*fs)+1;
n2 = fix(t2*fs)+1;
figure(22)
plot(t(n1:n2),eeg1(n1:n2)), grid on
xlim([4.7 5.8]);
title ('ЕЕГ (eeg1-p4.txt)')
xlabel('Час'), 
ylabel('Амплітуда');

%% Завдання 2.3 
%% Обчислення незміщеної оцінки АКФ сигналу ЕЕГ
maxlag1 = fix(0.8*length(eeg1));
akf = xcorr(eeg1, maxlag1, 'unbiased');
figure(23)
plot(akf);
title('Незміщена оцінка автокореляційної функції');
xlabel('Відліки'); 
ylabel('Значення');

%% Завдання 2.5 
%% Обчислення спектральної щільності сигналу
Sx = abs(fft(eeg1)/length(eeg1));
Sy = Sx(1:length(eeg1)/2+1);
Sy(2:end-1) = 2*Sy(2:end-1);
f = fs*(0:(length(eeg1)/2))/length(eeg1);
figure(25)
plot(f,Sy), grid on;
title('Спектральна щільність сигналу ЕЕГ');
xlabel('Частота'); ylabel('Значення');


%% Завдання 2.6 
%% Завантаження сигналу ЕЕГ файл (eeg2-f3.txt)

fs = 100;
eeg2 = load('eeg1-f3.txt');
eeg3 = detrend(eeg2);
tn = (0:length(eeg3)-1)/fs;
figure(261)
plot(tn,eeg3)
title('Графік сигналу ЕЕГ (eeg1-f3.dat)');
xlabel('Час'); 
ylabel('Амплітуда'); 

% Виділення епохи сигналу ЕЕГ від t1 = 4,2 с до t2 = 4,96 с

t11 = 4.2;
t12 = 4.96;
n11 = fix(t11*fs)+1;
n12 = fix(t12*fs)+1;
figure(262)
plot(tn(n11:n12),eeg3(n11:n12)), grid on
xlim([4.2 4.96]);
title('Епоха сигналу ЕЕГ на інтервалі від 4,2 с до 4,96 с');
xlabel('Час'); 
ylabel('Амплітуда');

% Обчислення незміщеної оцінки АКФ сигналу ЕЕГ

maxlag = fix(0.7*length(eeg3));
lgd=xcorr(eeg3, maxlag, 'unbiased');
figure(263)
plot(lgd);
title('Незміщена оцінка автокореляційної функції сигналу ЕЕГ');
xlabel('Відліки'); 
ylabel('Значення');

% Обчислення спектральної щільності сигналу

Sx = abs(fft(eeg3)/length(eeg3));
Sy = Sx(1:length(eeg3)/2+1);
Sy(2:end-1) = 2*Sy(2:end-1);
f = fs*(0:(length(eeg3)/2))/length(eeg3);
figure(264)
plot(f,Sy), grid on;
title('Спектральна щільність сигналу ЕЕГ');
xlabel('Частота'); 
ylabel('Значення');