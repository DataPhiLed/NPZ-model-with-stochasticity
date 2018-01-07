% Truscott_POE
% code adapted from POE.m in Week 3
clear all;
clf;

global R Rm K alpha gamma mu A0; % Global variables from eqn (6) listed in both files

%R = 0.3;        % /day, eqn 6 %not used in Q2
Rm = 0.7;       % /day, eqn 6
K = 108.0;      % microg N/l, from eqn 6
alpha = 5.7;    % microg N/l, eqn 6 
gamma = 0.05;   % dimensionless?
mu = 0.012;     % /day, eqn 6
A0 = 0.1000;    % forcing aplitude, originally set at 0.1


for n = 1:50    
ystart=[3.11,3.95]+rand(1,2)*2; % random initial values
%ystart=[2.11,2.95]+rand(1,2)*4; % random initial values

[t,y]=ode45(@A3Q3,[0:1800],ystart);
%subplot(4,1,1)
hold on
axis([100 1800 0 0.4*K])  % note this was 0.1*K
title('Time series')
xlabel('t')
ylabel('Populations')
plot(t(100:1800),y(100:1800,1),'b'); %y(1) is plankton, blue
plot(t(100:1800),y(100:1800,2),'r'); %y(2) is zooplankton, red

end
