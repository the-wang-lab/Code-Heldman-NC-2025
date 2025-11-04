function Figure6Plots(pathData)
% All the plots in Figure6
% pathS: the path where the Figure4 data is stored.

    % Figure 6c and 6e, plot PyrUp and PyrDown profiles, stim vs ctrl 
    plotSSTInactivationUpDownProfile(pathData,3);
    
    % Figure 5m-p, plot behavioral plots
    plotAccumulateRecData_opto(pathData,6);

    % Figure 6m and 6o, plot PyrUp and PyrDown profiles, cue rich, stim vs ctrl 
    plotSSTInactivationUpDownProfile_CueRich(pathData,1);
    