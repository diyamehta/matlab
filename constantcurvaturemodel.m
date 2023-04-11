clc
clear all
syms theta0
 
syms l1 
syms d phi1 phi2 phi3
b= 2*pi/3;
phi11= -phi1;
phi12= b-phi1;
phi13= 2*b-phi1;

d1= d*cos(phi11);
d2= d*cos(phi12);
d3= d*cos(phi13);

syms t11 t12 t13
theta1= -t11/d1; 
theta2=-t12/d2;
theta3= -t13/d3;

l11= l1-d1*(theta1-theta0);
l12= l1-d2*(theta1-theta0);
l13= l1-d3*(theta1-theta0);

l1= (l11+l12+l13)/3;

t11= l11-l1;
t12= l12-l1;
t13= l13-l1;

q = [t11, t12, t13];

phi1= atan2(t11*cos(b)-t12, -t11*sin(b))
k1= -t11/(d1*l1)
k2= -t12/(d2*l1)
k3= -t13/(d3*l1)
syms r11 
r1= r11+d1
r2= r12+d2
r3= r13+d3
