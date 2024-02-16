function figure_S4_neutrino_emission_asymmetry_analysis_energy(save_flag,print_flag)
tic;
% Function to create Fig. S4 from Vigna-Gómez et al. (arXiv:2310.01509)
% link: https://ui.adsabs.harvard.edu/abs/2023arXiv231001509V/abstract
% See "Estimating neutrino asymmetries" in the Supplemental Material
% and caption of Fig. S4 for more details.

% DATA
% From Kresse, Ertl & Janka (2021)
% link: https://ui.adsabs.harvard.edu/abs/2021ApJ...909..169K/abstract
% Request accest to data: https://wwwmpa.mpa-garching.mpg.de/ccsnarchive/
M_2_3 = readmatrix('../data/Kresse2021/W18-BH2.3_He.txt','NumHeaderLines',16);
M_2_7 = readmatrix('../data/Kresse2021/W18-BH2.7_He.txt','NumHeaderLines',16);
M_3_1 = readmatrix('../data/Kresse2021/W18-BH3.1_He.txt','NumHeaderLines',16);
M_3_5 = readmatrix('../data/Kresse2021/W18-BH3.5_He.txt','NumHeaderLines',16);

% Get energy limits
[min_E_nu_2_3,max_E_nu_2_3] = get_energy_limits(M_2_3);
[min_E_nu_2_7,max_E_nu_2_7] = get_energy_limits(M_2_7);
[min_E_nu_3_1,max_E_nu_3_1] = get_energy_limits(M_3_1);
[min_E_nu_3_5,max_E_nu_3_5] = get_energy_limits(M_3_5);
min_E_nu = min([min(min_E_nu_2_3) min(min_E_nu_2_7) min(min_E_nu_3_1) min(min_E_nu_3_5)]);
max_E_nu = max([max(max_E_nu_2_3) max(max_E_nu_2_7) max(max_E_nu_3_1) max(max_E_nu_3_5)]);

% From our analysis: https://github.com/reinhold-willcox/BH_neutrinos
v_nu_max    = round(60);
v_nu_peak   = 3;
v_nu_68     = 8.0;
v_nu_95     = 27.0;
v_nu_99     = 47.0;

% ANALYSIS
% function [X,Y,alpha_solved] = get_asymmetry_parameter(M, M_protoNS, M_BH, print_flag)
chosen_mass_Msun = 10.0;
[X,Y,alpha_solved] = get_asymmetry_parameter(chosen_mass_Msun, min_E_nu, max_E_nu ,v_nu_max,print_flag);

% PRINT
if print_flag
    disp("Energy limits:")
    round(min_E_nu,1)
    round(max_E_nu,1)
    disp("Alpha values:")
    min(min(alpha_solved))    
    max(max(alpha_solved))
end

% PLOT
fs=18;

clf
hold on
xlabel('$\rm E^{tot}_{\nu}\ [erg]$','FontSize',fs,'FontName','Helvetica','Interpreter','latex')
ylabel('$\rm \it{v}_{\nu,\rm{kick}}\ \rm [km\ s^{-1}]$','FontSize',fs,'FontName','Helvetica','Interpreter','latex')

xaxisproperties= get(gca, 'XAxis');
xaxisproperties.TickLabelInterpreter = 'latex'; % latex for x-axis
yaxisproperties= get(gca, 'YAxis');
yaxisproperties.TickLabelInterpreter = 'latex'; % latex for y-axis

cbar=colorbar;
cbar.TickLabelInterpreter='latex';    
cbar.Label.Interpreter = 'latex';
cbar.Label.FontSize=fs;    
set(gca,'ColorScale','log')
colormap(bone)
xticks([1:10].*10^53)
cbar.Label.String='$\rm \alpha_{\nu}$';
ax=gca;
ax.FontSize=fs;
cbar.FontSize=fs;
box on

contourf(X,Y,alpha_solved,400, 'LineStyle','none')
yline(v_nu_peak,'--','Color','r','LineWidth',4.0)
yline(v_nu_68,'Color','r','LineWidth',4.0)
yline(v_nu_95,'Color','r','LineWidth',2.0)
yline(v_nu_99,'Color','r','LineWidth',0.1)

% SAVE
if save_flag
    saveas(gcf,strcat('../plots/pdf/Figure_SM_asymmetry.pdf'))
    saveas(gcf,strcat('../plots/png/Figure_SM_asymmetry.png'))
end

toc;
end