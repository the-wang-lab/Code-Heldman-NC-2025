function makeViolinFromBar(vars, params)
    color_list = [];
    for i = 1:length(params.variable_names_plot)
        color_list = [color_list; params.colors{i}];
    end

    % optional parameters
    if ~isfield(params, 'MarkerSize') % default
        params.MarkerSize = 5;
    end

    if ~isfield(params, 'MedianMarkerSize') % default
        params.MedianMarkerSize = 10;
    end

    if ~isfield(params, 'ShowData') % default
        params.ShowData = true;
    end

    if ~isfield(params, 'ViolinAlpha') % default
        params.ViolinAlpha = [{0.3} {0.3}];
    end


    figure(1); clf;
    set(gcf, 'Units', 'normalized');

     % Create axes
    ax = axes(gcf);
    ax.Units = 'normalized'; % CRITICAL: Set axes units to normalized

    % Set axes position using normalized coordinates.
    % These values are ratios relative to the figure's drawable area.
    % [left_normalized bottom_normalized width_normalized height_normalized]
    
    % Example normalized positions for a common layout:
    % 0.1 means 10% from left/bottom, 0.8 means 80% width/height of the figure.
    left_normalized = 0.1;  % 15% from the left edge of the figure
    bottom_normalized = 0.1; % 15% from the bottom edge of the figure
    width_normalized = 0.8;   % 70% of the figure's width
    height_normalized = 0.8;  % 70% of the figure's height

    ax.Position = [left_normalized, bottom_normalized, ...
                   width_normalized, height_normalized];
    % 
    % set(gcf, 'PaperUnits', 'inches');
    % set(gcf, 'PaperSize', [8 6]); % Example: 8x6 inches for the final saved output
    % set(gcf, 'PaperPosition', [0 0 8 6]); % Fill the entire paper size
    % 
    ax.XAxis.TickLabelFormat = '%g'; % ensure numeric labels
    ax.YAxis.TickLabelFormat = '%g';
    ax.XAxis.Color = [0 0 0];
    ax.YAxis.Color = [0 0 0];
    set(gca, 'FontSize',10);
    vp = violinplot(vars,params.variable_names_plot, 'ViolinColor', color_list,...
                                           'GroupOrder', params.variable_names_plot,...
                                           'EdgeColor', [1 1 1],...
                                           'MarkerSize',params.MarkerSize,...
                                           'MedianMarkerSize',params.MedianMarkerSize,...
                                           'ShowData', params.ShowData);
                                          
     for i = 1:length(vp)
         vp(i).EdgeColor = params.colors{i};
         vp(i).ViolinAlpha = {params.ViolinAlpha{i}};
%        vp(i).BoxColor = params.colors{i};        
     end

    if isfield(params, 'yticks')
        yticks(params.yticks);
    end

    if isfield(params, 'xlim')
        xlim(params.xlim);
    end

    if isfield(params, 'sig_line')
        %addSignificanceLines(gca, params.sig_line, params.sig_str)
        level = 1;
        for i = 1:size(params.sig_line,1)
            addSignificanceLine(params.sig_line(i,1), params.sig_line(i,2),...
                params.start_line, level, char(params.sig_str{i}));
            level = level + 1;
        end
    end

    if isfield(params, 'ylim')
        ylim(params.ylim);
    end

    if isfield(params, 'xtickAngle')
        xtickangle(params.xtickAngle);
    else
        xtickangle(0);
    end


    box off; 

    saveas(gcf,[params.save_path params.filename '.png']);
    savefig(gcf,[params.save_path params.filename '.fig']);
    exportgraphics(gcf, [params.save_path params.filename '.pdf'], 'ContentType', 'vector', 'Resolution',600);
end