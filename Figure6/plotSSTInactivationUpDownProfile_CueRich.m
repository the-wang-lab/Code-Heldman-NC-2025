function plotSSTInactivationUpDownProfile_CueRich(pathData,cond)

    pathAnal = fullfile(pathData,'Analysis\CueRich');
    if(~exist(pathAnal))
        mkdir(pathAnal);
    end
        
    load(fullfile([pathData 'CueRich'],'initPeakPyrAllRecSigStimNoStim2ndStimCtrl.mat'),'modPyr1AL');
    load(fullfile([pathData 'CueRich'],'initPeakPyrIntAllRecStimSigNoStim2ndStimCtrl.mat'),'PyrStim1');
    
    plotPyrNeuStimUpDown(pathAnal, modPyr1AL, PyrStim1.FRProfile1,cond);