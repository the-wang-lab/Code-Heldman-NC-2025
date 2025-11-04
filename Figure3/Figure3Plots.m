function Figure3Plots(pathData)
% All the plots in Figure3
% pathS: the path where the Figure3 data is stored.

    % Figure 3a, plot the mean speed for good and bad trials
    plotBehAlignedMeanGoodBadBar(pathData);
        
    % Figure 3b, plot the cue to run latency distribution
    plotLickAlignedAllRec(pathData);

    % Figure 3d, plotting the mean correlation for good and bad trials
    CompPyrModAlignedGoodVsBadTrALPL(pathData);
    
    % Figure 3g-j, plot the pyrup and pyrdown profiles
    plotPyrNeuRiseDown(pathData);
    