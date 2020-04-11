
function [VaR,ES] = ageMethod(dailyRet,Lambda,probability)




dailyRet = flip(dailyRet);
dataSize = length(dailyRet);
w = zeros(dataSize,1);

for i = 1:dataSize
    w(i) = ((Lambda^(i-1))*(1-Lambda))/(1-Lambda^dataSize);    
end


v = sortrows([dailyRet,w],1);
v = [v,cumsum(v(:,2))];

r = find(v(:,3)==1-probability);


if r~=0
    VaR = -1*(v(r,1));
    
    
elseif v(1,3) < (1-probability)
   upperLim = find((v(:,3)-(1-probability)) > 0, 1);
   lowerLim = upperLim-1;
   
   uppperloss = v(upperLim,1);
   lowerloss = v(lowerLim,1);
   
    m = (v(upperLim,3)-(1-probability))/(v(upperLim,3)-v(lowerLim,3));

    VaR = -1*(m*lowerloss + (1-m)*uppperloss); 
else
    VaR = -1*(v(1,1));
end
    

ES = -1*mean(dailyRet([find(dailyRet<-VaR)]));

end

