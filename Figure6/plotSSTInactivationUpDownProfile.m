function plotSSTInactivationUpDownProfile(pathData,cond)

    pathAnal = fullfile(pathData,'Analysis\');
    if(~exist(pathAnal))
        mkdir(pathAnal);
    end
    
    load(fullfile(pathData,'initPeakPyrAllRecSigStimNoStim2ndStimCtrl.mat'),'modPyr1AL');
    load(fullfile(pathData,'initPeakPyrIntAllRecStimSigNoStim2ndStimCtrl.mat'),'PyrStim1');
    
    plotPyrNeuStimUpDown(pathAnal, modPyr1AL, PyrStim1.FRProfile1,cond);