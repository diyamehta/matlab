function kappa= curvature(Q,h) %delta=kappa in demonstration paper, eqn 19
    %for i=1:6
    anglel = (1-2*(((Q(2)^2)+(Q(3)^2))));
    kappa = acos(anglel)/h;
    %end 
    end 
