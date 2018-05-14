%% task 6

clear all

c_s = 0.05;
m_s = 0.16;
k_s = 0.0632;
c_p = 0.8;
m_p = 0.16;
k_p = 6.32;

A = [-c_s/m_s c_s/m_s -k_s/m_s k_s/m_s; c_s/m_p -(c_s+c_p)/m_p k_s/m_p -(k_s+k_p)/m_p; 1 0 0 0; 0 1 0 0];
B = [0 0; c_p/m_p k_p/m_p; 0 0; 0 0];
C = [0 0 1 0; 0 0 0 1; 0 0 1 -1];
D = [0 0; 0 0; 0 0];

sys = ss(A,B,C,D);

bode(sys)