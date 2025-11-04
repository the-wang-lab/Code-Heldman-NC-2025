function PyrBehALNoCue(pathData)
%% compare no cue behavior with AL behavior (only the initial recordings from AL to match the conditions)
%% plot aligned to cue and over distance (onlyRun should be set to 0)

    if(exist([pathData '\behNoCueVsAL_AlignedtoCueOverDist.mat']))
        load([pathData '\behNoCueVsAL_AlignedtoCueOverDist.mat']);
    end
    
    pathAnal = fullfile(pathData, 'Analysis\');
    if(~exist(pathAnal))
        mkdir(pathAnal);
    end
       
    plotBehMeanALNoCue(pathAnal,behAL,behNoCue,behMeanStat);
    
    plotLick(pathAnal,behNoCue.spaceStepsLick,...
        behNoCue.meanLickPerRec/2,...
        behAL.meanLickPerRec/2,[{'NoCue'} {'AL'}],...
        ['MeanLickVsDist-NoCueAL']);
    
    plotSpeed(pathAnal,behNoCue.spaceStepsSpeed,...
        behNoCue.meanSpeedPerRec/10,...
        behAL.meanSpeedPerRec/10,[{'NoCue'} {'AL'}],...
        ['MeanSpeedVsDist-NoCueAL']);
    
end


function plotLick(pathAnal,spaceStepsLick,lickField,lickNoField,leg,fileName1)
    options.handle     = figure;
    set(options.handle,'OuterPosition',...
        [500 500 280 280])
    options.color_areaX = [27 117 187]./255;    % Blue theme
    options.color_lineX = [ 39 169 225]./255;
    options.color_areaY = [187 189 192]./255;    % Orange theme
    options.color_lineY = [167 169  171]./255;
    options.alpha      = 0.5;
    options.line_width = 0.5;
    options.error      = 'sem';
    options.x_axisX = spaceStepsLick/10;
    options.x_axisY = spaceStepsLick/10;
    plot_areaerrorbarXY(lickField, lickNoField,...
        options);
    set(gca,'XLim',[30 180], 'YLim', [0 0.4]);
    xlabel('Dist (cm)')
    ylabel('Num. licks / cm')
    legend('',leg{1},'',leg{2})
    
    fileName = fullfile(pathAnal,fileName1);
    saveas(gcf,fileName);
    print('-painters', '-dpdf', fileName, '-r600')
end


function plotSpeed(pathAnal,spaceStepsSpeed,speedField,speedNoField,leg,fileName1)
    options.handle     = figure;
    set(options.handle,'OuterPosition',...
        [500 500 280 280])
    options.color_areaX = [27 117 187]./255;    % Blue theme
    options.color_lineX = [ 39 169 225]./255;
    options.color_areaY = [187 189 192]./255;    % Orange theme
    options.color_lineY = [167 169  171]./255;
    options.alpha      = 0.5;
    options.line_width = 0.5;
    options.error      = 'sem';
    options.x_axisX = spaceStepsSpeed/10;
    options.x_axisY = spaceStepsSpeed/10;
    plot_areaerrorbarXY(speedField, speedNoField,...
        options);
    set(gca,'XLim',[0 180]);
    xlabel('Dist (cm)')
    ylabel('Speed (cm/s) ')
    legend('',leg{1},'',leg{2})
        
    fileName = fullfile(pathAnal,fileName1);
    saveas(gcf,fileName);
    print('-painters', '-dpdf', fileName, '-r600')
end


function plotBehMeanALNoCue(pathAnal,behAL,behNoCue,behMeanStat)
% compare behavior of no cue and AL sessions
% this function is called by PyrBehALNoCue.m
    
    % distance 150 to 180 cm
    plotStat(mean(behAL.meanLickPerRec(:,behMeanStat.indLick150to180),2)',...
        mean(behNoCue.meanLickPerRec(:,behMeanStat.indLick150to180),2)',...
        behMeanStat.meanLickPerRec150to180,behMeanStat.stdLickPerRec150to180,...
        behMeanStat.pRSMeanLickMean150to180,...
        [],'No. licks (150-180 cm)',[],'meanLickPerRecALVsNoCue150to180Bar',...
        pathAnal);
end