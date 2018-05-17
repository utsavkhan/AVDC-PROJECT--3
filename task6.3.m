%% task 6

clear all

cs = 0.05;
ms = 0.16;
ks = 0.0632;
cp = 0.8;
mp = 0.16;
kp = 6.32;

A = [0 1 0 0; -k_s/m_s -c_s/m_s k_s/m_s c_s/m_s; 0 0 0 1; k_s/m_p c_s/m_p -(k_s+k_p)/m_p -(c_s+c_p)/m_p];
B = [0 0; 0 0; 0 0; c_p/m_p k_p/m_p];
C = [1 0 0 0];
D = 0;

sys = ss(A,B,C,D);