function plot_time_vs_distance_deviance_loglog(pathS, filename, all_glm_results)
% PLOT_TIME_VS_DISTANCE_DEVIANCE_LOGLOG
% Log-log scatter and marginal histograms for time vs distance deviance
%
% Inputs:
%   all_glm_results - struct with fields:
%      .dev_TD_T_model (deviance explained by time given D+S+H)
%      .dev_TD_D_model (deviance explained by distance given T+S+H)
%      .pval_TD_T_model, .pval_TD_D_model

    % Extract and filter data
    dev_time = all_glm_results.dev_TD_T_model;
    dev_dist = all_glm_results.dev_TD_D_model;
    pval_time = all_glm_results.pval_TD_T_model;
    pval_dist = all_glm_results.pval_TD_D_model;

    valid = ~isnan(dev_time) & ~isnan(dev_dist) & dev_time > 0 & dev_dist > 0 & ...
            ~isnan(pval_time) & ~isnan(pval_dist);

    dev_time = dev_time(valid);
    dev_dist = dev_dist(valid);
    pval_time = pval_time(valid);
    pval_dist = pval_dist(valid);
    num_valid_neurons = sum(valid);

    if isempty(dev_time)
        warning('No valid data to plot.');
        return;
    end

    % Significance groups
    alpha = 0.05;
    sig_time_only = (pval_time < alpha) & (pval_dist >= alpha);
    sig_dist_only = (pval_time >= alpha) & (pval_dist < alpha);
    sig_both      = (pval_time < alpha) & (pval_dist < alpha);
    sig_neither   = (pval_time >= alpha) & (pval_dist >= alpha);

    % Compute common log bins (same as scatter limits)
    min_lim = floor(log10(min([dev_time; dev_dist])));
    max_lim = ceil(log10(max([dev_time; dev_dist])));
    edges = logspace(min_lim, max_lim, 21); % 10 bins

    % Figure
    figure('Position', [100 100 520 520]);

    % Scatter plot (main, bottom left)
    scatter_ax = subplot('Position', [0.25 0.25 0.55 0.55]);
    hold on;
    if any(sig_neither), scatter(dev_time(sig_neither), dev_dist(sig_neither), 36, [0.7 0.7 0.7], 'filled', 'o', 'MarkerEdgeColor', 'k'); end
    if any(sig_time_only), scatter(dev_time(sig_time_only), dev_dist(sig_time_only), 36, 'c', 'filled', 'o', 'MarkerEdgeColor', 'k'); end
    if any(sig_dist_only), scatter(dev_time(sig_dist_only), dev_dist(sig_dist_only), 36, 'r', 'filled', 'o', 'MarkerEdgeColor', 'k'); end
    if any(sig_both), scatter(dev_time(sig_both), dev_dist(sig_both), 36, 'm', 'filled', 'o', 'MarkerEdgeColor', 'k'); end
    % Unity line
    lims = [edges(1), edges(end)];
    plot(lims, lims, 'k--', 'LineWidth', 1);
    set(gca, 'XScale', 'log', 'YScale', 'log');
    xlabel('Deviance by Time');
    ylabel('Deviance by Distance');
    title('Deviance: Time vs. Distance');
    legend({'Neither Sig','Time Sig','Dist Sig','Both Sig','Unity'}, 'Location', 'best');
    grid on; axis square;
    xlim(lims); ylim(lims);
    hold off;

    % Marginal histogram for dev_time (top, log scale x)
    axes('Position', [0.25 0.81 0.55 0.13]);
    histogram(dev_time, edges, 'FaceColor', [0.5 0.5 1], 'EdgeColor', 'k');
    set(gca, 'XScale', 'log');
    set(gca, 'XTickLabel', []);
    ylabel('Count');
    xlim(lims); box off; axis tight;

    % Marginal histogram for dev_dist (right, log scale y)
    axes('Position', [0.81 0.25 0.13 0.55]);
    histogram(dev_dist, edges, 'FaceColor', [1 0.5 0.5], 'EdgeColor', 'k', 'Orientation', 'horizontal');
    set(gca, 'YScale', 'log');
    set(gca, 'YTickLabel', []);
    xlabel('Count');
    ylim(lims); box off; axis tight;

    % Print summary statistics
    fprintf('Median Deviance (Time): %.2f\n', median(dev_time));
    fprintf('Median Deviance (Distance): %.2f\n', median(dev_dist));
    N = numel(dev_time);
    fprintf('Neurons: Time only: %d, Dist only: %d, Both: %d, Neither: %d\n', ...
        sum(sig_time_only), sum(sig_dist_only), sum(sig_both), sum(sig_neither));

    % Wilcoxon signed-rank test (if enough data)
    if N >= 10
        [pval, ~, stats] = ranksum(dev_time, dev_dist);
        fprintf('Wilcoxon rank-sum p=%.1e, z=%.2f\n', pval, stats.zval);
    end

    % Tidy up tick marks on the main scatter plot
    axes(scatter_ax);
    xticks_vals = edges;
    yticks_vals = edges;
    set(scatter_ax, 'XTick', xticks_vals, 'YTick', yticks_vals)
    set(scatter_ax, 'XMinorTick', 'off', 'YMinorTick', 'off')
    
    % Count significant neurons
    fprintf('Neurons significantly modulated by:\n');
    fprintf('  Time only: %d (%.1f%%)\n', sum(sig_time_only), 100*sum(sig_time_only)/num_valid_neurons);
    fprintf('  Distance only: %d (%.1f%%)\n', sum(sig_dist_only), 100*sum(sig_dist_only)/num_valid_neurons);
    fprintf('  Both Time and Distance: %d (%.1f%%)\n', sum(sig_both), 100*sum(sig_both)/num_valid_neurons);
    fprintf('  Neither: %d (%.1f%%)\n', sum(sig_neither), 100*sum(sig_neither)/num_valid_neurons);

    title_str = sprintf('T(%.1f%%) D(%.1f%%) TD(%.1f%%) p(%.1e)',100*sum(sig_time_only)/num_valid_neurons,...
        100*sum(sig_dist_only)/num_valid_neurons,100*sum(sig_both)/num_valid_neurons,pval);
    title(title_str);
    
    savefig([pathS filename '.fig']);
    print('-painters', '-dpdf', [pathS filename], '-r600');
end