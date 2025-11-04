function plotAccumulateRecData_opto(pathData,cond)

    folderPath = fullfile(pathData,'Analysis\');
    
    fullPath = [pathData 'allRecData.mat'];
    if(~exist(fullPath,'file'))
        disp([fullPath ' does not exist.']);
        return;
    end
    load(fullPath,'recDataRunPre','recDataRunManip','recDataRunPost');
    
    
    fullPath = [pathData 'allRecDataStats.mat'];
    load(fullPath,'meanRecDataRunPre','meanRecDataRunManip','meanRecDataRunPost',...
            'semRecDataRunPre','semRecDataRunManip','semRecDataRunPost',...
            'rankRecDataRunPrePost','rankRecDataRunPreM','rankRecDataRunPostM',...
            'anovaRecDataRun');
        
    opt = 0;
    for i = cond
        disp(['Condition ' num2str(i)])
        if(length(recDataRunPre{i}.indRec)<=1)
            continue;
        end
        indDist = recDataRunPre{i}.spaceStepsLick <= 1200;
        path = [folderPath 'lickProfile0to120_cond' num2str(i) '_opt' num2str(opt)];
        plotLickProfile0to120(recDataRunPre{i}.lickProfileRndSel(:,indDist),recDataRunManip{i}.lickProfileRndSel(:,indDist),...
            path,recDataRunPre{i}.spaceStepsLick(indDist),0.2);
        
        path = [folderPath '_percRewarded_cond' num2str(i) '_opt' num2str(opt)];
        rankXY = [rankRecDataRunPreM{i}.percRewarded;anovaRecDataRun{i}.percRewardedPreM];
        if(isempty(rankRecDataRunPrePost{i}))
            rankXZ = [];
            rankYZ = [];
        else
            rankXZ = [rankRecDataRunPrePost{i}.percRewarded;anovaRecDataRun{i}.percRewardedPrePost];
            rankYZ = [rankRecDataRunPostM{i}.percRewarded;anovaRecDataRun{i}.percRewardedPostM];
        end
        plotStat(recDataRunPre{i}.percRewarded,recDataRunManip{i}.percRewarded,...
            recDataRunPost{i}.percRewarded,meanRecDataRunPre{i}.percRewarded,...
            meanRecDataRunManip{i}.percRewarded,meanRecDataRunPost{i}.percRewarded,...
            semRecDataRunPre{i}.percRewarded,semRecDataRunManip{i}.percRewarded,...
            semRecDataRunPost{i}.percRewarded,...
            rankXY,rankXZ,rankYZ,'Session','Percent. rewarded',['Cond' num2str(i)],path);
        
        path = [folderPath '_meanLick30to100PreM_cond' num2str(i) '_opt' num2str(opt)];
        rankXY = [rankRecDataRunPreM{i}.pSignRMeanLickMeanPerRec30to100;...
            rankRecDataRunPreM{i}.pRSMeanLickMeanPerRec30to100];      
        plotStat(rankRecDataRunPreM{i}.meanLickPerRec30to100(:,1)',...
            rankRecDataRunPreM{i}.meanLickPerRec30to100(:,2)',...
            [],rankRecDataRunPreM{i}.meanMeanLickPerRec30to100(1),...
            rankRecDataRunPreM{i}.meanMeanLickPerRec30to100(2),[],...
            rankRecDataRunPreM{i}.semMeanLickPerRec30to100(1),...
            rankRecDataRunPreM{i}.semMeanLickPerRec30to100(2),...
            [],rankXY,[],[],'Session','mean lick mean 30-100 cm',['Cond' num2str(i)],path);

        %% added on 8/27/2022
        path = [folderPath '_meanLick100to140PreM_cond' num2str(i) '_opt' num2str(opt)];
        rankXY = [rankRecDataRunPreM{i}.pSignRMeanLickMeanPerRec100to140;...
            rankRecDataRunPreM{i}.pRSMeanLickMeanPerRec100to140];     
        plotStat(rankRecDataRunPreM{i}.meanLickPerRec100to140(:,1)',...
            rankRecDataRunPreM{i}.meanLickPerRec100to140(:,2)',...
            [],rankRecDataRunPreM{i}.meanMeanLickPerRec100to140(1),...
            rankRecDataRunPreM{i}.meanMeanLickPerRec100to140(2),[],...
            rankRecDataRunPreM{i}.semMeanLickPerRec100to140(1),...
            rankRecDataRunPreM{i}.semMeanLickPerRec100to140(2),...
            [],rankXY,[],[],'Session','mean lick mean 100-140 cm',['Cond' num2str(i)],path);

        %% added on 04/2022 by Yingxue
        path = [folderPath '_meanSpeedPreM_cond' num2str(i) '_opt' num2str(opt)];
        rankXY = [rankRecDataRunPreM{i}.pSignRMeanSpeedMeanPerRec;...
            rankRecDataRunPreM{i}.pRSMeanSpeedMeanPerRec];     
        plotStat(rankRecDataRunPreM{i}.meanSpeedPerRec(:,1)',...
            rankRecDataRunPreM{i}.meanSpeedPerRec(:,2)',...
            [],rankRecDataRunPreM{i}.meanMeanSpeedPerRec(1),...
            rankRecDataRunPreM{i}.meanMeanSpeedPerRec(2),[],...
            rankRecDataRunPreM{i}.semMeanSpeedPerRec(1),...
            rankRecDataRunPreM{i}.semMeanSpeedPerRec(2),...
            [],rankXY,[],[],'Session','mean speed mean',['Cond' num2str(i)],path);
               
    end
end

function plotStat(dataX,dataY,dataZ,meanX,meanY,meanZ,semX,semY,semZ,...
                rankXY,rankXZ,rankYZ,xlab,ylab,ti,path)    
    if(~isempty(rankXZ))  
        dataArr = [dataX' dataY' dataZ'];
        meanArr = [meanX meanY meanZ];
        errBar = [semX semY semZ];
        
        barPlotWithStat(1:3,meanArr,errBar,dataArr,xlab,ylab,ti,rankXY,rankXZ,rankYZ);
    else
        dataArr = [dataX' dataY'];
        meanArr = [meanX meanY];
        errBar = [semX semY];
        
%         if(size(dataArr,1) == 2)
%             dataArr = dataArr';
%         end
        barPlotWithStat(1:2,meanArr,errBar,dataArr,xlab,ylab,ti,rankXY,rankXZ,rankYZ);       
    end
    print('-painters', '-dpdf', path, '-r600')
    savefig([path '.fig']);
end

function plotLickProfile0to120(lickCtrl,lickOpt,path,spaceStepsAligned,yl)
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
    options.x_axisX = spaceStepsAligned/10;
    options.x_axisY = spaceStepsAligned/10;
    plot_areaerrorbarXY(lickCtrl, lickOpt,...
        options);
    set(gca,'XLim',[min(spaceStepsAligned/10) max(spaceStepsAligned/10)],...
        'YLim',[0 yl]);
    xlabel('Dist (cm)')
    ylabel('No. licks ')
    legend('','Ctrl','','Stim')
    
    saveas(gcf,[path '.fig']);
    print('-painters', '-dpdf', path, '-r600')
end
