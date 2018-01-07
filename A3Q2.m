clear all;


t = linspace(0,365,366);
% t = linspace(0,1000,1001);

Rforcing = 0.3 -0.1*cos(2*pi*t/365);   % forcing R bloom at 0.2 (for
% question 2)
DRDT = 0.2*pi*sin(2*pi*t/365)/365 % derivative for subplot
Rfinal = DRDT ./ Rforcing; % the thing you wanted us to plot



figure

subplot(2,1,1);
plot(t, Rforcing);
title('$r(t) = 0.3 -0.1 \cos (\frac{2 \pi t}{365})$','interpreter', 'latex');
xlabel('t')
ylabel('r(t)')

subplot(2,1,2);
plot(t, Rfinal);
title('$R(t) = \frac{1}{r(t)} \frac{dr}{dt}$','interpreter','latex');
xlabel('t')
ylabel('R(t)')


