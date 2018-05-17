%% task 6.4

clear all

c_s = 0.05;
m_s = 0.16;
k_s = 0.0632;
c_p = 0.8;
m_p = 0.16;
k_p = 6.32;
T = 1;

A = [0 1 0 0; -k_s/m_s -T/m_s k_s/m_s 0; 0 0 0 1; k_s/m_p T/m_p -(k_s+k_p)/m_p -(c_p/m_p)];
B = [0 0; 0 0; 0 0; k_p/m_p c_p/m_p];
C = [1 0 0 0;0 0 0 0 ;0 0 0 0;0 0 0 0;];
D = [0 0;0 0;0 0;0 0];

% P = ss(A,B,C,D);
% bode(P);
% 
% %% sine excitation
% t = 0:0.01:10;
% excitation_sin = 0.05*sin(3*t);
% 
% figure(2)
% lsim(P,excitation_sin,t) % sine excitation
% 
% %% Impulse
% stepinput = 0.05*ones([1 length(t)]);
% for i = 101:length(t)
%    stepinput(i) = 0; 
% end
% 
% figure(3)
% lsim(P,stepinput,t) % impulse excitation
% 
% %% PSD
% w = 0:0.01:25;
% PSD = (4.028e-7)./((2.88e-4)+(0.68*w.^2)+w.^4);
% Pfreqdomain = freqresp(P,w);
% P = abs(Hfreqdomain(:))';
% PSD = P.^2.*PSD;
% 
% figure(4)
% semilogy(w,PSD)