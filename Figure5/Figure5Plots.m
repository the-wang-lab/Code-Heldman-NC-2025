function Figure5Plots(pathData)
% All the plots in Figure5
% pathS: the path where the Figure4 data is stored.

    % Figure 5c, plot SST-Up tagged
    plotTaggedSSTProfile(pathData);
        
    % Figure 5e, plot SST-Up
    plotSSTProfile(pathData);

    % Figure 5i and 5k, plot PyrUp and PyrDown profiles, stim vs ctrl 
    plotSSTInactivationUpDownProfile(pathData, 1);
    
    % Figure 5m-p, plot behavioral plots
    plotAccumulateRecData_opto(pathData,4);
    