function [VaR,ES] = tMethod(dailyRet,probability)

mu = mean(dailyRet);
sigma = std(dailyRet);
df = 3;

VaR = -1*(mu-sqrt((df-2)/df) * sigma * tinv(probability,df));

ES = -1*(mu - sigma * (df + tinv(probability,df)^2) / (df-1) * ...
    tpdf(tinv(probability,df),df) / (1-probability));

end


