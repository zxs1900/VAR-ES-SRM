function myplot = rollingMethod(investment,price,TestWindowStart,Lambda,probability)


dailyRet = tick2ret(price(:,2),'Method','Continuous')*investment;
dataSize = length(dailyRet);
date = price(2:end,1);
date = x2mdate(date,0,'datetime');


TestWindow= TestWindowStart:dataSize;
EstimationWindowSize = 252;



Zscore= norminv(probability);
Normal = zeros(length(TestWindow),1);


for t = TestWindow
    i = t - TestWindowStart + 1;
    EstimationWindow = t-EstimationWindowSize:t-1;
    Sigma = std(dailyRet(EstimationWindow));
    Normal(i) = -Zscore*Sigma;
end


Historical = zeros(length(TestWindow),1);


for t = TestWindow
    i = t - TestWindowStart + 1;
    EstimationWindow = t-EstimationWindowSize:t-1;
    X = dailyRet(EstimationWindow);
    Historical(i) = -quantile(X,probability);

end




Sigma2     = zeros(length(dailyRet),1);
Sigma2(1)  = dailyRet(1)^2;

for i = 2 : (TestWindowStart-1)
    Sigma2(i) = (1-Lambda) * dailyRet(i-1)^2 + Lambda * Sigma2(i-1);
end

EWMA = zeros(length(TestWindow),1);


for t = TestWindow
    k     = t - TestWindowStart + 1;
    Sigma2(t) = (1-Lambda) * dailyRet(t-1)^2 + Lambda * Sigma2(t-1);
    Sigma = sqrt(Sigma2(t));
    EWMA(k) = -Zscore*Sigma;

end



ReturnsTest = dailyRet(TestWindow);
DatesTest   = date(TestWindow);
mytitle = sprintf('Comparison of returns and VaR at %d percent for different models',probability*100);

myplot = plot(DatesTest,[ReturnsTest -Normal -Historical -EWMA])
hold on;
ylabel('VaR')
xlabel('Date')
legend({'Returns','Normal','Historical','EWMA'},'Location','Best')
title(mytitle)
hold off;

end





