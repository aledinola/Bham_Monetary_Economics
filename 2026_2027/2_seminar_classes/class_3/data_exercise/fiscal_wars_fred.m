% FISCAL_WARS_FRED Bring the one-period fiscal model to U.S. wartime data.
% LM Monetary Economics and the Macroeconomy, Seminar Class 3, 2026-2027.
% Run this entire script. It needs base MATLAB and internet access only for
% missing raw CSVs. If FRED rejects websave, curl on PATH is used as an HTTP
% fallback (included with current Windows). Cached runs need no curl/network.
% All inputs and outputs live beside this script.
% Figures describe historical associations, not causal fiscal multipliers.
% To refresh data deliberately, remove the raw CSVs first and recheck the
% FRED metadata below: national accounts and their reference year can change.

%% 1. Series definitions and provenance
exercise_dir = fileparts(mfilename('fullpath'));
series_id = ["GDPCA"; "PCECCA"; "GCECA"; "A824RE1A156NBEA"; ...
             "GDPC1"; "PCECC96"; "GCEC1"; "A824RE1Q156NBEA"];
series_title = repmat(["Real Gross Domestic Product"; ...
    "Real Personal Consumption Expenditures"; ...
    "Real Government Consumption Expenditures and Gross Investment"; ...
    "Shares of gross domestic product: Government consumption expenditures and gross investment: Federal: National defense"], 2, 1);
units = repmat([repmat("Billions of Chained 2017 Dollars",3,1); "Percent"],2,1);
frequency = [repmat("Annual",4,1); repmat("Quarterly",4,1)];
seasonal_adjustment = [repmat("Not Seasonally Adjusted",4,1); ...
    repmat("Seasonally Adjusted Annual Rate",3,1); "Not Seasonally Adjusted"];
source = repmat("U.S. Bureau of Economic Analysis",8,1);
source_url = "https://fred.stlouisfed.org/series/" + series_id;
download_url = "https://fred.stlouisfed.org/graph/fredgraph.csv?id=" + series_id;
metadata_verified_on = repmat("2026-09-27",8,1);
retrieved_utc = repmat("unknown (existing local file)",8,1);
first_observation = strings(8,1);
last_observation = strings(8,1);
metadata_file = fullfile(exercise_dir,'fred_series_metadata.csv');
if isfile(metadata_file)
    metadata_opts = detectImportOptions(metadata_file,'TextType','string');
    metadata_opts = setvartype(metadata_opts,metadata_opts.VariableNames,'string');
    previous_metadata = readtable(metadata_file,metadata_opts);
    for k = 1:numel(series_id)
        match = previous_metadata.series_id == series_id(k);
        if nnz(match) == 1
            retrieved_utc(k) = previous_metadata.retrieved_utc(match);
        end
    end
end

%% 2. Download missing files, then read and inspect every series
series_data = cell(8,1);
variable_names = ["gdp"; "cons"; "gov"; "def_share"];
use_curl = false;
for k = 1:numel(series_id)
    raw_file = fullfile(exercise_dir,series_id(k) + ".csv");
    is_new_download = ~isfile(raw_file);
    if is_new_download
        % Keep an interrupted download separate from a valid cached CSV.
        read_file = fullfile(exercise_dir,series_id(k) + ".download.csv");
        fprintf('Downloading %s from FRED...\n',series_id(k));
        if ~use_curl
            try
                websave(read_file,download_url(k),weboptions('Timeout',30));
            catch download_error
                % This recovery is limited to a failed HTTP download.
                warning('FRED:DownloadFallback', ...
                    'websave failed: %s\nTrying curl for missing files.',download_error.message);
                use_curl = true;
            end
        end
        if use_curl
            command = sprintf(['curl --fail --silent --show-error --location ' ...
                '--connect-timeout 15 --max-time 60 --output "%s" "%s"'], ...
                read_file,download_url(k));
            [status,message] = system(command);
            assert(status == 0,'FRED download failed for %s: %s',series_id(k),message);
        end
    else
        read_file = raw_file;
        fprintf('Reading cached %s.csv\n',series_id(k));
    end
    opts = detectImportOptions(read_file,'VariableNamingRule','preserve');
    assert(numel(opts.VariableNames) == 2 && ...
        string(opts.VariableNames{2}) == series_id(k), ...
        'Unexpected FRED CSV columns in %s.',read_file);
    opts = setvartype(opts,opts.VariableNames{1},'datetime');
    opts = setvaropts(opts,opts.VariableNames{1},'InputFormat','yyyy-MM-dd');
    opts = setvartype(opts,opts.VariableNames{2},'double');
    opts = setvaropts(opts,opts.VariableNames{2},'TreatAsMissing','.');
    raw = readtable(read_file,opts);
    dates = raw{:,1};
    values = raw{:,2};
    assert(~isempty(dates) && ~any(isnat(dates)) && ...
        all(diff(dates) > days(0)), 'Invalid or duplicate dates in %s.',read_file);
    assert(any(isfinite(values)) && ~any(isinf(values)), ...
        'No usable numeric observations in %s.',read_file);
    assert(all(day(dates) == 1), 'Expected period-start dates in %s.',read_file);
    if k <= 4
        assert(all(month(dates) == 1),'Expected annual dates in %s.',read_file);
    else
        assert(all(ismember(month(dates),[1 4 7 10])), ...
            'Expected quarterly dates in %s.',read_file);
    end
    if is_new_download
        movefile(read_file,raw_file,'f');
        retrieved_utc(k) = string(datetime('now','TimeZone','UTC', ...
            'Format','yyyy-MM-dd HH:mm:ss'));
    end
    first_observation(k) = string(dates(1),'yyyy-MM-dd');
    last_observation(k) = string(dates(end),'yyyy-MM-dd');
    fprintf('  %s to %s; %s; %s; %s\n',first_observation(k), ...
        last_observation(k),units(k),frequency(k),seasonal_adjustment(k));
    name = variable_names(mod(k-1,4)+1);
    series_data{k} = timetable(dates,values,'VariableNames',{char(name)});
    % Save provenance after each successful download, even if a later one fails.
    metadata = table(series_id,series_title,units,frequency,seasonal_adjustment, ...
        source,source_url,download_url,metadata_verified_on,retrieved_utc, ...
        first_observation,last_observation);
    writetable(metadata,metadata_file);
end

%% 3. Merge by date, select teaching windows and normalize real quantities
annual = synchronize(series_data{1:4},'union');
annual = annual(annual.dates >= datetime(1929,1,1) & ...
    annual.dates <= datetime(1960,1,1),:);
expected_annual_dates = datetime((1929:1960)',1,1);
assert(isequal(annual.dates,expected_annual_dates) && ...
    all(isfinite(annual{:,:}),'all'), ...
    'Annual data must cover 1929-1960 without missing observations.');
assert(all(annual{:,1:3} > 0,'all'),'Real annual quantities must be positive.');
base_annual = annual.dates == datetime(1939,1,1);
annual_indices = 100 .* annual{:,1:3} ./ annual{base_annual,1:3};
annual.gdp_index_1939 = annual_indices(:,1);
annual.cons_index_1939 = annual_indices(:,2);
annual.gov_index_1939 = annual_indices(:,3);
assert(all(abs(annual_indices(base_annual,:) - 100) < 1e-10), ...
    'Annual normalization failed.');
writetable(timetable2table(annual),fullfile(exercise_dir,'fiscal_wars_processed.csv'));

quarterly = synchronize(series_data{5:8},'union');
quarterly = quarterly(quarterly.dates >= datetime(1947,1,1) & ...
    quarterly.dates <= datetime(1955,10,1),:);
expected_quarterly_dates = (datetime(1947,1,1):calmonths(3):datetime(1955,10,1))';
assert(isequal(quarterly.dates,expected_quarterly_dates) && ...
    all(isfinite(quarterly{:,:}),'all'), ...
    'Quarterly data must cover 1947Q1-1955Q4 without missing observations.');
assert(all(quarterly{:,1:3} > 0,'all'),'Real quarterly quantities must be positive.');
base_quarterly = quarterly.dates == datetime(1950,1,1);
quarterly_indices = 100 .* quarterly{:,1:3} ./ quarterly{base_quarterly,1:3};
quarterly.gdp_index_1950q1 = quarterly_indices(:,1);
quarterly.cons_index_1950q1 = quarterly_indices(:,2);
quarterly.gov_index_1950q1 = quarterly_indices(:,3);
assert(all(abs(quarterly_indices(base_quarterly,:) - 100) < 1e-10), ...
    'Quarterly normalization failed.');
writetable(timetable2table(quarterly), ...
    fullfile(exercise_dir,'fiscal_wars_quarterly_processed.csv'));

%% 4. Annual WWII quantities (separate indices, not additive components)
plot_colors = [0.00 0.32 0.62; 0.83 0.30 0.05; 0.43 0.20 0.57];
wwii = year(annual.dates) >= 1935 & year(annual.dates) <= 1950;
fig_wwii = figure('Color','w','Units','centimeters','Position',[2 2 24 9.5]);
ax = axes(fig_wwii);
hold(ax,'on');
plot(ax,year(annual.dates(wwii)),annual.gdp_index_1939(wwii), ...
    '-','Color',plot_colors(1,:),'LineWidth',2.2);
plot(ax,year(annual.dates(wwii)),annual.cons_index_1939(wwii), ...
    '--','Color',plot_colors(2,:),'LineWidth',2.2);
plot(ax,year(annual.dates(wwii)),annual.gov_index_1939(wwii), ...
    '-.','Color',plot_colors(3,:),'LineWidth',2.2);
yline(ax,100,':','Color',[0.5 0.5 0.5],'HandleVisibility','off');
xline(ax,1941,':','HandleVisibility','off');
xline(ax,1945,':','HandleVisibility','off');
xlim(ax,[1935 1950]);
xticks(ax,1935:3:1950);
xlabel(ax,'Year');
ylabel(ax,'Index, 1939 = 100');
title(ax,'World War II: output, consumption, and government purchases','FontSize',16);
legend(ax,{'Y: real GDP','C: real consumption','G: real government purchases'}, ...
    'Location','northwest','Box','off','FontSize',14);
set(ax,'FontName','Arial','FontSize',16,'Box','off','TickDir','out','YGrid','on');
exportgraphics(fig_wwii,fullfile(exercise_dir,'wwii_y_c_g.pdf'), ...
    'ContentType','vector','BackgroundColor','white');

%% 5. Defense purchases share: use the published percent series directly
fig_defense = figure('Color','w','Units','centimeters','Position',[2 2 24 9.5]);
ax = axes(fig_defense);
plot(ax,year(annual.dates),annual.def_share,'-','Color',plot_colors(1,:), ...
    'LineWidth',2.2);
hold(ax,'on');
wwii_window = year(annual.dates) >= 1941 & year(annual.dates) <= 1945;
korea_window = year(annual.dates) >= 1950 & year(annual.dates) <= 1953;
wwii_rows = find(wwii_window);
korea_rows = find(korea_window);
[wwii_peak,position] = max(annual.def_share(wwii_window));
wwii_peak_year = year(annual.dates(wwii_rows(position)));
[korea_peak,position] = max(annual.def_share(korea_window));
korea_peak_year = year(annual.dates(korea_rows(position)));
text(ax,wwii_peak_year,wwii_peak+2, ...
    sprintf('WWII: %.1f%% (%d)',wwii_peak,wwii_peak_year), ...
    'HorizontalAlignment','center','FontSize',14);
text(ax,korea_peak_year,korea_peak+2, ...
    sprintf('Korean War: %.1f%% (%d)',korea_peak,korea_peak_year), ...
    'HorizontalAlignment','center','FontSize',14);
xlim(ax,[1929 1960]);
ylim(ax,[0 ceil((wwii_peak+5)/5)*5]);
xticks(ax,[1929 1935 1940 1945 1950 1955 1960]);
xlabel(ax,'Year');
ylabel(ax,'Percent of GDP');
title(ax,'Federal national defense purchases as a share of GDP','FontSize',16);
set(ax,'FontName','Arial','FontSize',16,'Box','off','TickDir','out','YGrid','on');
exportgraphics(fig_defense,fullfile(exercise_dir,'defense_share_gdp.pdf'), ...
    'ContentType','vector','BackgroundColor','white');

%% 6. Korean War appendix: quarterly real quantities, 1950Q1 = 100
quarter_year = year(quarterly.dates) + (month(quarterly.dates)-1)/12;
fig_korea = figure('Color','w','Units','centimeters','Position',[2 2 24 9.5]);
ax = axes(fig_korea);
hold(ax,'on');
plot(ax,quarter_year,quarterly.gdp_index_1950q1,'-', ...
    'Color',plot_colors(1,:),'LineWidth',2.2);
plot(ax,quarter_year,quarterly.cons_index_1950q1,'--', ...
    'Color',plot_colors(2,:),'LineWidth',2.2);
plot(ax,quarter_year,quarterly.gov_index_1950q1,'-.', ...
    'Color',plot_colors(3,:),'LineWidth',2.2);
yline(ax,100,':','Color',[0.5 0.5 0.5],'HandleVisibility','off');
xlim(ax,[1947 1955.75]);
xticks(ax,1947:1955);
xlabel(ax,'Year (quarterly observations)');
ylabel(ax,'Index, 1950Q1 = 100');
title(ax,'Korean War: output, consumption, and government purchases','FontSize',16);
legend(ax,{'Y: real GDP','C: real consumption','G: real government purchases'}, ...
    'Location','northwest','Box','off','FontSize',14);
set(ax,'FontName','Arial','FontSize',16,'Box','off','TickDir','out','YGrid','on');
exportgraphics(fig_korea,fullfile(exercise_dir,'korean_war_y_c_g.pdf'), ...
    'ContentType','vector','BackgroundColor','white');

%% 7. Transparent numerical checks and descriptive classroom facts
fprintf('\nAnnual normalization, 1939: %g %g %g\n',annual_indices(base_annual,:));
fprintf('Quarterly normalization, 1950Q1: %g %g %g\n',quarterly_indices(base_quarterly,:));
disp(timetable2table(annual(year(annual.dates) >= 1939 & year(annual.dates) <= 1945,:)));
fprintf('Defense peaks: WWII %.1f%% in %d; Korean War %.1f%% in %d.\n', ...
    wwii_peak,wwii_peak_year,korea_peak,korea_peak_year);
fprintf('Descriptive associations only: no causal multiplier is estimated.\n');
fprintf('Outputs saved in %s\n',exercise_dir);
