function phi = bendangle(Q)
phi = atan((Q(2)*Q(1)+Q(3)*Q(4))/(Q(2)*Q(4)-Q(3)*Q(1)));
end