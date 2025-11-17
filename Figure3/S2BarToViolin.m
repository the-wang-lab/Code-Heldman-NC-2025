% S2b
params = struct();
params.save_path = 'Z:\Raphael_tests\RebuttalAnalysis\ReplacingBarPlotsViolinOrBox\S2\S2b';
params.source_data_filename = 'Z:\Yingxue\Draft\PVBackUp06202025-NCManuscript\SourceData\SupFig2.xlsx';
params.sheet = 'Fig.S2b';
params.variable_names_excel = {'Neuron mod. freq. - LFP freq, no field (Hz)', 'Neuron mod. freq. - LFP freq, field (Hz)'};
params.variable_names_plot = {'Nofield', 'Withfield'};
params.xlim = [0.5 2.5];
params.ylim = [-3.7 3.7];
params.yticks = -3:3:3;
params.axisSize = [55 75];
params.colors = {[231 245 247]/255, [212 238 246]/255};
params.ShowData = false;
params.ViolinAlpha = [{0.7} {0.7}];

makeViolinFromBar(params);
close all

% S2c
params = struct();
params.save_path = 'Z:\Raphael_tests\RebuttalAnalysis\ReplacingBarPlotsViolinOrBox\S2\S2c';
params.source_data_filename = 'Z:\Yingxue\Draft\PVBackUp06202025-NCManuscript\SourceData\SupFig2.xlsx';
params.sheet = 'Fig.S2c';
params.variable_names_excel = {'Mean activity corr., cue onset aligned', 'Mean activity corr., run onset aligned'};
params.variable_names_plot = {'Cueonset', 'Runonset'};
params.xlim = [0.5 2.5];
params.ylim = [-0.1 1];
params.yticks = -0:0.5:1;
params.axisSize = [55 75];
params.colors = {[236 236 230]/255, [235 221 235]/255};
params.ShowData = false;
params.ViolinAlpha = [{0.7} {0.7}];

makeViolinFromBar(params);
close all


% S2d
params = struct();
params.save_path = 'Z:\Raphael_tests\RebuttalAnalysis\ReplacingBarPlotsViolinOrBox\S2\S2d';
params.source_data_filename = 'Z:\Yingxue\Draft\PVBackUp06202025-NCManuscript\SourceData\SupFig2.xlsx';
params.sheet = 'Fig.S2d';
params.variable_names_excel = {'Mean pop. corr., cue onset aligned', 'Mean pop. corr., run onset aligned'};
params.variable_names_plot = {'Cueonset', 'Runonset'};
params.xlim = [0.5 2.5];
params.ylim = [-0.1 1];
params.yticks = -0:0.5:1;
params.axisSize = [55 75];
params.colors = {[236 236 230]/255, [235 221 235]/255};
params.ShowData = false;
params.ViolinAlpha = [{0.7} {0.7}];

makeViolinFromBar(params);
close all

% S2e
params = struct();
params.save_path = 'Z:\Raphael_tests\RebuttalAnalysis\ReplacingBarPlotsViolinOrBox\S2\S2e';
params.source_data_filename = 'Z:\Yingxue\Draft\PVBackUp06202025-NCManuscript\SourceData\SupFig2.xlsx';
params.sheet = 'Fig.S2e';
params.variable_names_excel = {'Mean activity corr., passive', 'Mean activity corr., PI'};
params.variable_names_plot = {'Pass', 'PI'};
params.xlim = [0.5 2.5];
params.ylim = [-0.1 1];
params.yticks = -0:0.5:1;
params.axisSize = [55 75];
params.colors = {[243 196 214]/255, [120 59 150]/255};
params.ShowData = false;
params.ViolinAlpha = [{0.7} {0.7}];

makeViolinFromBar(params);
close all

% S2h
params = struct();
params.save_path = 'Z:\Raphael_tests\RebuttalAnalysis\ReplacingBarPlotsViolinOrBox\S2\S2h';
params.source_data_filename = 'Z:\Yingxue\Draft\PVBackUp06202025-NCManuscript\SourceData\SupFig2.xlsx';
params.sheet = 'Fig.S2h';
params.variable_names_excel = {'Mean speed per rec., passive (cm/s)', 'Mean speed per rec., PI (cm/s)'};
params.variable_names_plot = {'Pass', 'PI'};
params.FaceAlpha = [0.5 0.5];
params.BarWidth = 0.5; 
params.x_pos = [1 1.75];
params.xlim = [0.5 2.25];
params.ylim = [0 50];
params.yticks = 0:20:40;
params.axisSize = [55 50];
params.colors = {[243 196 214]/255, [120 59 150]/255};
makeBarPlotWithScatter(params);
close all;

% S2i
params = struct();
params.save_path = 'Z:\Raphael_tests\RebuttalAnalysis\ReplacingBarPlotsViolinOrBox\S2\S2i';
params.source_data_filename = 'Z:\Yingxue\Draft\PVBackUp06202025-NCManuscript\SourceData\SupFig2.xlsx';
params.sheet = 'Fig.S2i';
params.variable_names_excel = {'Mean num. licks/cm per rec., passive (cm/s)',...
                               'Mean num. licks/cm per rec., PI (cm/s)'};
params.variable_names_plot = {'Pass', 'PI'};
params.FaceAlpha = [0.5 0.5];
params.BarWidth = 0.5; 
params.x_pos = [1 1.75];
params.xlim = [0.5 2.25];
%params.ylim = [0 50];
%params.yticks = 0:20:40;
params.axisSize = [55 50];
params.colors = {[243 196 214]/255, [120 59 150]/255};
makeBarPlotWithScatter(params);
close all;




