function[VaR,ES] = cornMethod(dailyRet,probability)


mu=mean(dailyRet);
sigma=std(dailyRet);
skew = skewness(dailyRet);
kurt = kurtosis(dailyRet)+3;

z=-1*norminv(probability,0,1); 

VaR=-1*(mu+(z+(1/6)*(z^2-1)*skew+(1/24)*(z^3-3*z)*(kurt-3)-(1/36)*...
    (2*z^3-5*z)*skew^2)*sigma);


v = normpdf(-z,0,1)./(1-probability).* (1-(kurt-3)/24-skew^2/4+skew/6*(-z)...
    + ((kurt-3)/24-skew^2/18)*(-z).^2) - skew/6;
ES = mu + sigma * v;

end
  