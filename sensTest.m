
clear all;close all;clc;
%%
%parameters
W = 10; %million
compA = xlsread('JNJ.xlsx',1);
compB = xlsread('JNJ.xlsx',2);
dailyRetA = tick2ret(compA(:,2),'Method','Continuous')*W;
dailyRetB = tick2ret(compB(:,2),'Method','Continuous')*W;



%% 
for i = 1:10
    Lambda = 0.92 + 0.005*i;
    age_VaR_A95(i) = ageMethod(dailyRetA,Lambda,0.95);
    age_VaR_A99(i) = ageMethod(dailyRetA,Lambda,0.99);
    age_VaR_B95(i) = ageMethod(dailyRetB,Lambda,0.95);
    age_VaR_B99(i) = ageMethod(dailyRetB,Lambda,0.99);
    vol_VaR_A95(i) = volMethod(dailyRetA,Lambda,252,0.95);
    vol_VaR_A99(i) = volMethod(dailyRetA,Lambda,252,0.99);
    vol_VaR_B95(i) = volMethod(dailyRetB,Lambda,252,0.95);
    vol_VaR_B99(i) = volMethod(dailyRetB,Lambda,252,0.99);
    ageVol_VaR_A95(i) = ageVolMethod(dailyRetA,Lambda,252,0.95);
    ageVol_VaR_A99(i) = ageVolMethod(dailyRetA,Lambda,252,0.99);
    ageVol_VaR_B95(i) = ageVolMethod(dailyRetB,Lambda,252,0.95);
    ageVol_VaR_B99(i) = ageVolMethod(dailyRetB,Lambda,252,0.99); 
end





%% Table of results

Lambda = 0.925:0.005:0.97;
Lambda = Lambda';
%%


ageWeightedA95 = age_VaR_A95';
volWeightedA95 = vol_VaR_A95';
ageVolWeightedA95 = ageVol_VaR_A95';

ageWeightedA99 = age_VaR_A99';
volWeightedA99 = vol_VaR_A99';
ageVolWeightedA99 = ageVol_VaR_A99';

ageWeightedB95 = age_VaR_B95';
volWeightedB95 = vol_VaR_B95';
ageVolWeightedB95 = ageVol_VaR_B95';

ageWeightedB99 = age_VaR_B99';
volWeightedB99 = vol_VaR_B99';
ageVolWeightedB99 = ageVol_VaR_B99';



T1 = table(Lambda,ageWeightedA95,volWeightedA95,ageVolWeightedA95);
T2 = table(Lambda,ageWeightedA99,volWeightedA99,ageVolWeightedA99);
T3 = table(Lambda,ageWeightedB95,volWeightedB95,ageVolWeightedB95);
T4 = table(Lambda,ageWeightedB99,volWeightedB99,ageVolWeightedB99);



writetable(T1,'JNJ.xlsx','Sheet',6,'Range','A1')
writetable(T2,'JNJ.xlsx','Sheet',6,'Range','A13')
writetable(T3,'JNJ.xlsx','Sheet',6,'Range','F1')
writetable(T4,'JNJ.xlsx','Sheet',6,'Range','F13')


