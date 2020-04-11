
function [result,obs_freq_of_failures,conf_int_for_freq_of_failures] = kupicTest(dailyRet,VaR,probability)

%% Kupiec Backtest

n=length(dailyRet);              % Number of observations
p=1-probability;                       % Probability of an exceedance each observation occurs
tail_losses=-dailyRet(-dailyRet>VaR);
x=length(tail_losses);          % Number of exceedances
probability_model_is_correct=1-binocdf(x,n,1-probability);    % If this is greater than the p value then accept otherwise reject.
[obs_freq_of_failures,conf_int_for_freq_of_failures]=binofit(x,n,1-probability);

 if probability_model_is_correct > p
   result = "Accept";
 else
   result = "Reject"; 
 end
end