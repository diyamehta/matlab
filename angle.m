function theta = angle(Q) %eqn 19
        theta = atan((Q(2)*Q(1)+Q(3)*Q(4))/(Q(2)*Q(4)-Q(3)*Q(1)));
end 
