function plotEarlyLateLick(pathData)

    pathAnal = fullfile(pathData, 'Analysis\');

    sampleFq = 1250;

    load([pathData 'initPeakPyrIntAllRec_EarlyLateTrTime_minNumTr15.mat'],'PyrRise1','PyrDown1','Speed_EyLe','Lick_EyLe','minNumTr');
    load([pathData 'initPeakPyrAllRec_EarlyLateTrTime.mat'],'modPyr2AL');
    
    plotAvgFRProfileCmp(modPyr2AL.timeStepRun,PyrRise1.avgFRProfileEarly_EyLe,PyrRise1.avgFRProfileLate_EyLe,...
        'FR (Hz)',['PyrRise_FRProfileEarlyVsLate_Time_minNumTr' num2str(minNumTr)],pathAnal,[0 3],[])
    
    plotAvgFRProfileCmp(modPyr2AL.timeStepRun,PyrDown1.avgFRProfileEarly_EyLe,PyrDown1.avgFRProfileLate_EyLe,...
        'FR (Hz)',['PyrDown_FRProfileEarlyVsLate_Time_minNumTr' num2str(minNumTr)],pathAnal,[0 3],[])

    plotAvgFRProfileCmp(modPyr2AL.speedTimeStep{1}/sampleFq,Speed_EyLe.meanTimeSess.Early/10,Speed_EyLe.meanTimeSess.Late/10,...
        'Speed (cm/s)',['PyrDown_SpeedEarlyVsLate_Time_minNumTr' num2str(minNumTr)],pathAnal,[0 60],[])

    plotAvgFRProfileCmp(modPyr2AL.lickTimeStep{1}/sampleFq,Lick_EyLe.meanTimeSess.Early/(diff(modPyr2AL.lickTimeStep{1}(1:2))/sampleFq),...
        Lick_EyLe.meanTimeSess.Late/(diff(modPyr2AL.lickTimeStep{1}(1:2))/sampleFq),...
        'Lick / sec',['PyrDown_LickEarlyVsLate_Time_minNumTr' num2str(minNumTr)],pathAnal,[0 15],[])