function  [VaR,ES,volRet] = volMethod(dailyRet,Lambda,sampleSize,probability)


dataSize = length(dailyRet);
sigma = zeros(dataSize-sampleSize,1);
interval = zeros(sampleSize,1);

for i = (sampleSize+1):dataSize
    for j = 1:sampleSize
    interval(j) = ((Lambda^(j-1) * dailyRet(i+1-j).^2));
    
    end
    interval = sum(interval);
    sigma(i-sampleSize,:) = sqrt((1-Lambda)*interval);
end
    

volRet = dailyRet(sampleSize+2:dataSize).*(sigma(end)./sigma(1:end-1));


[VaR,ES] = histMethod(volRet,probability);
end

