function CompPyrAlignedCorrNoCueVsALPL(pathData)

    pathAnal = fullfile(pathData, 'Analysis\');
    if(exist([pathData '\autoCorrPyrAlignedAllRec_CtrlTr.mat']))
        load([pathData '\autoCorrPyrAlignedAllRec_CtrlTr.mat']);
    end
    
    plotBarsOnly(...
        [mean(noCueVsALPL.ALPLMeanCorrTRunNZField),mean(noCueVsALPL.ALPLMeanCorrTCueNZField)],...
            [std(noCueVsALPL.ALPLMeanCorrTRunNZField)/sqrt(length(noCueVsALPL.ALPLMeanCorrTRunNZField)),...
            std(noCueVsALPL.ALPLMeanCorrTCueNZField)/sqrt(length(noCueVsALPL.ALPLMeanCorrTCueNZField))],...
            '','Mean corr. T NZ Field (Run vs Cue)', ['p=' num2str(noCueVsALPL.pRSMeanCorrTRunCueNZField)],...
            pathAnal,'MeanCorrTNZFieldRunVsCueALPLBar')

    %% violin plot
    params = struct();
    params.save_path = pathAnal;
    params.variable_names_plot = {'Cue', 'Run'};
    params.xlim = [0.5 2.5];
    params.axisSize = [55 75];
    params.colors = {[231 245 247]/255, [212 238 246]/255};
    params.ShowData = false;
    params.ViolinAlpha = [{0.7} {0.7}];
    params.filename = 'MeanCorrTNZFieldRunVsCueALPLViolin';

    vars = [];
    vars.(params.variable_names_plot{1}) = noCueVsALPL.ALPLMeanCorrTCueNZField; % Data for 'Cue'
    vars.(params.variable_names_plot{2}) = noCueVsALPL.ALPLMeanCorrTRunNZField; % Data for 'Run'

    params.yticks = -0.15:0.1:0.60;
    params.ylim = [-0.15 0.60];

    makeViolinFromBar(vars, params);