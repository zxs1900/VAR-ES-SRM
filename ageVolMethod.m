function [VaR,ES] = ageVolMethod(dailyRet,Lambda,sampleSize,probability)

[~,~,volRet] = volMethod(dailyRet,Lambda,sampleSize,probability);
[VaR,ES] = ageMethod(volRet,Lambda,probability);

end