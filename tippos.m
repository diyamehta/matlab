function p = tippos(delta, s, phi)
p(1)= ((delta*(s^2)*cos(phi)*((delta)^2*(s)^2-12)))/24; 
p(2)= ((delta*(s)^2*sin(phi))*((delta)^2*(s)^2-12))/24;
p(3)= (s-(delta*(s)^3))/6;
end 
