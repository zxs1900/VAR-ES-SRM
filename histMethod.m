function [VaR,ES] = histMethod(dailyRet,probability)

dailyRet = -dailyRet;
size = length(dailyRet);
position = ceil(size*probability);

dailyRet = sort(dailyRet);

VaR = dailyRet(position);
if position < size
    ES = ((position - size*probability)*dailyRet(position) + sum(dailyRet(position+1:size)))/...
        (size*(1 - probability));
else
    ES = dailyRet(position);
end
end



