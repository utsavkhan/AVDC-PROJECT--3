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
% fr= 0:0.01:100;
% [mag,phase,wout] = bode(H1,fr);
% bode(H,H1);

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

bode(H0,H)
legend('Single DoF System','Two DoF System')