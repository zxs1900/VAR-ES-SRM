function myplot = EWMAMethod(investment,price,TestWindowStart)


Lambda = 0.94;
dailyRet = tick2ret(price(:,2),'Method','Continuous')*investment;
dataSize = length(dailyRet);
date = price(2:end,1);
date = x2mdate(date,0,'datetime');

TestWindow = TestWindowStart:dataSize;

Lambda = 0.94;
Sigma2     = zeros(length(dailyRet),1);
Sigma2(1)  = dailyRet(1)^2;

for i = 2 : (TestWindowStart-1)
    Sigma2(i) = (1-Lambda) * dailyRet(i-1)^2 + Lambda * Sigma2(i-1);
end

Zscore = norminv([0.05 0.01]);
EWMA95 = zeros(length(TestWindow),1);
EWMA99 = zeros(length(TestWindow),1);

for t = TestWindow
    k     = t - TestWindowStart + 1;
    Sigma2(t) = (1-Lambda) * dailyRet(t-1)^2 + Lambda * Sigma2(t-1);
    Sigma = sqrt(Sigma2(t));
    EWMA95(k) = -Zscore(1)*Sigma;
    EWMA99(k) = -Zscore(2)*Sigma;
end

myplot = plot(date(TestWindow),[EWMA95 EWMA99]);
hold on;
ylabel('VaR')
xlabel('Date')
legend({'95% Confidence Level','99% Confidence Level'},'Location','Best')
title('VaR Estimation Using the EWMA Method')
hold off;
