%%TASK 1.1
m_p = 0.16; %kg
c_p = 0.4; %Ns/m
k_p = 6.32; %N/m
c_p1 = 0;

w_n = sqrt(k_p/m_p);
zeta= c_p/(2*sqrt(k_p*m_p));
zeta1 = c_p1/(2*sqrt(k_p*m_p));
%%TASK 1.3
H = tf([0,2*zeta*w_n,w_n^2],[1,2*zeta*w_n,w_n^2])
H1 = tf([0,2*zeta1*w_n,w_n^2],[1,2*zeta1*w_n,w_n^2])
% fr= 0:0.01:100;
% [mag,phase,wout] = bode(H1,fr);
% bode(H,H1);


%% task 1.3

%% sine excitation
t = 0:0.01:10;
excitation_sin = 0.05*sin(3*t);

% figure()
% plot(t,excitation_sin)

figure()
lsim(H,excitation_sin,t) % sine excitation
 %% Impulse
stepinput = 0.05*ones([1 length(t)]);
for i = 101:length(t)
   stepinput(i) = 0; 
end

figure()
lsim(H,stepinput,t) % impulse excitation

 %%PSD
w = 0:25;
PSD = (4.028e-7)./((2.88e-4)+(0.68*w.^2)+w.^4);
Hfreqdomain = freqresp(H,w);
H = abs(Hfreqdomain(:))';
PSD = H.^2.*PSD;

semilogy(w,PSD)


