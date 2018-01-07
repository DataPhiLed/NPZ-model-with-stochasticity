% A3Q5em: Euler-Maruyama method for Truscott and Brindley.

global R Rm K alpha gamma mu A0; % Global variables also in TruscottPZ3


%R = 0.3;        % /day, eqn 6
Rm = 0.7;       % /day, eqn 6
K = 108.0;      % microg N/l, from eqn 6
alpha = 5.7;    % microg N/l, eqn 6 
gamma = 0.05;   % dimensionless?
mu = 0.012;     % /day, eqn 6
A0 = 0.0000;    % Forcing amplitude

epsilon = 0.2; % 0.01 or 0.1 for Q5 
timestep = 0.001;
tmax = 750;
timelength = int64(tmax/timestep); % the number of time step we will need

for n = 1:5

%initial = rand(1,2)'; % naive IC's used to check. SHOW JON. 
initial = [3.11,3.95]'+rand(1,2)'*2; % slightly random initial conditions
%initial = [4.11,4.95]'; % initial conditions on the fixed point
timevec = 1:timelength;  % vector for times
xmat = zeros(2,timelength); % matrix for populations at corresponding times
xmat(:,1)=initial;

for i=2:timelength
    xmat(:,i) = xmat(:,i-1) + timestep.*A3Q3(1,xmat(:,i-1));  % the Euler step
    xmat(1,i) = xmat(1,i) + epsilon*xmat(1,i)*sqrt(timestep)*randn;  % Maruyama step for Q4
    %xmat(1,i) = xmat(1,i) + epsilon*xmat(1,i)*sqrt(timestep)*randn; % not
    %used
    %xmat(1,i) = xmat(1,i) + epsilon*sqrt(timestep)*randn; % not used
    %(wrong step)
    if xmat(1,i)<0
        xmat(1,i)=0;
        break;
    end
end

%[tcheck,xcheck]=ode45(@LVderivs,[0:timestep:tmax],initial);  % Using ode45 to check
[tcheck,xcheck]=ode45(@A3Q3,[0:timestep:tmax],initial);  % Using ode45 to check

%subplot(1,2,1) %only need subplots if also doing phase portraits
hold on
%axis([0 800 0 6])  % added from A3Q3b.m
plot(double(timevec)*timestep,xmat(1,:),'b');
plot(double(timevec)*timestep,xmat(2,:),'r');
plot(tcheck,xcheck, 'g');

%subplot(1,2,2) %phase portrait makes no sense in these questions. 
%hold on
%plot(xmat(1,:), xmat(2,:));
%plot(xcheck(1,:), xcheck(2,:));

end