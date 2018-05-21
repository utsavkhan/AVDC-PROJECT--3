clc;
clear all;
% close all;


coeff = 0;
m_p = 0.16; %kg
c_p = 0.4; %Ns/m
k_p = 6.32; %N/m
w_n = sqrt(k_p/m_p);
zeta= c_p/(2*sqrt(k_p*m_p));
% T=2*zeta*w_n*m_p;
% for T = 0:0.01:3;
T= 1; %optimised T

coeff=coeff +1;    

% G = tf([0,0,k_p],[m_p,d_d,k_p+d_p]);
N = tf([0,0,k_p],[m_p,T,k_p]);
figure(4)
bode(N);

% hold on;
%% sine excitation
t = 0:0.01:10;
excitation_sin = 0.05*sin(3*t);

% figure()
% plot(t,excitation_sin)

 figure(1)
lsim(N,excitation_sin,t) % sine excitation
hold on;
set(findall(gcf,'type','line'), 'LineWidth', 2);
 %% Impulse
stepinput = 0.05*ones([1 length(t)]);
for i = 101:length(t)
   stepinput(i) = 0; 
end

figure(2)
lsim(N,stepinput,t) % impulse excitation
hold on;
set(findall(gcf,'type','line'), 'LineWidth', 2);
 %%PSD
w = 0:25;
PSD = (4.028e-7)./((2.88e-4)+(0.68*w.^2)+w.^4);
Hfreqdomain = freqresp(N,w);
N = abs(Hfreqdomain(:))';
PSD = N.^2.*PSD;

figure(3)
semilogy(w,PSD)
hold on
set(findall(gcf,'type','line'), 'LineWidth', 2);
% 
%  zeta_calc(coeff) = T/(2*w_n*m_p);
%  w_calc(coeff) = T/(2*zeta_calc(coeff)*m_p);
% % utsav(1,coeff)=T;
% %  end
% % end
