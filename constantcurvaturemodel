clc
clear all
syms theta0
 
syms l1 l2 l3
syms d phi1 phi2 phi3
b= 2*pi/3;
phi11= -phi1;
phi12= b-phi1;
phi13= 2*b-phi1;
phi21= -phi2;
phi22= b-phi2;
phi23= 2*b-phi2;
phi31= -phi3;
phi32= b-phi3;
phi33= 2*b-phi3;

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
l21= l2-d1*(theta2-theta0);
l22= l2-d2*(theta2-theta0);
l23= l2-d3*(theta2-theta0);
l31= l3-d1*(theta3-theta0);
l32= l3-d2*(theta3-theta0);
l33= l3-d3*(theta3-theta0);

l1= (l11+l12+l13)/3;
l2= (l21+l22+l23)/3;
l3= (l31+l32+l33)/3;

t11= l11-l1;
t12= l12-l1;
t13= l13-l1;
t21= l21-l2;
t22= l22-l2;
t23= l23-l2;
t31= l31-l3;
t32= l32-l3;
t33= l33-l3;

q = [t11, t12, t13, t21, t22, t23, t31, t32, t33];

phi1= atan2(t11*cos(b)-t12, -t11*sin(b))
phi2= atan2(t21*cos(b)-t22, -t21*sin(b))
phi3= atan2(t31*cos(b)-t32, -t31*sin(b))

syms r11 
r1= r11+d1; %same for r12 and r13
