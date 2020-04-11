clc;
clear all;
close all;


%%
%parameters
W = 10; %million
compA = xlsread('JNJ.xlsx',1);
compB = xlsread('JNJ.xlsx',2);
dailyRetA = tick2ret(compA(:,2),'Method','Continuous')*W;
dailyRetB = tick2ret(compB(:,2),'Method','Continuous')*W;
%%
%companyA
for i = 1:99
    j = i/100;

norm_VaR_A(i) = normalMethod(dailyRetA,j); %normal distribution
t_VaR_A(i) = tMethod(dailyRetA,j); % ti distribution
corn_VaR_A(i) = cornMethod(dailyRetA,j); % cornish fisher
ext_VaR_A(i) = extMethod(dailyRetA,j); % extreme value
mn_VaR_A(i) = mnMethod(dailyRetA,j);%monte carlo historical
mt_VaR_A(i) = mtMethod(dailyRetA,j);%monte carlo t
hist_VaR_A(i) = histMethod(dailyRetA,j);
age_VaR_A(i) = ageMethod(dailyRetA,0.94,j);
vol_VaR_A(i) = volMethod(dailyRetA,0.94,252,j);
ageVol_VaR_A(i) = ageVolMethod(dailyRetA,0.94,252,j);

end

%%
plot((1:99)/100,[norm_VaR_A;t_VaR_A;corn_VaR_A;ext_VaR_A;mn_VaR_A;mt_VaR_A]);
hold on;
xlabel('confidence level');
ylabel('VaR');
title('Comparison of different parametric VaR measures for Johnson&Johnson');
legend({'normal','student t','cornish','extreme','monte normal','monte t'})
hold off;
%%
plot((1:99)/100,[hist_VaR_A;age_VaR_A;vol_VaR_A;ageVol_VaR_A]);
hold on;
xlabel('confidence level');
ylabel('VaR');
title('Comparison of different non parametric VaR measures for Johnson&Johnson');
legend({'Historical','Age weighted','Volatility weighted',...
    'Age-Volatility weighted'})
hold off;

%%

%companyB

for i = 1:99
    j = i/100;
norm_VaR_B(i) = normalMethod(dailyRetB,j); %normal distribution
t_VaR_B(i) = tMethod(dailyRetB,j); % ti distribution
corn_VaR_B(i) = cornMethod(dailyRetB,j); % cornish fisher
ext_VaR_B(i) = extMethod(dailyRetB,j);% extreme value
mn_VaR_B(i) = mnMethod(dailyRetB,j);%monte carlo normal
mt_VaR_B(i) = mtMethod(dailyRetB,j);%monte carlo t 
hist_VaR_B(i) = histMethod(dailyRetB,j);
age_VaR_B(i) = ageMethod(dailyRetB,0.94,j);
vol_VaR_B(i) = volMethod(dailyRetB,0.94,252,j);
ageVol_VaR_B(i) = ageVolMethod(dailyRetB,0.94,252,j);

end
%%
plot((1:99)/100,[norm_VaR_B;t_VaR_B;corn_VaR_B;ext_VaR_B;mn_VaR_B;mt_VaR_B]);
hold on;
xlabel('confidence level');
ylabel('VaR');
title('Comparison of different parametric VaR measures for Allergan');
legend({'Normal distribution','Student t distribution','Cornish Fisher',...
    'Extreme value','Monte Carlo Normal','Monte Carlo Student t'})
hold off;
%%
plot((1:99)/100,[hist_VaR_B;age_VaR_B;vol_VaR_B;ageVol_VaR_B]);
hold on;
xlabel('confidence level');
ylabel('VaR');
title('Comparison of different non parametric VaR measures for Allergan');
legend({'Historical','Age weighted','Volatility weighted',...
    'Age-Volatility weighted'})
hold off;


%%
%normal distribution
[norm_VaR_A95,norm_ES_A95] = normalMethod(dailyRetA,0.95);
[norm_VaR_A99,norm_ES_A99] = normalMethod(dailyRetA,0.99);

[norm_VaR_B95,norm_ES_B95] = normalMethod(dailyRetB,0.95);
[norm_VaR_B99,norm_ES_B99] = normalMethod(dailyRetB,0.99);


%%
%t distribution
[t_VaR_A95,t_ES_A95] = tMethod(dailyRetA,0.95);
[t_VaR_A99,t_ES_A99] = tMethod(dailyRetA,0.99);

[t_VaR_B95,t_ES_B95] = tMethod(dailyRetB,0.95);
[t_VaR_B99,t_ES_B99] = tMethod(dailyRetB,0.99);

%%
%historical
[hist_VaR_A95,hist_ES_A95] = histMethod(dailyRetA,0.95);
[hist_VaR_A99,hist_ES_A99] = histMethod(dailyRetA,0.99);

[hist_VaR_B95,hist_ES_B95] = histMethod(dailyRetB,0.95);
[hist_VaR_B99,hist_ES_B99] = histMethod(dailyRetB,0.99);

%%
%cornish
[corn_VaR_A95,corn_ES_A95] = cornMethod(dailyRetA,0.95);
[corn_VaR_A99,corn_ES_A99] = cornMethod(dailyRetA,0.99);

[corn_VaR_B95,corn_ES_B95] = cornMethod(dailyRetB,0.95);
[corn_VaR_B99,corn_ES_B99] = cornMethod(dailyRetB,0.99);

%%
%extreme
[ext_VaR_A95,ext_ES_A95] = extMethod(dailyRetA,0.95);
[ext_VaR_A99,ext_ES_A99] = extMethod(dailyRetA,0.99);

[ext_VaR_B95,ext_ES_B95] = extMethod(dailyRetB,0.95);
[ext_VaR_B99,ext_ES_B99] = extMethod(dailyRetB,0.99);


%monte normal
[mn_VaR_A95,mn_ES_A95] = mnMethod(dailyRetA,0.95);
[mn_VaR_A99,mn_ES_A99] = mnMethod(dailyRetA,0.99);

[mn_VaR_B95,mn_ES_B95] = mnMethod(dailyRetB,0.95);
[mn_VaR_B99,mn_ES_B99] = mnMethod(dailyRetB,0.99);


%monte t 
[mt_VaR_A95,mt_ES_A95] = mtMethod(dailyRetA,0.95);
[mt_VaR_A99,mt_ES_A99] = mtMethod(dailyRetA,0.99);

[mt_VaR_B95,mt_ES_B95] = mtMethod(dailyRetB,0.95);
[mt_VaR_B99,mt_ES_B99] = mtMethod(dailyRetB,0.99);


% volatility weighted
[vol_VaR_A95,vol_ES_A95] = volMethod(dailyRetA,0.94,252,0.95);
[vol_VaR_A99,vol_ES_A99] = volMethod(dailyRetA,0.94,252,0.99);
[vol_VaR_B95,vol_ES_B95] = volMethod(dailyRetB,0.94,252,0.95);
[vol_VaR_B99,vol_ES_B99] = volMethod(dailyRetB,0.94,252,0.99);


%age weighted
[age_VaR_A95,age_ES_A95] = ageMethod(dailyRetA,0.94,0.95);
[age_VaR_A99,age_ES_A99] = ageMethod(dailyRetA,0.94,0.99);
[age_VaR_B95,age_ES_B95] = ageMethod(dailyRetB,0.94,0.95);
[age_VaR_B99,age_ES_B99] = ageMethod(dailyRetB,0.94,0.99);

%age volatility weighted

[ageVol_VaR_A95,ageVol_ES_A95] = ageVolMethod(dailyRetA,0.94,252,0.95);
[ageVol_VaR_A99,ageVol_ES_A99] = ageVolMethod(dailyRetA,0.94,252,0.99);
[ageVol_VaR_B95,ageVol_ES_B95] = ageVolMethod(dailyRetB,0.94,252,0.95);
[ageVol_VaR_B99,ageVol_ES_B99] = ageVolMethod(dailyRetB,0.94,252,0.99);



%%
%spectral risk measure


[SRM50_A,f50_A] = spectralMethod(dailyRetA,50,10000);
[SRM50_B,f50_B] = spectralMethod(dailyRetB,50,10000);

[SRM400_A,f400_A] = spectralMethod(dailyRetA,400,10000);
[SRM400_B,f400_B] = spectralMethod(dailyRetB,400,10000);


[SRM1000_A,f1000_A] = spectralMethod(dailyRetA,1000,10000);
[SRM1000_B,f1000_B] = spectralMethod(dailyRetB,1000,10000);
%%
plot(0.01:0.01:100,[f50_A';f400_A';f1000_A'])
hold on; 
legend({'R=50','R=400','R=1000'})
ylabel('Value of Lose Function');
xlabel('Cumulative Probability(%)');
title('{Johnson&Johnson Spectral Risk Measures}');
hold off;
 
 %%
plot(0.01:0.01:100,[f50_B';f400_B';f1000_B'])
hold on; 
legend({'R=50','R=400','R=1000'})
ylabel('Value of Lose Function');
xlabel('Cumulative Probability(%)');
title('{Allergan Spectral Risk Measures}');
hold off;






%%
%EWMA
EWMA_VaR_A = EWMAMethod(W,compA,252);
%%
EWMA_VaR_B = EWMAMethod(W,compB,252);


%%
rollingA95 = rollingMethod(W,compA,504,0.94,0.95);
%%
rollingA99 = rollingMethod(W,compA,504,0.94,0.99);
%%
rollingB95 = rollingMethod(W,compB,504,0.94,0.95);
%%
rollingB99 = rollingMethod(W,compB,504,0.94,0.99);



