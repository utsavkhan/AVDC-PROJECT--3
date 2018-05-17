clc;
clear all;
% close all;

%%task 2

m_p = 0.16; %kg
c_p = 0.4; %Ns/m
k_p = 6.32; %N/m
w_n = sqrt(k_p/m_p);
zeta= c_p/(2*sqrt(k_p*m_p));
% c_p1 = 0;
% d_d = 2*zeta*w_n*m_p;
% d_p = (w_n)^2*m_p - k_p;
coeff= 0;
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
d_d= 2*m_p*w_n; %crtically damped
d_p = 0;
G = tf([0,0,k_p],[m_p,d_d,k_p+d_p]);
% bode(G)
%% sine excitation
t = 0:0.01:10;
excitation_sin = 0.05*sin(3*t);

% figure()
% plot(t,excitation_sin)

figure(1)
lsim(G,excitation_sin,t) % sine excitation
hold on;
 %% Impulse
stepinput = 0.05*ones([1 length(t)]);
for i = 101:length(t)
   stepinput(i) = 0; 
end

figure(2)
lsim(G,stepinput,t) % impulse excitation
hold on;
 %%PSD
w = 0:25;
PSD = (4.028e-7)./((2.88e-4)+(0.68*w.^2)+w.^4);
Hfreqdomain = freqresp(G,w);
G = abs(Hfreqdomain(:))';
PSD = G.^2.*PSD;

figure(3)
semilogy(w,PSD)
hold on;
% 
% 
% w_calc= sqrt((k_p+d_p)/m_p);
% zeta_calc = d_d / (2*m_p*w_n);
% utsav(1,coeff)=d_d;
% utsav(2,coeff)=d_p;
%  end
% end