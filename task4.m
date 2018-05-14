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
figure(1)
impulse(N*0.05) % impulse excitation
hold on;
figure(2)
lsim(N,excitation_sin,t) % sine excitation
hold on;

% impulse(H*0.05,1) % impulse excitation
 zeta_calc(coeff) = T/(2*w_n*m_p);
 w_calc(coeff) = T/(2*zeta_calc(coeff)*m_p);
utsav(1,coeff)=T;
%  end
% end
