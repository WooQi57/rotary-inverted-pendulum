function v = fcn(input)
theta=input(1);
alpha=input(2);
dtheta=input(3);
dalpha=input(4);

%% Convert Angles to radians
% theta=theta*(pi/180);
% dtheta=dtheta*(pi/180);
% alpha=alpha*(pi/180);
% dalpha=dalpha*(pi/180);

%% Model Parameters
% kt=0.02797;
% km=0.02797;
% rm=3.3;
% L=0.153;
% r=0.08260;
% jeq=1.23*10^-4+0.00011;
% m=0.027;
% beq=0.0015;
Mp=0.1270;
Lr=0.2159;
Lp=0.3365;
Dp=0.0024;
Dr=0.0024;
Jp=0.0012;
g=9.8100;
eta_g=0.9000;
eta_m =0.6900;
Kg =70;
kt=0.0077;
Rm =2.6000;
km =0.0077;

%% Tuning Parameters
k=0.2;
lambda1=0.5;
lambda2=0.01;
lambda3=2;
phi=0.5;

%k=3;
%lambda1=0.5;
%lambda2=0.01;
%lambda3=10;
%phi=0.3;

%% Model

f2=81.4033*alpha-45.8259*dtheta-0.9319*dalpha;
g2=83.4659;
f1=122.0545*alpha-44.0966*dtheta-1.3972*dalpha;
g1=80.3162;

% a=jeq+m*r*r;
% b=m*L*r;
% c=4*m*L*L/3;
% d=m*9.81*L;
% g=(kt*km+beq*rm)/rm;
% f1=(-(b^2/2)*sin(2*alpha)*dalpha^2 - g*b*dtheta*cos(alpha) + a*d*sin(alpha))/(a*c-b^2*(cos(alpha))^2);
% g1=kt*b*cos(alpha)/(rm*(a*c-b^2*(cos(alpha))^2));
% f2=(c*f1-d*sin(alpha))/(b*cos(alpha));
% g2=kt*c/(rm*(a*c-b^2*(cos(alpha))^2));

%% Manifolds and Lyapunov Function
s1 = dalpha + lambda1*alpha;
s2 = dtheta + lambda3*theta;
v = abs(s1) + lambda2*abs(s2);

%% Saturation
if(phi<abs(v))
    out=v/phi;
else
    out=sign(v);
end

%% Output Voltage
v = (-k*out-(lambda1*dalpha+f1)*sign(s1)-lambda2*(lambda3*dtheta+f2)*sign(s2))/(g1*sign(s1)+lambda2*g2*sign(s2));

