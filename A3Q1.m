% TruscottPZ3
function F = A3Q1(t,y)
% y will be a vector holding the x and y populations, t is time
% y(1) is P, y(2) is Z

global R Rm K alpha gamma mu ; % Global variables form equation 6 listed in both files. 

R = 0.3;        % /day, eqn 6
Rm = 0.7;       % /day, eqn 6
K = 108.0;      % microg N/l, from eqn 6
alpha = 5.7;    % microg N/l, eqn 6 
gamma = 0.05;   % dimensionless?
mu = 0.012;     % /day, eqn 6


% kforce=k*(1+amp*sin(2*pi*t/omega));   % forcing K (never asked for, just
% curious)
% Rforce= 0.03 -0.02*cos(2*pi*t/365);   % forcing R bloom at 0.2 (for
% question 2)


Holling3 = Rm*y(2)*y(1)^2/(alpha*alpha+y(1)^2); % Define holling fn separately for convenience
dydt = gamma*(Holling3) -mu*y(2); % Equation3
dxdt = R*y(1)*(1-((y(1)/K))) -Holling3; % Equation 2 no forcing
% dxdt = Rforce*y(1)*(1-((y(1)/K))) -Holling3; % Equation 2 forcing R

F = [dxdt; dydt];
%F = [dxdt; dydt; Holling3; Rforce];
end