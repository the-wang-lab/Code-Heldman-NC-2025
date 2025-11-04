function Figure7Plots(pathData)
% All the plots in Figure7
% pathS: the path where the Figure4 data is stored.

    % Figure 7c, plot PV-Up tagged
    plotTaggedPVProfile(pathData);
        
    % Figure 7e, plot PV-Up
    plotPVProfile(pathData);

    % Figure 7i and 7k, plot PyrUp and PyrDown profiles, stim vs ctrl 
    plotPVInactivationUpDownProfile(pathData, 1);
    
    % Figure 7m, plot lick profile
    plotAccumulateRecData_opto_Lick(pathData,13);
    
    % Figure 7n-p, plot behavioral plots
    plotAccumulateRecData_opto(pathData,13);
