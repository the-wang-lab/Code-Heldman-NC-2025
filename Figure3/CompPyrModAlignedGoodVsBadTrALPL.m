function CompPyrModAlignedGoodVsBadTrALPL(pathData)
%% compare No cue vs ALPL recordings for good trials over time
%% run this after running PyrModAlignedAllRec_GoodTr()

    load([pathData 'autoCorrPyrAlignedAllRec_GoodTr.mat']);
    
    pathAnal = fullfile(pathData, 'Analysis\');
      
    % mean corr field
    plotBarsOnly(...
        [mean(goodVsBadALPL.goodMeanCorrTRunNZField1),mean(goodVsBadALPL.badMeanCorrTRunNZField1)],...
            [std(goodVsBadALPL.goodMeanCorrTRunNZField1)/sqrt(length(goodVsBadALPL.goodMeanCorrTRunNZField1)),...
            std(goodVsBadALPL.badMeanCorrTRunNZField1)/sqrt(length(goodVsBadALPL.badMeanCorrTRunNZField1))],...
            '','Mean corr. T NZ (Run) G/B Field', ['p=' num2str(goodVsBadALPL.pRSMeanCorrTRunNZField)],...
            pathAnal,'MeanCorrRunTNZGoodVsBadFieldALPLBar')

    % mean corr field violin plot
    params = struct();
    params.save_path = pathAnal;
    params.variable_names_plot = {'Good', 'Bad'};
    params.xlim = [0.5 2.5];
    params.axisSize = [55 75];
    params.colors = {[231 245 247]/255, [212 238 246]/255};
    params.ShowData = false;
    params.ViolinAlpha = [{0.7} {0.7}];
    params.filename = 'MeanCorrRunTNZGoodVsBadFieldALPLViolin';

    vars = [];
    vars.(params.variable_names_plot{1}) = goodVsBadALPL.goodMeanCorrTRunNZField1; % Data for 'Good'
    vars.(params.variable_names_plot{2}) = goodVsBadALPL.badMeanCorrTRunNZField1; % Data for 'Bad'

    params.yticks = -0.1:0.1:0.7;
    params.ylim = [-0.1 0.7];

    makeViolinFromBar(vars, params);

   
end