function DistVsTimeBeh(path, fileName,mazeSess)
% plot distance against time
% e.g.: DistVsTimeBeh('Z:\Raphael_tests\mice_expdata\ANM016\A016-20190603\A016-20190603-01\','A016-20190603-01_DataStructure_mazeSection1_TrialType1',3)

    pathAnal = fullfile(path, 'Analysis\')
    if(~exist(pathAnal))
        mkdir(pathAnal);
    end

    fullPath = [path '\' fileName '_behPar_msess' num2str(mazeSess) '.mat']; 
    if(exist(fullPath) == 0)
        disp('The _behPar file does not exist');
        return;
    end
    load(fullPath);
    
    indBadBeh = behPar.indTrBadBeh;
    
    goodTrials = find(indBadBeh == 0);
    goodTrials = goodTrials(goodTrials ~= 1);

    disp(['Number of good trials = ' num2str(length(goodTrials))]);
    nGoodTrials = length(goodTrials);
    
     
    load([path '\' fileName '.mat']);
    indTr = find(lap.mazeSess == mazeSess);
    goodTrials = indTr(goodTrials);
    trLen = zeros(1,length(goodTrials));
    for i = 1:length(goodTrials)
        trLen(i) = trials{goodTrials(i)}.Nsamples;
    end
    
    xMMArray = zeros(length(goodTrials),max(trLen));
    for i = 1:length(goodTrials)
        xMMAll = xMMContinuous(trials{goodTrials(i)}.xMMAll);
        xMMArray(i,1:trials{goodTrials(i)}.Nsamples) = xMMAll;
        xMMArray(i,trials{goodTrials(i)}.Nsamples+1:end) = xMMAll(end);
    end
    
    meanXMM = mean(xMMArray);
    
    [figNew,pos] = CreateFig();
    set(0,'Units','pixels') 
    set(figure(figNew),'OuterPosition',...
        [pos(1) pos(2) 200 200])
    hold on;
    for i = 1:length(goodTrials)
        h = plot((1:trLen(i))/1250,xMMArray(i,1:trLen(i))/10,'-','color',[0.8 0.8 0.8],'LineWidth',1);
    end
    h = plot((1:max(trLen))/1250,meanXMM/10,'-','color',[0.1 0.1 0.1],'LineWidth',4);
%     set(gca,'XLim',[0 max(trLen)],'YLim',[0 220],'FontSize',10,'XTick',[0 5 10],'YTick',[0 90 180])
    set(gca,'XLim',[0 max(trLen)/1250],'YLim',[0 220],'FontSize',10,'YTick',[0 90 180])
    xlabel('Time (s)')
    ylabel('Distance (cm)')
    
    ind = findstr(fileName,'_');
    print ('-painters', '-dpdf', [pathAnal 'TimeVsDist_' fileName(1:ind(1)-1)], '-r600')
    savefig([pathAnal 'TimeVsDist_' fileName(1:ind(1)-1) '.fig']);

    timeSteps = (1:max(trLen))/1250;
    save([pathAnal 'TimeVsDist_' fileName(1:ind(1)-1) '.mat'], 'timeSteps', 'xMMArray');

end

function xMM1 = xMMContinuous(xMM)
    indResetXMM = find(diff(xMM) < 0);
    indResetXMM = [indResetXMM+1; length(xMM)+1];
    for n = 1:length(indResetXMM)-1
        xMM(indResetXMM(n):indResetXMM(n+1)-1) = ...
            xMM(indResetXMM(n):indResetXMM(n+1)-1) + xMM(indResetXMM(n)-1);
    end
    xMM1 = xMM-xMM(1);  
end