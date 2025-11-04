function Figure2Plots(pathData)
% All the plots in Figure2
% pathS: the path where the Figure2 data is stored.

    % Figure 2c, plot the time vs distance relationship per trial for an example recording
    DistVsTimeBeh(pathData, 'A016-20190603-01_DataStructure_mazeSection1_TrialType1', 3);
    
    % Figure 2d, plot the cue to run latency distribution
    plotCuetoRunLatency(pathData);
    
    % Figure 2g, plot the percentage of neurons with firing fields after
    % aligning to run onset
    plotPercNeuronsWithField_RunAligned(pathData);
    
    % Figure 2h, plot mean activity corr for neurons with firing fields, comparing aligned to cue vs run onset
    CompPyrAlignedCorrNoCueVsALPL(pathData);