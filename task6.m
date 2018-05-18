%% task 6

clear all

c_s = 0.05;
m_s = 0.16;
k_s = 0.0632;
c_p = 0.8;
m_p = 0.16;
k_p = 6.32;

% A = [0 1 0 0; -k_s/m_s -c_s/m_s k_s/m_s c_s/m_s; 0 0 0 1; k_s/m_p c_s/m_p -(k_s+k_p)/m_p -(c_s+c_p)/m_p];
% B = [0 0; 0 0; 0 0; c_p/m_p k_p/m_p];
% C = [1 0 0 0];
% D = 0;
% 

% % sys = ss(A,B,C,D);
% 
% s = tf('s');
% H = tf(-kp-cp*s,ks+cs*s+((ks+cs*s+ms*s^2)/(ks+cs*s))*(-ks-cs*s-kp-cp*s-mp*s^2));
% % H = tf(cs*cp*s^2+kp*cs*s+cp*ks*s+ks*kp,(ms*s^2+cs*s+ks)*(mp*s^2+cp*s+kp));
% 
% 
% pole(H)
% 
% bode(H)
% A = [0 1 0 0;-k_s/m_s 0 k_s/m_s 0;0 0 0 1;k_s/m_p 0 (k_s+k_p)/m_p -c_p/m_p];
% B = [0 0 0;-1/m_s 0 0;0 0 0;1/m_p k_p/m_p c_p/m_p];
% C = [1 0 0 0];
% D = [0 0 0;0 0 0;0 0 0;0 0 0];
% 
% % sys = ss(A,B,C,D);

s = tf('s');
H = (-k_p-c_p*s)/(k_s+c_s*s+((k_s+c_s*s+m_s*s^2)/(k_s+c_s*s))*(-k_s-c_s*s-k_p-c_p*s-m_p*s^2));
% H = tf(cs*cp*s^2+kp*cs*s+cp*ks*s+ks*kp,(ms*s^2+cs*s+ks)*(mp*s^2+cp*s+kp));


% pole(H)

% figure(1)
% bode(H)

% 
% step(H)

%% sine excitation
t = 0:0.01:10;
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

