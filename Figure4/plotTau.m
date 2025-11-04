function plotTau(pathData)

    load(fullfile(pathData, 'initPeakPyrIntAllRec.mat'), 'PyrRise','PyrDown');
    
    load(fullfile(pathData, 'avgFRProfile_PeakAndTau.mat'),'PyrRisePeak_AftRun','PyrDownPeak_AftRun');

    pathAnal = fullfile(pathData,'Analysis\');
    
    idxPyrRise = PyrRise.idxRise;
    idxPyrDown = PyrDown.idxDown;

    plotDataVsLinearFit((1:length(idxPyrRise))',PyrRisePeak_AftRun.tau',...
        PyrRisePeak_AftRun.lm_OrderVsTau,PyrRisePeak_AftRun.corrCoef_OrderVsTau,...
        'Neuron no. (PyrRise)','Time constant (s)',pathAnal,'PyrRise_TauVsOrderNo');
    

    plotDataVsLinearFit((1:length(idxPyrDown))',PyrDownPeak_AftRun.tau',...
        PyrDownPeak_AftRun.lm_OrderVsTau,PyrDownPeak_AftRun.corrCoef_OrderVsTau,...
        'Neuron no. (PyrDown)','Time constant (s)',pathAnal,'PyrDown_TauVsOrderNo');