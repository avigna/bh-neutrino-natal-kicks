function figure_S2_CDF_neutrino_total_energy(save_flag,print_flag)
tic;
% Function to create Fig. S2 from Vigna-Gómez et al. (arXiv:2310.01509)
% link: https://ui.adsabs.harvard.edu/abs/2023arXiv231001509V/abstract
% See "Estimating neutrino asymmetries" in the Supplemental Material
% and caption of Fig. S2 for more details.

% DATA
% From Kresse, Ertl & Janka (2021)
% link: https://ui.adsabs.harvard.edu/abs/2021ApJ...909..169K/abstract
% Request accest to data: https://wwwmpa.mpa-garching.mpg.de/ccsnarchive/
M_2_3 = readmatrix('../data/Kresse2021/W18-BH2.3_He.txt','NumHeaderLines',16);
M_2_7 = readmatrix('../data/Kresse2021/W18-BH2.7_He.txt','NumHeaderLines',16);
M_3_1 = readmatrix('../data/Kresse2021/W18-BH3.1_He.txt','NumHeaderLines',16);
M_3_5 = readmatrix('../data/Kresse2021/W18-BH3.5_He.txt','NumHeaderLines',16);

% From the header of the data
% # ===============================================================================================================================
% # M_ZAMS:     zero-age main-sequence mass
% # M_He_ini:   initial helium-core mass
% # M_He_fin:   final helium-core mass at core collapse
% # M_CO_core:  final carbon/oxygen-core mass at core collapse
% # Mns_b:      final baryonic NS mass
% # Mns_g:      final gravitational NS mass (= Mns_b - E_nu/c^2)
% # Mns_b^lim:  baryonic NS mass limit = baryonic PNS mass at time of BH formation
% # Mns_g^lim:  gravitational PNS mass at time of BH formation (= Mns_b^lim - E_nu/c^2)
% # E_nu^tot:   total energy radiated in all species of neutrinos ("nu_ebar + nu_e + 4*nu_x")
% # E_nu/c^2:   mass decrement associated with the total radiated neutrino energy
% # t_BH:       time of BH formation
% # ===============================================================================================================================
% #  M_ZAMS    M_He_ini    M_He_fin   M_CO_core       Mns_b       Mns_g   Mns_b^lim   Mns_g^lim    E_nu^tot    E_nu/c^2        t_BH
% # (M_sun)     (M_sun)     (M_sun)     (M_sun)     (M_sun)     (M_sun)     (M_sun)     (M_sun) (10^53 erg)     (M_sun)         (s)
% # ===============================================================================================================================

% Find BHs
BH_idx_2_3  = find(~isnan(M_2_3(:,end))==1);
BH_idx_2_7  = find(~isnan(M_2_7(:,end))==1);
BH_idx_3_1  = find(~isnan(M_3_1(:,end))==1);
BH_idx_3_5  = find(~isnan(M_3_5(:,end))==1);

index_Enu   = 9;
min_E_nu    = min([min(M_2_3(BH_idx_2_3,index_Enu)) min(M_2_7(BH_idx_2_7,index_Enu)) min(M_3_1(BH_idx_3_1,index_Enu)) min(M_3_5(BH_idx_3_5,index_Enu))]);
max_E_nu    = max([max(M_2_3(BH_idx_2_3,index_Enu)) max(M_2_7(BH_idx_2_7,index_Enu)) max(M_3_1(BH_idx_3_1,index_Enu)) max(M_3_5(BH_idx_3_5,index_Enu))]);
min_dM_nu = min_E_nu*(10^53)/(AstroConstants.c_cgs*AstroConstants.c_cgs*AstroConstants.Msun_g);
max_dM_nu = max_E_nu*(10^53)/(AstroConstants.c_cgs*AstroConstants.c_cgs*AstroConstants.Msun_g);

if print_flag
    min_E_nu
    max_E_nu
    min_dM_nu
    max_dM_nu
end

% ANALYSIS
[x_2_3, CDF_2_3] = createEmpiricalCDF(M_2_3(BH_idx_2_3,index_Enu), ones(size(M_2_3(BH_idx_2_3,index_Enu))));
[x_2_7, CDF_2_7] = createEmpiricalCDF(M_2_7(BH_idx_2_7,index_Enu), ones(size(M_2_7(BH_idx_2_7,index_Enu))));
[x_3_1, CDF_3_1] = createEmpiricalCDF(M_3_1(BH_idx_3_1,index_Enu), ones(size(M_3_1(BH_idx_3_1,index_Enu))));
[x_3_5, CDF_3_5] = createEmpiricalCDF(M_3_5(BH_idx_3_5,index_Enu), ones(size(M_3_5(BH_idx_3_5,index_Enu))));

% PLOT
fs=18;
lw=2.0;
color1 = [        0    0.4470    0.7410];
color2 = [    0.8500    0.3250    0.0980];
color3 = [    0.9290    0.6940    0.1250];
color4 = [    0.4940    0.1840    0.5560];

clf
hold on

plot(x_2_3,CDF_2_3,'-','Color',color1,'LineWidth',lw,'Handlevisibility','on')
plot(x_2_7,CDF_2_7,'-','Color',color2,'LineWidth',lw,'Handlevisibility','on')
plot(x_3_1,CDF_3_1,'-','Color',color3,'LineWidth',lw,'Handlevisibility','on')
plot(x_3_5,CDF_3_5,'-','Color',color4,'LineWidth',lw,'Handlevisibility','on')

ylabel('$\rm{CDF}$','FontSize',fs,'Interpreter','Latex','FontName','Helvetica')

legend( '$\rm{M_{NS,b}^{lim}}=2.3\ \it{M_{\odot}}$',...
        '$\rm{M_{NS,b}^{lim}}=2.7\ \it{M_{\odot}}$',...
        '$\rm{M_{NS,b}^{lim}}=3.1\ \it{M_{\odot}}$',...
        '$\rm{M_{NS,b}^{lim}}=3.5\ \it{M_{\odot}}$',...
        'interpreter','latex',...
        'Location','Northwest',...
        'Box','off')

xlim([0 10.5]);
ylim([0 1]);
xticks([0:10]);
set(gca,'fontsize',fs)

hAx1=gca;                % get the first axis handle so can address each desired
hAx1.TickLabelInterpreter='latex';
xlabel(hAx1,'$E_{\nu}^{\rm{tot}}\ \rm{[10^{53}\ erg]}$','FontSize',fs,'Interpreter','Latex','FontName','Helvetica')

hAx2=axes('Position',hAx1.Position, ...
          'XAxisLocation','top', ...
          'YAxisLocation','right', ...
          'Color','none', ...
          'YTick',[],...
          'FontSize',fs,...
          'XLim',[0 10.5],...
          'XTick',[0:10]);
xticklabels(hAx2,{'0','0.06','0.11','0.17','0.22','0.28','0.34','0.39','0.45','0.5','0.56'})
xlabel(hAx2,'$dM_{\nu}\ [M_{\odot}]$','FontSize',fs,'Interpreter','Latex','FontName','Helvetica')
hAx2.TickLabelInterpreter='latex';

set(hAx1,'InnerPosition',[0.1300    0.1200    0.7750    0.73])
set(hAx2,'InnerPosition',[0.1300    0.1200    0.7750    0.73])

% SAVE PLOT
if save_flag
    saveas(gcf,strcat('../plots/pdf/Figure_SM_CDF_KDE_neutrino_total_energy.pdf'))
    saveas(gcf,strcat('../plots/png/Figure_SM_CDF_KDE_neutrino_total_energy.png'))
end

toc;
end