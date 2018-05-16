%% task 6

clear all

c_s = 0.05;
m_s = 0.16;
k_s = 0.0632;
c_p = 0.8;
m_p = 0.16;
k_p = 6.32;

B = [0 0; c_p/m_p k_p/m_p; 0 0; 0 0];
C = [0 0 1 0; 0 0 0 1; 0 0 1 -1];
D = [0 0; 0 0; 0 0];
% B = [0 0; 0 0; 0 0; c_p/m_p k_p/m_p];
% C = [1 0 0 0];
% D = 0;
% 
% sys = ss(A,B,C,D);

s = tf('s');
H = tf(-k_p-c_p*s,k_s+c_s*s+((k_s+c_s*s+m_s*s^2)/(k_s+c_s*s))*(-k_s-c_s*s-k_p-c_p*s-m_p*s^2));

bode(H)