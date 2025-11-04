function Figure4Plots(pathData)
% All the plots in Figure4
% pathS: the path where the Figure4 data is stored.

    % Figure 4a and 4b, plot time vs distance deviance PyrUp and Pyrdown
    plotGLMDeviance(pathData);
        
    % Figure 4c-f, plot high and low speed comparison
    plotHighLowSpeed(pathData);

    % Figure 4g-j, plot early and late lick trial comparison
    plotEarlyLateLick(pathData);
    
    % Figure 4k and 4m, plot the pyrup and pyrdown profiles, high, mid and
    % low R
    plotPyrUpDown3(pathData);
    
    % Figure 4l and 4n, PyrUp and PyrDown tau
    plotTau(pathData);