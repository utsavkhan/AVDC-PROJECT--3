%%TASK 1.1
m_p = 0.16; %kg
c_p = 0.4; %Ns/m
k_p = 6.32; %N/m
c_p1 = 0;

w_n = sqrt(k_p/m_p);
zeta= c_p/(2*sqrt(k_p*m_p));
zeta1 = c_p1/(2*sqrt(k_p*m_p));
%%TASK 1.3
H0 = tf([0,2*zeta*w_n,w_n^2],[1,2*zeta*w_n,w_n^2]);
H1 = tf([0,2*zeta1*w_n,w_n^2],[1,2*zeta1*w_n,w_n^2]);


% sine excitation
t = 0:0.01:30;
excitation_sin = 0.05*sin(3*t);

figure(1)
lsim(H0,excitation_sin,t) % sine excitation
hold on;

%% Impulse
stepinput = 0.05*ones([1 length(t)]);
for i = 101:length(t)
   stepinput(i) = 0; 
end

figure(2)
lsim(H0,stepinput,t) % impulse excitation
hold on;

%% PSD
w = 0:0.01:25;
PSD = (4.028e-7)./((2.88e-4)+(0.68*w.^2)+w.^4);
H0freqdomain = freqresp(H0,w);
H0 = abs(H0freqdomain(:))';
PSD = H0.^2.*PSD;

figure(3)
semilogy(w,PSD);
hold on;
xlabel('Frequency (Hz)')
ylabel('Amplitude')

cs = 0.05;
ms = 0.16;
ks = 0.0632;
cp = 0.8;
mp = 0.16;
kp = 6.32;

% A = [0 1 0 0; -k_s/m_s -c_s/m_s k_s/m_s c_s/m_s; 0 0 0 1; k_s/m_p c_s/m_p -(k_s+k_p)/m_p -(c_s+c_p)/m_p];
% B = [0 0; 0 0; 0 0; c_p/m_p k_p/m_p];
% C = [1 0 0 0];
% D = 0;
% 
% sys = ss(A,B,C,D);

s = tf('s');
H = (-kp-cp*s)/(ks+cs*s+((ks+cs*s+ms*s^2)/(ks+cs*s))*(-ks-cs*s-kp-cp*s-mp*s^2));
% H = tf(cs*cp*s^2+kp*cs*s+cp*ks*s+ks*kp,(ms*s^2+cs*s+ks)*(mp*s^2+cp*s+kp));

% sine excitation
t = 0:0.01:30;
excitation_sin = 0.05*sin(3*t);

figure(1)
lsim(H,excitation_sin,t) % sine excitation
hold on;

%% Impulse
stepinput = 0.05*ones([1 length(t)]);
for i = 101:length(t)
   stepinput(i) = 0; 
end

figure(2)
lsim(H,stepinput,t) % impulse excitation
hold on;

%% PSD
w = 0:0.01:25;
PSD = (4.028e-7)./((2.88e-4)+(0.68*w.^2)+w.^4);
Hfreqdomain = freqresp(H,w);
H = abs(Hfreqdomain(:))';
PSD = H.^2.*PSD;

figure(3)
semilogy(w,PSD);
hold on;
xlabel('Frequency (Hz)')
ylabel('Amplitude')