function delta = curvature(Q,s) %delta=kappa in demonstration paper, eqn 19
    %for i=1:6
    angle=(1-2*(((Q(2)^2)+(Q(3)^2))))
    delta = acos(angle)/s; 
    %end 
    end 