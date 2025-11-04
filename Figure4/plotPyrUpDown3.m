function plotPyrUpDown3(pathData)

    load(fullfile(pathData, 'initPeakPyrIntAllRec.mat'),'InitAll','PyrRise','PyrDown');
    
    load(fullfile(pathData, 'initPeakPyrAllRec.mat'),'modPyr1AL');

    pathAnal = fullfile(pathData,'Analysis\');
    
    idxPyrRise = PyrRise.idxRise;
    idxPyrDown = PyrDown.idxDown;

    %% plot the averaged FR profile for comparing neurons with high FR ratio, mid FR ratio and low FR ratio
    % PyrRise
    numNeurons = 1:floor(length(idxPyrRise)/3):length(idxPyrRise);
    avgProfileTmp = InitAll.avgFRProfile(idxPyrRise,:);
    comp3TimeSequences(avgProfileTmp(1:numNeurons(2),:),...
        avgProfileTmp(numNeurons(2)+1:numNeurons(3),:),...
        avgProfileTmp(numNeurons(3)+1:numNeurons(4),:),modPyr1AL.timeStepRun,[-1,4],[0 3.5],...
        'Time from runonset(s)','FR (Hz)',pathAnal,'PyrRise_cmpAvgFRProfiles_DiffFR0to1vsBefRunRatio');
    
    % PyrDown
    numNeurons = 1:floor(length(idxPyrDown)/3):length(idxPyrDown);
    if(length(numNeurons) == 3)
        numNeurons(4) = length(idxPyrDown);
    end
    avgProfileTmp = InitAll.avgFRProfile(idxPyrDown,:);
    comp3TimeSequences(avgProfileTmp(1:numNeurons(2),:),...
        avgProfileTmp(numNeurons(2)+1:numNeurons(3),:),...
        avgProfileTmp(numNeurons(3)+1:numNeurons(4),:),modPyr1AL.timeStepRun,[-1,4],[0 3.5],...
        'Time from runonset(s)','FR (Hz)',pathAnal,'PyrDown_cmpAvgFRProfiles_DiffFR0to1vsBefRunRatio');