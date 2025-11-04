function plotPercNeuronsWithField(pathData)

    if(exist([pathData '\initPeakPyrAllRec.mat']))
        load([pathData '\initPeakPyrAllRec.mat']);
    end

    pathAnal = fullfile(pathData,'Analysis\');

    plotBars(numField.NoCuePercNeu*100,numField.ALPLPercNeu*100,[mean(numField.NoCuePercNeu),mean(numField.ALPLPercNeu)]*100,...
                [std(numField.NoCuePercNeu)/sqrt(length(numField.NoCuePercNeu)),std(numField.ALPLPercNeu)/sqrt(length(numField.ALPLPercNeu))]*100,...
                '','Perc. neurons with field', ['p=' num2str(numField.pRSPercField)],pathAnal,'PercFieldNoCueVsALPLGood')