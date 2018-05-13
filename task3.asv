clc;
clear all;
% close all;

%%task 2
t = 1:0.01:10;
excitation_sin = 0.05*sin(3*t);

m_p = 0.16; %kg
c_p = 0.4; %Ns/m
k_p = 6.32; %N/m
w_n = sqrt(k_p/m_p);
zeta= c_p/2*sqrt(k_p*m_p);
h_p = 1;
h_d = 1;
h_i = 1; 
% c_p1 = 0;
% d_d = 2*zeta*w_n*m_p;
% d_p = (w_n)^2*m_p - k_p;
% coeff= 0;
% d_d_mat=[0.01 0.1 1 10 100  ];
% d_p_mat=[0.01 0.1 1 10 100  ];
% for l1=1:length(d_d_mat)
%     d_d=d_d_mat(l1);
%  for l2=1:length(d_p_mat)
%     d_p=d_p_mat(l2);
% for d_d=0:0.2:1
%     for d_p=0:0.2:1
% coeff=coeff +1;    
% H = tf([0,2*zeta*w_n,w_n^2],[1,2*zeta*w_n,w_n^2]);
% d_d = 1;
% d_d= 2*m_p*w_n; %crtically damped
% d_p = 0;
% G = tf([0,0,k_p],[m_p,d_d,k_p+d_p]);
M = tf([0,k_p,0],[m_p,h_d,(k_p+h_p),h_i]);
bode(M)
% figure(1)
% impulse(G*0.05) % impulse excitation
% hold on;
% figure(2)
% lsim(G,excitation_sin,t) % sine excitation
% hold on;

% impulse(H*0.05,1) % impulse excitation
% w_calc= sqrt((k_p+d_p)/m_p);
% zeta_calc = d_d / 2*m_p*w_n;
% utsav(1,coeff)=d_d;
% utsav(2,coeff)=d_p;
%  end
% end