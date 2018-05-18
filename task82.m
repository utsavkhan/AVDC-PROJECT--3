clear all;
m=22000;
j=700000;
c1=0;%40000;
c2=0;%40000;
k1=600000;
k2=600000;
l1=6;
l2=6;

A=[0 1 0 0;(-k1-k2)/m (-c1-c2)/m (k1*l1-k2*l2)/m (l1*c1-l2*c2)/m;0 0 0 1;(k1*l1-k2*l2)/j (c1*l1-c2*l2)/j (-k1*(l1^2)-k2*(l2^2))/j (-c1*(l1^2)-c2*(l2^2))/j];
B=[0 0 0 0;k1/m c1/m k2/m c2/m;0 0 0 0;-k1*l1/j -c1*l1/j k2*l2/j c2*l2/j];
C=[1 0 0 0;0 0 0 0;0 0 1 0;0 0 0 0];
D=[0 0 0 0;0 0 0 0;0 0 0 0;0 0 0 0];
% [num,den]=ss2tf(A,B,C,D,3);
% bounce=tf(num(1,:),den);
% pitch=tf(num(3,:),den);
% bode(bounce,pitch);

sim('task82')

figure(1)
plot(simout.Time, simout.Data(:,1));
hold on;
% end
plot(simout1.Time, simout1.Data(:,1));
hold on;

