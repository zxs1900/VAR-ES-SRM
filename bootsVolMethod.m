function [AgeVol_VaR] = bootsVolMethod(Returns,lambda_vol,sample,P,cl,lambda,n,m,CI)

[vol_var,VolWRet] = volweightedVaR(Returns,lambda_vol,sample,P,cl);
[AgeVol_VaR,~] = bootstrapVaR(VolWRet,n,m,CI,P,cl);

end