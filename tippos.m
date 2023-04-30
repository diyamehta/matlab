function p = tippos(kappa, s, phi)
p= [((kappa*(s^2)*cos(phi)*((kappa)^2*(s)^2-12)))/24; ((kappa*(s)^2*sin(phi))*((kappa)^2*(s)^2-12))/24; (s-(kappa*(s)^3))/6;];
end 
