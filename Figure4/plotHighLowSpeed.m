function plotHighLowSpeed(pathData)

    pathAnal = fullfile(pathData, 'Analysis\');

    sampleFq = 1250;

    load([pathData 'initPeakPyrIntAllRec_HighLowSpeedTrTime_minNumTr15.mat'],'PyrRise1Speed','PyrDown1Speed','Lick_HhMd','Speed_HhMd','minNumTr');
    load([pathData 'initPeakPyrAllRec_HighLowSpeedTrTime.mat'],'modPyr2ALSpeed');

    plotAvgFRProfileCmp(modPyr2ALSpeed.timeStepRun,PyrRise1Speed.avgFRProfileHigh_HhMd,PyrRise1Speed.avgFRProfileMid_HhMd,...
        'FR (Hz)',['PyrRise_FRProfileHighVsMidSpeed_Time_minNumTr' num2str(minNumTr)],pathAnal,[0 3],[])
    
    plotAvgFRProfileCmp(modPyr2ALSpeed.timeStepRun,PyrDown1Speed.avgFRProfileHigh_HhMd,PyrDown1Speed.avgFRProfileMid_HhMd,...
        'FR (Hz)',['PyrDown_FRProfileHighVsMidSpeed_Time_minNumTr' num2str(minNumTr)],pathAnal,[0 3],[])

    plotAvgFRProfileCmp(modPyr2ALSpeed.speedTimeStep{1}/sampleFq,Speed_HhMd.meanTimeSess.High/10,Speed_HhMd.meanTimeSess.Mid/10,...
        'Speed (cm/s)',['PyrDown_SpeedHighVsMid_Time_minNumTr' num2str(minNumTr)],pathAnal,[0 65],[])
    
    plotAvgFRProfileCmp(modPyr2ALSpeed.lickTimeStep{1}/sampleFq,Lick_HhMd.meanTimeSess.High/(diff(modPyr2ALSpeed.lickTimeStep{1}(1:2))/sampleFq),...
        Lick_HhMd.meanTimeSess.Mid/(diff(modPyr2ALSpeed.lickTimeStep{1}(1:2))/sampleFq),...
        'Lick / sec',['PyrDown_LickHighVsMid_Time_minNumTr' num2str(minNumTr)],pathAnal,[0 15],[])