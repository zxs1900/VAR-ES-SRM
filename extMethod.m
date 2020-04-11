function[VaR,ES] = extMethod(dailyRet,probability)

k=1;
n=50;
steps=40;

MinimalRet=zeros(steps,1);

for i=1:steps:(n*steps)
    Trets=dailyRet(i:i+steps-1);
    MinimalRet(k,:)=min(Trets);
    k=k+1;
end

PARMHAT = gevfit(MinimalRet);

VaR = (-PARMHAT(3)*ones(size(probability))+(PARMHAT(2)/PARMHAT(1))*...
    (1-(-log(probability^n)).^PARMHAT(1))); 
ES = VaR / (1 + PARMHAT(1)) + (PARMHAT(2) + PARMHAT(1) * PARMHAT(3)) / ...
    (1 + PARMHAT(1));

end

