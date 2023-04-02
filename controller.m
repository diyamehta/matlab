clc
clear all
syms theta1 theta2 theta3 
syms delta1 delta2 delta3 t
syms L1 L2 L3
theta0 = pi/2;

prompt = 'Bending angle and angle characterizing the plane in which the segment bends: ';

psi1 = transpose ([theta1, delta1]);
psi2 = transpose ([theta2, delta2]);
psi3 = transpose ([theta3, delta3]);
psid1 = diff(psi1,t);
psid2 = diff(psi2,t);
psid3 = diff(psi3,t);

psi = transpose ([psi1,psi2,psi3])
p1 = ((L1)*[cos(delta1)*(sin(theta1)-1); (-sin(delta1)*(sin(theta1)-1)); -cos(theta1)])/(theta1-theta0)
p2 = ((L2)*[cos(delta2)*(sin(theta2)-1); (-sin(delta2)*(sin(theta2)-1)); -cos(theta2)])/(theta2-theta0)
p3 = ((L3)*[cos(delta3)*(sin(theta3)-1); (-sin(delta3)*(sin(theta3)-1)); -cos(theta3)])/(theta3-theta0)

%rotation matrix eqn3 in configuration paper
%define g,p,e,g

syms c1 c2 c3 e1 e2 e3 g1 g2 g3 

p1= exp(-delta1*skewdec(c1));
p2= exp((theta0-theta2)*skewdec(c2));
p3= exp(delta3*skewdec(c3));

G1=p1*e1*g1;
G2=p2*e2*g2;
G3=p3*e3*g3;

%with respect to robot's base
syms pg pg1 G1 
for k=2:3:1
pg1(k) = pg1(k-1) + G1(k-1)*pg(k);
G1(k) = G1(k-1)*G(k);
end 

syms r beta 
q1 = [r*cos(delta1)*(theta1-theta0); r*cos(delta1+beta)*(theta1-theta0); r*cos(delta1+(2*beta))*(theta1-theta0)];
q2 = [r*cos(delta2)*(theta2-theta0); r*cos(delta2+beta)*(theta2-theta0); r*cos(delta2+(2*beta))*(theta2-theta0)];
q3 = [r*cos(delta3)*(theta3-theta0); r*cos(delta3+beta)*(theta3-theta0); r*cos(delta3+(2*beta))*(theta3-theta0)];

syms phi1 phi2 phi3

J1 = G1*[-sin(delta1) cos(delta1)*sin(phi1); -cos(delta1) -sin(delta1)*sin(phi1); 0 cos(phi1)-1];
J2 = G2*[-sin(delta2) cos(delta2)*sin(phi2); -cos(delta2) -sin(delta2)*sin(phi2); 0 cos(phi2)-1];
J3 = G3*[-sin(delta3) cos(delta3)*sin(phi3); -cos(delta3) -sin(delta3)*sin(phi3); 0 cos(phi3)-1];

v1=J1*psid1;   %v1 diff of q1 wrt t
v2=J2*psid2;
v3=J3*psid3;

J = [eye(3,2), zeros(3,2), zeros(3,2); eye(3,2) eye(3,2) zeros(3,2); eye(3,2) eye(3,2) eye(3,2)].*[J1 zeros(3,2) zeros(3,2); zeros(3,2) J2 zeros(3,2); zeros(3,2) zeros(3,2) J3];

psid = transpose([transpose(psid1) transpose(psid2) transpose(psid3)]);

syms psicurrent psidesired eta qcomm psidt Kd
e = psidesired- psicurrent;
syms Kp
qtcomm = J*(psidt+(Kp*e));

et = psidt - (eta*pinv(J)*qtcomm);

L=(1/2)*(transpose(e))*Kp*e;
dV=(1-eta)*transpose(e)*Kp*psid-eta*transpose(e)*Kp*Kp*e;
qtcomm= J*(psid+Kp*e+Kd*et);


