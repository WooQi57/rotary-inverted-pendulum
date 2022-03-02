% Copyright 2021 The MathWorks, Inc.
function in = wqresetEnv(in)
    angle = pi+(rand*0.6 - 0.3);
    in = in.setVariable('phi0', angle);
    in = in.setVariable('theta0', 0);
    in = in.setVariable('dtheta0', 0);    
    in = in.setVariable('dphi0', 0);
    
end