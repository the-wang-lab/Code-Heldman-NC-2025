function plotBehAlignedMeanGoodBadBar(pathData)
% compare behavior of good vs bad trials (bar plots)
% this function is called by PyrBehAlignedAllRec.m
    
    pathAnal = fullfile(pathData, 'Analysis\');
    if(~exist(pathAnal))
        mkdir(pathAnal);
    end

    load([pathData 'behAllRecSel.mat'],'behAlignedMean',...
            'behAlignedMeanStat');  
        
    % mean speed
    plotStat(mean(behAlignedMean.meanSpeedPerRecNonStimGood,2)'/10,...
        mean(behAlignedMean.meanSpeedPerRecNonStimBad,2)'/10,...
        behAlignedMeanStat.meanSpeedPerRec,behAlignedMeanStat.stdSpeedPerRec,...
        behAlignedMeanStat.pRSMeanSpeedMeanPerRec,...
        [],'Speed (cm/s)',[],'meanSpeedPerRecGoodVsBadBar',...
        pathAnal);

    % mean speed violin plot
    params = struct();
    params.save_path = pathAnal;
    params.variable_names_plot = {'Good', 'Bad'};
    params.xlim = [0.5 2.5];
    params.axisSize = [55 75];
    params.colors = {[231 245 247]/255, [212 238 246]/255};
    params.ShowData = false;
    params.ViolinAlpha = [{0.7} {0.7}];
    params.filename = 'meanSpeedPerRecGoodVsBadViolin';

    vars = [];
    vars.(params.variable_names_plot{1}) = mean(behAlignedMean.meanSpeedPerRecNonStimGood,2)/10; % Data for 'Good'
    vars.(params.variable_names_plot{2}) = mean(behAlignedMean.meanSpeedPerRecNonStimBad,2)/10; % Data for 'Bad'

    params.yticks = 0:10:80;
    params.ylim = [0 80];

    makeViolinFromBar(vars, params);

    % distance 30 to 100 cm
    plotStat(mean(behAlignedMean.meanLickPerRecNonStimGood(:,behAlignedMeanStat.indLick30to100),2)',...
        mean(behAlignedMean.meanLickPerRecNonStimBad(:,behAlignedMeanStat.indLick30to100),2)',...
        behAlignedMeanStat.meanLickPerRec30to100,behAlignedMeanStat.stdLickPerRec30to100,...
        behAlignedMeanStat.pRSMeanLickMeanPerRec30to100,...
        [],'No. licks (30-100 cm)',[],'meanLickPerRecGoodVsBad30to100Bar',...
        pathAnal);
   
end