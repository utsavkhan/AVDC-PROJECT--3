clear all;

%% active SS

m=22000;
j=700000;
c1=40000;
c2=40000;
k1=600000;
k2=600000;
l1=6;
l2=6;
cz=1;
cx=1;

A=[0 1 0 0;(-k1-k2)/m -cz/m (k1*l1-k2*l2)/m 0;0 0 0 1;(k1*l1-k2*l2)/j 0 (-k1*(l1^2)-k2*(l2^2))/j cx/j];
B=[0 0;k1/m k2/m;0 0;-k1*l1/j -k2*l2/j];
C=[0 1 0 0;0 0 0 1];
D=[0 0;0 0];
% [num,den]=ss2tf(A,B,C,D,3);
% bounce=tf(num(1,:),den);
% pitch=tf(num(3,:),den);
% bode(bounce,pitch);

Ap=[0 1 0 0;(-k1-k2)/m -cz/m (k1*l1-k2*l2)/m 0;0 0 0 1;(k1*l1-k2*l2)/j 0 (-k1*(l1^2)-k2*(l2^2))/j cx/j];
Bp=[0 0 0 0;k1/m k2/m 1/m 1/m;0 0 0 0;-k1*l1/j -k2*l2/j -l1/j -l2/j];
Cp=[0 1 0 0;0 0 0 1];
Dp=[0 0 0 0;0 0 0 0];

sim('task9_2')

sim('task9_2p')

figure(1)
plot(simout.Time, simout.Data(:,1));
hold on;
% end
plot(simout1.Time, simout1.Data(:,1));
hold on;
xlabel('Time(sec)');
ylabel('Amplitude');
legend('Output','Input');

figure(2)
plot(simout2.Time, simout2.Data(:,1));
hold on;
% end
plot(simout1.Time, simout1.Data(:,1));
hold on;
xlabel('Time(sec)');
ylabel('Amplitude');
legend('Output','Input');

