
% Truscott_POE
% code adapted from POE.m in Week 3
clear all;
clf;

global R Rm K alpha gamma A0 mu ; % Global variables from eqn (6) listed in both files

R = 0.3;        % /day, eqn 6
Rm = 0.7;       % /day, eqn 6
K = 108.0;      % microg N/l, from eqn 6
alpha = 5.7;    % microg N/l, eqn 6 
gamma = 0.05;   % dimensionless?
A0 = 0.0000;    % periodic forcing (switched off if A0=0.0000)
%mu = 0.012;     % /day, eqn 6


for n = 1:3

days=0;
mu = 0.012; % reminder of mu on day 0
%ystart=[2.11,3.95] +rand(1,2)*2; % random initial value
ystart=[4.11,4.95] %always start at the same point (near the fixed point)


while days < 200 
    hold on
    disp(ystart);
    [t,y]=ode45(@A3Q3,[days:0.1:days+1],ystart); %evaluates current day
    %disp(ystart);
    %disp (y(end,:));
        
    axis([0 200 0 1.1*K])     %Plots current day (question 4(b))
    plot (t,y(:,1), 'b');
    plot (t,y(:,2), 'r');
   
%     axis ([0 20 0.00 0.040])    %Question 4 part(a)
%     plot (t,mu, 'bx');          %Plots for mu

    days = days+1; %starts new day
    ystart = y(end,:); %sets start values for new day
    
    mu = mu + 0.004*(sign(rand(1)-0.5)); %changes mu for new day
    
    if  mu < 0.008
        mu = 0.008;             % lower limit for mu
    end    
    if  mu > 0.032
        mu = 0.032;             % upper limit for mu
    end
    
    disp(mu); %prints value of mu to command window for tracking
    
    
   
end % ends while loop plotting ODEs 

end % ends for loop plotting n simulations (n currently set to 3)
