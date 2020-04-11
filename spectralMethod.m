function [SRM,f] = spectralMethod(dailyRet,aversion,steps)


mu = mean(dailyRet);
sigma = std(dailyRet);



dx=(((steps-1)/steps)-1/steps)/(steps-1);
p=zeros(steps,1); % Empty vector to be filled





w=zeros(steps,1); % Empty vector to be filled
w(1)=dx/2; % Istepsitial trap weight
w(steps)=dx/2; % Fistepsal trap weight   
for i=2:steps-1  % Other trap weights
    w(i)=dx;
end

phi=zeros(steps,1); % Empty vector to be filled
var=zeros(steps,1); % Empty vector to be filled
f=zeros(steps,1); % Empty vector to be filled
for i=1:steps
    p(i)=(1/steps)+(i-1)*dx; 
    phi(i)= aversion*exp(-aversion*(1-p(i)))/(1-exp(-aversion)); % Spectral weights in risk measure 
    var(i)=mu+sigma*norminv(p(i),0,1); % Normal Parametric VaRs
    f(i)=var(i)*phi(i); % f(i), weighted VaR
end

SRM=w'*f; 




end