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
%eqn 3,4,5 remaining
syms r beta 
q1 = [r*cos(delta1)*(theta1-theta0); r*cos(delta1+beta)*(theta1-theta0); r*cos(delta1+(2*beta))*(theta1-theta0)];
q2 = [r*cos(delta2)*(theta2-theta0); r*cos(delta2+beta)*(theta2-theta0); r*cos(delta2+(2*beta))*(theta2-theta0)];
q3 = [r*cos(delta3)*(theta3-theta0); r*cos(delta3+beta)*(theta3-theta0); r*cos(delta3+(2*beta))*(theta3-theta0)];

syms J1 J2 J3
v1=J1*psid1;   %v1 diff of q1 wrt t
v2=J2*psid2;
v3=J3*psid3;

J = eye(3).*[J1 0 0; 0 J2 0; 0 0 J3];
v = transpose([transpose(v1) transpose(v2) transpose(v3)]);
psid = transpose([transpose(psid1) transpose(psid2) transpose(psid3)]);
v=J.*psid;

syms e psicurrent psidesired eta qcomm
e = psidesired- psicurrent;
syms Kp
qtcomm = J*(psidt+(Kp*e));

et = psidt - (eta*pinv(J)*qtcomm)

L=(1/2)*(transpose(e))*Kp*e;
dV=(1-eta)*transpose(e)*Kp*psid-eta*transpose(e)*Kp*Kp*e;
qtcomm= J*(psid+Kp*e+Kd*et);


