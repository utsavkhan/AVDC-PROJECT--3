%% task 6

% clear all

c_s = 0.05;
m_s = 0.16;
k_s = 0.0632;
c_p = 0.8;
m_p = 0.16;
k_p = 6.32;
T = 1;

A = [0 1 0 0; -k_s/m_s -T/m_s k_s/m_s 0; 0 0 0 1; k_s/m_p T/m_p -(k_s+k_p)/m_p -(c_p/m_p)];
B = [0 0; 0 0; 0 0; k_p/m_p c_p/m_p];
C = [1 0 0 0];
D = 0;

sys = ss(A,B,C,D);
bode(sys)