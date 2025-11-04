function plotAccumulateRecData_opto_Lick(pathData,cond)

    folderPath = fullfile(pathData,'Analysis\');
    
    fullPath = [pathData '\LickCorrection1\allRecData.mat'];
    if(~exist(fullPath,'file'))
        disp([fullPath ' does not exist.']);
        return;
    end
    load(fullPath,'recDataRunPre','recDataRunManip','recDataRunPost');
    
    
    fullPath = [pathData '\LickCorrection1\allRecDataStats.mat'];
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
    end
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
