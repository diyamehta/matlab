function T = transition(phi, kappa, s)
T = [cos(phi)*cos(phi)*(cos(kappa*s)-1)+1, sin(phi)*cos(phi)*(cos(kappa*s)-1), -cos(phi)*sin(kappa*s), (cos(phi)*(cos(kappa*s)-1))/kappa; sin(phi)*cos(phi)*(cos(kappa*s)-1), cos(phi)*cos(phi)*(1-cos(kappa*s))+cos(kappa*s), -sin(phi)*sin(kappa*s), (sin(phi)*(cos(kappa*s)-1))/kappa; cos(phi)*sin(kappa*s), sin(phi)*sin(kappa*s), cos(kappa*s), (sin(kappa*s))/kappa; 0, 0, 0, 1];
end 
