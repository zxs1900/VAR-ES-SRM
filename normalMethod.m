function [VaR,ES] = normalMethod(dailyRet,probability)

mu = mean(dailyRet);
sigma = std(dailyRet);

VaR = -1 * (mu - sigma * norminv(probability));
ES = -1 * (mu - sigma * normpdf(norminv(probability))./(1-probability));
end