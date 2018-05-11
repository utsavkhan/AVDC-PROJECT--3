%%TASK 1.1
m_p = 0.16; %kg
c_p = 0.4; %Ns/m
k_p = 6.32; %N/m
c_p1 = 0;

w_n = sqrt(k_p/m_p);
zeta= c_p/2*sqrt(k_p*m_p);
zeta1 = c_p1/2*sqrt(k_p*m_p);
%%TASK 1.3
H = tf([0,2*zeta*w_n,w_n^2],[1,2*zeta*w_n,w_n^2]);
H1 = tf([0,2*zeta1*w_n,w_n^2],[1,2*zeta1*w_n,w_n^2]);

bode(H,H1);



