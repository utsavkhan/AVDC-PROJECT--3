clear all;


m=22000;
j=700000;
c1=40000;
c2=40000;
k1=600000;
k2=600000;
l1=6;
l2=6;
cz=20e4;
cx=20e5;

%%Excitation 

excite=1; %%Impulse
% excite=2; %%sine 1 Hz
% excite=3; %%sine 8 Hz

%% active

A=[0 1 0 0;
    (-k1-k2)/m 0 (k1*l1-k2*l2)/m 0;
    0 0 0 1;
    (k1*l1-k2*l2)/j 0 (-k1*(l1^2)-k2*(l2^2))/j 0];
B=[0 0 0 0;k1/m k2/m 1/m 1/m;0 0 0 0;-k1*l1/j k2*l2/j -l1/j l2/j];
C=eye(4);
D=zeros(4);

sim('task9_2modified')

figure(1)
plot(simout1.Time, simout1.Data(:,1));
hold on;
plot(simout.Time, simout.Data(:,1));
hold on;

figure(2)
plot(simout1.Time, simout1.Data(:,1));
hold on;
plot(simout2.Time, simout2.Data(:,1));
hold on;

%% passive

clear A B C D simout simout1 simout2

A=[0 1 0 0;
    (-k1-k2)/m (-c1-c2)/m (k1*l1-k2*l2)/m (l1*c1-l2*c2)/m;
    0 0 0 1;
    (k1*l1-k2*l2)/j (c1*l1-c2*l2)/j (-k1*(l1^2)-k2*(l2^2))/j (-c1*(l1^2)-c2*(l2^2))/j];
B=[0 0 0 0;
    k1/m c1/m k2/m c2/m;
    0 0 0 0;
    -k1*l1/j -c1*l1/j k2*l2/j c2*l2/j];
C=[1 0 0 0;0 1 0 0;0 0 1 0;0 0 0 1];
D=[0 0 0 0;0 0 0 0;0 0 0 0;0 0 0 0];


sim('task9_2p')

figure(1)
plot(simout.Time, simout.Data(:,1));
hold on;
xlabel('Time(sec)');
ylabel('Amplitude');
legend('Input','Active System','Passive System');

figure(2)
plot(simout2.Time, simout2.Data(:,1));
hold on;