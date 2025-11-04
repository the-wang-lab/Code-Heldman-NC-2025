function Figure1Plots(pathData)
% All the plots in Figure1
% pathS: the path where the Figure1 data is stored.

    onlyRun = 1; % including only the running period
    
    % Figure 1d and 1e, plot speed and lick profiles over distance for PI and passive tasks
    PyrBehALNoCue(pathData);
    
    % Figure 1h, plot the percentage of neurons with firing fields 
    % Firing fields are detected when align to start cue, over distance
    % comparing PI and passive tasks.
    plotPercNeuronsWithField(pathData)

