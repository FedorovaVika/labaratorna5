%%�������� 2.1 
%% ������������ ������� ��� ���� (eeg1-p4.txt)
fs = 100;
eeg = load('eeg1-p4.txt');
eeg1 = detrend(eeg);
t = (0:length(eeg1)-1)/fs;
figure(21)
plot(t,eeg1)
title ('��� (eeg1-p4.txt)')
xlabel('���'), 
ylabel('��������');

%% �������� 2.2 
%% �������� ����� ������� ��� �� t1 = 4,7 � �� t2 = 5,8 �
t1 = 4.7;
t2 = 5.8;
n1 = fix(t1*fs)+1;
n2 = fix(t2*fs)+1;
figure(22)
plot(t(n1:n2),eeg1(n1:n2)), grid on
xlim([4.7 5.8]);
title ('��� (eeg1-p4.txt)')
xlabel('���'), 
ylabel('��������');

%% �������� 2.3 
%% ���������� �������� ������ ��� ������� ���
maxlag1 = fix(0.8*length(eeg1));
akf = xcorr(eeg1, maxlag1, 'unbiased');
figure(23)
plot(akf);
title('�������� ������ ��������������� �������');
xlabel('³����'); 
ylabel('��������');

%% �������� 2.5 
%% ���������� ����������� �������� �������
Sx = abs(fft(eeg1)/length(eeg1));
Sy = Sx(1:length(eeg1)/2+1);
Sy(2:end-1) = 2*Sy(2:end-1);
f = fs*(0:(length(eeg1)/2))/length(eeg1);
figure(25)
plot(f,Sy), grid on;
title('����������� �������� ������� ���');
xlabel('�������'); ylabel('��������');


%% �������� 2.6 
%% ������������ ������� ��� ���� (eeg2-f3.txt)

fs = 100;
eeg2 = load('eeg1-f3.txt');
eeg3 = detrend(eeg2);
tn = (0:length(eeg3)-1)/fs;
figure(261)
plot(tn,eeg3)
title('������ ������� ��� (eeg1-f3.dat)');
xlabel('���'); 
ylabel('��������'); 

% �������� ����� ������� ��� �� t1 = 4,2 � �� t2 = 4,96 �

t11 = 4.2;
t12 = 4.96;
n11 = fix(t11*fs)+1;
n12 = fix(t12*fs)+1;
figure(262)
plot(tn(n11:n12),eeg3(n11:n12)), grid on
xlim([4.2 4.96]);
title('����� ������� ��� �� �������� �� 4,2 � �� 4,96 �');
xlabel('���'); 
ylabel('��������');

% ���������� �������� ������ ��� ������� ���

maxlag = fix(0.7*length(eeg3));
lgd=xcorr(eeg3, maxlag, 'unbiased');
figure(263)
plot(lgd);
title('�������� ������ ��������������� ������� ������� ���');
xlabel('³����'); 
ylabel('��������');

% ���������� ����������� �������� �������

Sx = abs(fft(eeg3)/length(eeg3));
Sy = Sx(1:length(eeg3)/2+1);
Sy(2:end-1) = 2*Sy(2:end-1);
f = fs*(0:(length(eeg3)/2))/length(eeg3);
figure(264)
plot(f,Sy), grid on;
title('����������� �������� ������� ���');
xlabel('�������'); 
ylabel('��������');