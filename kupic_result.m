%%
%kupic test
[norm_kupic_A95,norm_fre_A95] = kupicTest(dailyRetA,norm_VaR_A95,0.95);
[norm_kupic_A99,norm_fre_A99] = kupicTest(dailyRetA,norm_VaR_A99,0.99);
[norm_kupic_B95,norm_fre_B95] = kupicTest(dailyRetB,norm_VaR_B95,0.95);
[norm_kupic_B99,norm_fre_B99] = kupicTest(dailyRetB,norm_VaR_B99,0.99);


[t_kupic_A95,t_fre_A95] = kupicTest(dailyRetA,t_VaR_A95,0.95);
[t_kupic_A99,t_fre_A99] = kupicTest(dailyRetA,t_VaR_A99,0.99);
[t_kupic_B95,t_fre_B95] = kupicTest(dailyRetB,t_VaR_B95,0.95);
[t_kupic_B99,t_fre_B99] = kupicTest(dailyRetB,t_VaR_B99,0.99);

[hist_kupic_A95,hist_fre_A95] = kupicTest(dailyRetA,hist_VaR_A95,0.95);
[hist_kupic_A99,hist_fre_A99] = kupicTest(dailyRetA,hist_VaR_A99,0.99);
[hist_kupic_B95,hist_fre_B95] = kupicTest(dailyRetB,hist_VaR_B95,0.95);
[hist_kupic_B99,hist_fre_B99] = kupicTest(dailyRetB,hist_VaR_B99,0.99);



[corn_kupic_A95,corn_fre_A95] = kupicTest(dailyRetA,corn_VaR_A95,0.95);
[corn_kupic_A99,corn_fre_A99] = kupicTest(dailyRetA,corn_VaR_A99,0.99);
[corn_kupic_B95,corn_fre_B95] = kupicTest(dailyRetB,corn_VaR_B95,0.95);
[corn_kupic_B99,corn_fre_B99] = kupicTest(dailyRetB,corn_VaR_B99,0.99);


[ext_kupic_A95,ext_fre_A95] = kupicTest(dailyRetA,ext_VaR_A95,0.95);
[ext_kupic_A99,ext_fre_A99] = kupicTest(dailyRetA,ext_VaR_A99,0.99);
[ext_kupic_B95,ext_fre_B95] = kupicTest(dailyRetB,ext_VaR_B95,0.95);
[ext_kupic_B99,ext_fre_B99] = kupicTest(dailyRetB,ext_VaR_B99,0.99);



[mn_kupic_A95,mn_fre_A95] = kupicTest(dailyRetA,mn_VaR_A95,0.95);
[mn_kupic_A99,mn_fre_A99] = kupicTest(dailyRetA,mn_VaR_A99,0.99);
[mn_kupic_B95,mn_fre_B95] = kupicTest(dailyRetB,mn_VaR_B95,0.95);
[mn_kupic_B99,mn_fre_B99] = kupicTest(dailyRetB,mn_VaR_B99,0.99);



[mt_kupic_A95,mt_fre_A95] = kupicTest(dailyRetA,mt_VaR_A95,0.95);
[mt_kupic_A99,mt_fre_A99] = kupicTest(dailyRetA,mt_VaR_A99,0.99);
[mt_kupic_B95,mt_fre_B95] = kupicTest(dailyRetB,mt_VaR_B95,0.95);
[mt_kupic_B99,mt_fre_B99] = kupicTest(dailyRetB,mt_VaR_B99,0.99);


[vol_kupic_A95,vol_fre_A95] = kupicTest(dailyRetA,vol_VaR_A95,0.95);
[vol_kupic_A99,vol_fre_A99] = kupicTest(dailyRetA,vol_VaR_A99,0.99);
[vol_kupic_B95,vol_fre_B95] = kupicTest(dailyRetB,vol_VaR_B95,0.95);
[vol_kupic_B99,vol_fre_B99] = kupicTest(dailyRetB,vol_VaR_B99,0.99);


[age_kupic_A95,age_fre_A95] = kupicTest(dailyRetA,age_VaR_A95,0.95);
[age_kupic_A99,age_fre_A99] = kupicTest(dailyRetA,age_VaR_A99,0.99);
[age_kupic_B95,age_fre_B95] = kupicTest(dailyRetB,age_VaR_B95,0.95);
[age_kupic_B99,age_fre_B99] = kupicTest(dailyRetB,age_VaR_B99,0.99);


[ageVol_kupic_A95,ageVol_fre_A95] = kupicTest(dailyRetA,ageVol_VaR_A95,0.95);
[ageVol_kupic_A99,ageVol_fre_A99] = kupicTest(dailyRetA,ageVol_VaR_A99,0.99);
[ageVol_kupic_B95,ageVol_fre_B95] = kupicTest(dailyRetB,ageVol_VaR_B95,0.95);
[ageVol_kupic_B99,ageVol_fre_B99] = kupicTest(dailyRetB,ageVol_VaR_B99,0.99);


Headings = {'normal distribution','t distribution','historical','cornish',...
    'extreme value','monte carlo normal','monte carlo t','volatility weighted',...
    'age weighted','age-volatility weighted'}';
kupicA95 = [norm_kupic_A95;t_kupic_A95;hist_kupic_A95;corn_kupic_A95;...
    ext_kupic_A95;mn_kupic_A95;mt_kupic_A95;vol_kupic_A95;age_kupic_A95;...
    ageVol_kupic_A95];

kupicA99 = [norm_kupic_A99;t_kupic_A99;hist_kupic_A99;corn_kupic_A99;...
    ext_kupic_A99;mn_kupic_A99;mt_kupic_A99;vol_kupic_A99;age_kupic_A99;...
    ageVol_kupic_A99];

kupicB95 = [norm_kupic_B95;t_kupic_B95;hist_kupic_B95;corn_kupic_B95;...
    ext_kupic_B95;mn_kupic_B95;mt_kupic_B95;vol_kupic_B95;age_kupic_B95;...
    ageVol_kupic_B95];

kupicB99 = [norm_kupic_B99;t_kupic_B99;hist_kupic_B99;corn_kupic_B99;...
    ext_kupic_B99;mn_kupic_B99;mt_kupic_B99;vol_kupic_B99;age_kupic_B99;...
    ageVol_kupic_B99];

freA95 =[norm_fre_A95;t_fre_A95;hist_fre_A95;corn_fre_A95;ext_fre_A95;...
    mn_fre_A95;mt_fre_A95;vol_fre_A95;age_fre_A95;ageVol_fre_A95];

freA99 =[norm_fre_A99;t_fre_A99;hist_fre_A99;corn_fre_A99;ext_fre_A99;...
    mn_fre_A99;mt_fre_A99;vol_fre_A99;age_fre_A99;ageVol_fre_A99];

freB95 =[norm_fre_B95;t_fre_B95;hist_fre_B95;corn_fre_B95;ext_fre_B95;...
    mn_fre_B95;mt_fre_B95;vol_fre_B95;age_fre_B95;ageVol_fre_B95];

freB99 =[norm_fre_B99;t_fre_B99;hist_fre_B99;corn_fre_B99;ext_fre_B99;...
    mn_fre_B99;mt_fre_B99;vol_fre_B99;age_fre_B99;ageVol_fre_B99];

T1 = table(Headings,kupicA95,freA95);
T2 = table(Headings,kupicA99,freA99);
T3 =table(Headings,kupicB95,freB95);
T4 =table(Headings,kupicB99,freB99);

writetable(T1,'JNJ.xlsx','Sheet',5,'Range','A1')
writetable(T2,'JNJ.xlsx','Sheet',5,'Range','E1')
writetable(T3,'JNJ.xlsx','Sheet',5,'Range','I1')
writetable(T4,'JNJ.xlsx','Sheet',5,'Range','M1')


