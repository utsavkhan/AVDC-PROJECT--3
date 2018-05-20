clear all;


m=22000;
j=700000;
c1=40000;
c2=40000;
k1=600000;
k2=600000;
l1=6;
l2=6;
cz=10e7;
cx=10;

%% active

A=[0 1 0 0;(-k1-k2)/m -cz/m (k1*l1-k2*l2)/m 0;0 0 0 1;(k1*l1-k2*l2)/j 0 (-k1*(l1^2)-k2*(l2^2))/j cx/j];
B=[0 0;k1/m k2/m;0 0;-k1*l1/j k2*l2/j];
C=[0 0 0 0;0 1 0 0;0 0 0 0;0 0 0 1];
D=[0 0;0 0;0 0;0 0];
% [num,den]=ss2tf(A,B,C,D,3);
% bounce=tf(num(1,:),den);
% pitch=tf(num(3,:),den);
% bode(bounce,pitch);

sim('task9_2')

figure(1)
plot(simout1.Time, simout1.Data(:,1));
hold on;
plot(simout.Time, simout.Data(:,1));
hold on;



%% passive

clear A B C D simout simout1 simout2

A=[0 1 0 0;(-k1-k2)/m (-c1-c2)/m (k1*l1-k2*l2)/m (l1*c1-l2*c2)/m;0 0 0 1;(k1*l1-k2*l2)/j (c1*l1-c2*l2)/j (-k1*(l1^2)-k2*(l2^2))/j (-c1*(l1^2)-c2*(l2^2))/j];
B=[0 0 0 0;k1/m c1/m k2/m c2/m;0 0 0 0;-k1*l1/j -c1*l1/j k2*l2/j c2*l2/j];
C=[0 0 0 0;0 1 0 0;0 0 0 0;0 0 0 1];
D=[0 0 0 0;0 0 0 0;0 0 0 0;0 0 0 0];


sim('task9_2p')


plot(simout.Time, simout.Data(:,1));
hold on;
xlabel('Time(sec)');
ylabel('Amplitude');
legend('Input','Active System','Passive System');

