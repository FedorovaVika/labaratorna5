%% �������� 3.5 
%% ������������ ������� ��� ���� (eeg1-p3.txt) (eeg1-p4.txt)

fs = 100;
eeg = load('eeg1-p3.txt');
eeg1 = detrend(eeg);
t = (0:length(eeg1)-1)/fs;
eeg2 = load('eeg1-p4.txt');
eeg3 = detrend(eeg2);
ts = (0:length(eeg3)-1)/fs;
figure(351)
subplot (2, 1, 1)
plot(t,eeg1)
title ('��� (eeg1-p3.txt)')
xlabel('���'), 
ylabel('��������');
subplot (2, 1, 2)
plot(ts,eeg3)
title ('��� (eeg1-p4.txt)')
xlabel('���'), 
ylabel('��������');

%% �������� ����� ������� ��� �� t1 = 4.7 � �� t2 = 5.8 �
t1 = 4.7;
t2 = 5.8;
n1 = fix(t1*fs)+1;
n2 = fix(t2*fs)+1;
eeg4 = detrend(eeg(n1:n2));
eeg5 = detrend(eeg2(n1:n2));
figure(352)
subplot (2, 1, 1)
plot(t(n1:n2),eeg1(n1:n2)), grid on
xlim([4.7 5.8]);
title ('����� ������� ��� �� �������� �� 4.7 �� 5.8  (eeg1-p3.txt)')
xlabel('���'), 
ylabel('��������');
subplot (2, 1, 2)
plot(ts(n1:n2),eeg3(n1:n2)), grid on
xlim([4.7 5.8]);
title ('����� ������� ��� �� �������� �� 4.7 �� 5.8 (eeg1-p4.txt)')
xlabel('���'), 
ylabel('��������');



%% ���������� ��� ������� ���
lgd1 = xcorr(eeg1, eeg3, maxlag);
figure(353)
plot(lgd1);
title('������ ���������������� ������ ������� ���');
xlabel('³����'); 
ylabel('��������');


%% ���������� ����������� �������� �������
Sx = abs(fft(lgd1)/length(lgd1));
Sy = Sx(1:length(lgd1)/2+1);
Sy(2:end-1)=2*Sy(2:end-1);
f = fs*(0:(length(lgd1)/2))/length(lgd1);
figure(354)
plot(f,Sy), grid on;
title('����������� �������� ������� ���');
xlabel('�������'); 
ylabel('��������');

