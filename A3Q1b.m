% Truscott_POE
% code adapted from POE.m in Week 3
clear all;
clf;

global R Rm K alpha gamma mu ; % Global variables from eqn (6) listed in both files

R = 0.3;        % /day, eqn 6
Rm = 0.7;       % /day, eqn 6
K = 108.0;      % microg N/l, from eqn 6
alpha = 5.7;    % microg N/l, eqn 6 
gamma = 0.05;   % dimensionless?
mu = 0.012;     % /day, eqn 6


for n = 1:50
% ystart=rand(1,2)*1; % random initial values
ystart=[3.11,3.95]+rand(1,2)*5.0; % random initial values
% ystart=rand(1,4)*1; % random initial values
[t,y]=ode45(@A3Q1,[0:1000],ystart);
%subplot(1,2,1)
hold on
axis([1 300 0 0.2*K])  % note this was 0.1*K
title('Time series')
xlabel('t')
ylabel('Populations')
plot(t(1:300),y(1:300,1),'b'); %y(1) is plankton, blue
plot(t(1:300),y(1:300,2),'r'); %y(2) is zooplankton, red

%subplot(1,2,2)
%hold on
%axis([0 K 0 K])
%title('Phase plane')
%xlabel('x')
%ylabel('y')
%plot(y(800:1000,1),y(800:1000,2));
end
