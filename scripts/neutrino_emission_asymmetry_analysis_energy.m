function neutrino_emission_asymmetry_analysis_energy(save_flag,debug_flag)
tic;

% DATA
% From Kresse, Ertl & Janka (2021)
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

% E_nu_peak_2_3   = 1.3650*10^53;
% E_nu_peak_2_7   = 6.4050*10^53;
% E_nu_peak_3_1   = 7.8750*10^53;
% E_nu_peak_3_5   = 9.4500*10^53;    

% From our analysis: https://github.com/reinhold-willcox/BH_neutrinos
% v_nu_max        = round(20.0);
v_nu_max        = round(91.56677272795208);

v_nu_peak   = 3.0;
v_nu_68     = 7.7;
v_nu_95     = 27.9;
v_nu_99     = 75.2;

% ANALYSIS
% function [X,Y,alpha_solved] = get_asymmetry_parameter(M, M_protoNS, M_BH, debug_flag)
[X,Y,alpha_solved] = get_asymmetry_parameter(9.0, min_E_nu, max_E_nu ,v_nu_max,debug_flag);

if debug_flag
    display("Energy limits:")
    round(min_E_nu,1)
    round(max_E_nu,1)
    display("Alpha values:")
    min(min(alpha_solved))    
    max(max(alpha_solved))
end

% PLOT
fs=16;
% color1 = [0.9290 0.6940 0.1250];
% color2 = [0.8500 0.3250 0.0980];

clf
% Generic choices for plot
hold on
xlabel('$\rm E^{tot}_{\nu}\ [erg]$','FontSize',fs,'FontName','Helvetica','Interpreter','latex')
ylabel('$\rm \it{v}_{\nu,\rm{kick}}\ \rm [km\ s^{-1}]$','FontSize',fs,'FontName','Helvetica','Interpreter','latex')
set(gca,'ColorScale','log')
colormap(bone)
xticks([1:10].*10^53)
cbar=colorbar;
cbar.Label.String='$\rm \alpha_{\nu}$';
cbar.Label.Interpreter = 'latex';
cbar.Label.FontSize=fs;
ax=gca;
ax.FontSize=fs;
box on

contourf(X,Y,alpha_solved,400, 'LineStyle','none')
yline(v_nu_peak,'--','Color','r','LineWidth',3.0)
yline(v_nu_68,'Color','r','LineWidth',2.0)
yline(v_nu_95,'Color','r','LineWidth',1.0)
yline(v_nu_99,'Color','r','LineWidth',0.5)

% SAVE
if save_flag
    saveas(gcf,strcat('../plots/pdf/Figure_App_asymmetry.pdf'))
    saveas(gcf,strcat('../plots/png/Figure_App_asymmetry.png'))
end

toc;
end