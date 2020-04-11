function[VaR,ES] = mtMethod(dailyRet,probability)


mu=mean(dailyRet);
sigma=std(dailyRet);

df = 3;
size=100000;


mtRet=trnd(df,size,1)*sqrt((df-2)/df)*sigma+mu; % Monte Carlo Simulation based on Student-t distribution

[VaR,ES]=histMethod(mtRet,probability);
end