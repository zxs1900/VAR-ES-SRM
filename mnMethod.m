function [VaR,ES] = mnMethod(dailyRet,probability)

mu=mean(dailyRet);
sigma=std(dailyRet);
size=100000; 

mnRet=normrnd(mu,sigma,size,1);


[VaR,ES]=histMethod(mnRet,probability);

end