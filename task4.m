clc;
clear all;
% close all;

%%task 2
t = 1:0.01:10;
excitation_sin = 0.05*sin(3*t);
coeff = 0;
m_p = 0.16; %kg
c_p = 0.4; %Ns/m
k_p = 6.32; %N/m
w_n = sqrt(k_p/m_p);
zeta= c_p/(2*sqrt(k_p*m_p));
T=2*zeta*w_n*m_p;
% for T = 2:0.01:3;
% T= 2.01; %optimised T

coeff=coeff +1;    

% G = tf([0,0,k_p],[m_p,d_d,k_p+d_p]);
N = tf([0,0,k_p],[m_p,T,k_p]);
% bode(N);
% hold on;
%% sine excitation
t = 0:0.01:10;
excitation_sin = 0.05*sin(3*t);

% figure()
% plot(t,excitation_sin)

figure()
lsim(H,excitation_sin,t) % sine excitation
 %% Impulse
stepinput = 0.05*ones([1 length(t)]);
for i = 101:length(t)
   stepinput(i) = 0; 
end

figure()
lsim(H,stepinput,t) % impulse excitation

 %%PSD
w = 0:25;
PSD = (4.028e-7)./((2.88e-4)+(0.68*w.^2)+w.^4);
Hfreqdomain = freqresp(H,w);
H = abs(Hfreqdomain(:))';
PSD = H.^2.*PSD;

semilogy(w,PSD)

 zeta_calc(coeff) = T/(2*w_n*m_p);
 w_calc(coeff) = T/(2*zeta_calc(coeff)*m_p);
utsav(1,coeff)=T;
%  end
% end
