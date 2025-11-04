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
   
end