
function [Bootstrap_VaR, ConfidenceInterval,ES,ConfidenceInterval_ES] = bootsMethod(dailyRet,trials,CI,P,cl)


for i = 1:trials
    Boot_Ret = datasample(dailyRet,1);
    [VaR,ES] = historicalVaR(Boot_Ret,P,cl);
    Boot_VaR(i) = VaR;
    Boot_ES(i) = ES;
end


Bootstrap_VaR = mean(Boot_VaR);
Bootstrap_VaR = nanmean(Boot_ES);


SEM = std(Boot_VaR)/sqrt(length(Boot_VaR));               
ts = tinv([(1-CI)/2,CI + (1-CI)/2 ],length(Boot_VaR)-1);      
ConfidenceInterval = mean(Boot_VaR) + ts*SEM;

SEM1 = std(Boot_ES)/sqrt(length(Boot_ES));               
ts1 = tinv([(1-CI)/2,CI + (1-CI)/2 ],length(Boot_ES)-1);      
ConfidenceInterval_ES = mean(Boot_ES) + ts1*SEM1; 






nTrials = 20000;                  % # of independent random trials
horizon = 1;                     % VaR forecast horizon
T = size(Returns,1);
bootstrappedReturns = Returns(unidrnd(T, horizon, nTrials));

hp=1;
P=10000000; 
 
mu=mean(bootstrappedReturns);
sigma=std(bootstrappedReturns);
var = (-mu*hp'-sigma*sqrt(hp')*norminv(1-cl,0,1))*P;


end