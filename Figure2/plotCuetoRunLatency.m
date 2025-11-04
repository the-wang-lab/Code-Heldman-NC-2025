function plotCuetoRunLatency(pathData)

    pathAnal = fullfile(pathData, 'Analysis\');
    
    if(exist([pathData '\behAllRecSel.mat']))
        load([pathData '\behAllRecSel.mat']);
    end
    
    histStopTime(pathAnal,'histStartCueToRunNonStimPerRec0to5',behAlignedMeanField.startCueToRunNonStimPerRec,...
        0.1,'Start cue to run (s)',[min(behAlignedMeanField.startCueToRunNonStimPerRec) 5]);
end

function histStopTime(pathAnal,fileName1,data,timeBin,xl,xlim)
    handle     = figure;
    set(handle,'OuterPosition',...
        [500 500 280 280])
    [counts,centers] = hist(data,min(data):timeBin:max(data)+timeBin);
    bar(centers, counts/length(data),'FaceColor',[0.3 .3 .3],'EdgeColor',[0.3 .3 .3]);
    set(gca,'XLim',xlim,'FontSize',12);
    xlabel(xl);
    ylabel('Prob.')
    if(~isempty(xlim))
        tmp = data <= xlim(2);
        percDataInc = sum(tmp)/length(tmp);
    else
        percDataInc = 1;
    end
    title(['Mean = ' num2str(mean(data)) ', ' num2str(percDataInc*100) '%']);
    saveas(gcf,[pathAnal fileName1]);
    print('-painters', '-dpdf', [pathAnal fileName1], '-r600')
end