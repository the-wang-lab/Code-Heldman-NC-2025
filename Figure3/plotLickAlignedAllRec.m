function plotLickAlignedAllRec(pathData)

    pathAnal = fullfile(pathData, 'Analysis\');

    load([pathData 'behAllRec.mat'], 'behAlignedNoCue');

    load([pathData 'behAllRecSel.mat'],'behAlignedMean');  

    % plot the lick trace
    plotLick(behAlignedNoCue.spaceStepsLick,...
        behAlignedMean.lickTraceNonStimGoodPerRec,...
        behAlignedMean.lickTraceNonStimBadPerRec,[{'Good'} {'Bad'}],...
        [pathAnal 'LickVsDist-GoodBad']);

    