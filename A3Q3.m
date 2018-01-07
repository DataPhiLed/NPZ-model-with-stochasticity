% Periodic forcing of the NPZ system.
function F = A3Q3(t,y)
% y will be a vector holding the x and y populations, t is time
% y(1) is P, y(2) is Z

global R Rm K alpha gamma mu A0; % Global variables form equation 6 listed in both files. 

%R = 0.3;       % /day, eqn 6, not used after Q1
Rm = 0.7;       % /day, eqn 6
K = 108.0;      % microg N/l, from eqn 6
alpha = 5.7;    % microg N/l, eqn 6 
gamma = 0.05;   % dimensionless?
%mu = 0.012;     % /day, eqn 6
%A0 = 0.0000;    % Amplitude of periodic forcing (If A0=0, no forcing, R constant) 


% kforce=k*(1+amp*sin(2*pi*t/omega));  % K forcing (from practicals/GP)
Rforce = 0.3 - A0*cos(2*pi*t/365);   % R Forcing (see q2) 


Holling3 = Rm*y(2)*y(1)^2/(alpha*alpha+y(1)^2); % Define holling fn separately for convenience
dydt = gamma*(Holling3) -mu*y(2); % Equation3
dxdt = Rforce*y(1)*(1-((y(1)/K))) -Holling3; % Equation 2 forcing R for Q2


F = [dxdt; dydt];
% F = [dxdt; dydt; Holling3; Rforce];

end