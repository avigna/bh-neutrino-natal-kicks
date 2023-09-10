function neutrino_mass_decrements
tic;

% MACROS
c_cgs = 2.99792458*10^10;
solar_mass_to_grams = 1.989e+33;

% LOAD DATA

% Data from Kresse et al. (2021)
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

M_2_3 = readmatrix('../data/Kresse2021/W18-BH2.3_He.txt','NumHeaderLines',16);
M_2_7 = readmatrix('../data/Kresse2021/W18-BH2.7_He.txt','NumHeaderLines',16);
M_3_1 = readmatrix('../data/Kresse2021/W18-BH3.1_He.txt','NumHeaderLines',16);
M_3_5 = readmatrix('../data/Kresse2021/W18-BH3.5_He.txt','NumHeaderLines',16);

% Find BHs
BH_idx_2_3 = find(~isnan(M_2_3(:,end))==1);
BH_idx_2_7 = find(~isnan(M_2_7(:,end))==1);
BH_idx_3_1 = find(~isnan(M_3_1(:,end))==1);
BH_idx_3_5 = find(~isnan(M_3_5(:,end))==1);

index_Enu = 9;
min_E_nu = min([min(M_2_3(BH_idx_2_3,index_Enu)) min(M_2_7(BH_idx_2_7,index_Enu)) min(M_3_1(BH_idx_3_1,index_Enu)) min(M_3_5(BH_idx_3_5,index_Enu))])
max_E_nu = max([max(M_2_3(BH_idx_2_3,index_Enu)) max(M_2_7(BH_idx_2_7,index_Enu)) max(M_3_1(BH_idx_3_1,index_Enu)) max(M_3_5(BH_idx_3_5,index_Enu))])

% min_E_nu_M_2_3 = min(M_2_3(BH_idx_2_3,index_Enu))
% min_E_nu_M_2_7 = min(M_2_7(BH_idx_2_7,index_Enu))
% min_E_nu_M_3_1 = min(M_3_1(BH_idx_3_1,index_Enu))
% min_E_nu_M_3_5 = min(M_3_5(BH_idx_3_5,index_Enu))

index_dM_nu = 10;
min_dM_nu = min([min(M_2_3(BH_idx_2_3,index_dM_nu)) min(M_2_7(BH_idx_2_7,index_dM_nu)) min(M_3_1(BH_idx_3_1,index_dM_nu)) min(M_3_5(BH_idx_3_5,index_dM_nu))])
max_dM_nu = max([max(M_2_3(BH_idx_2_3,index_dM_nu)) max(M_2_7(BH_idx_2_7,index_dM_nu)) max(M_3_1(BH_idx_3_1,index_dM_nu)) max(M_3_5(BH_idx_3_5,index_dM_nu))])

min_E_nu*(10^53)/(c_cgs*c_cgs*solar_mass_to_grams)
max_E_nu*(10^53)/(c_cgs*c_cgs*solar_mass_to_grams)

% Find values for VFTS 243
[a_2_3, idx_2_3] = min(abs(M_2_3(BH_idx_2_3,4)-9.1));
% M_2_3(BH_idx_2_3(idx_2_3),4)
M_2_3(BH_idx_2_3(idx_2_3),10)

[a_2_7, idx_2_7] = min(abs(M_2_7(BH_idx_2_7,4)-9.1));
% M_2_7(BH_idx_2_7(idx_2_7),4)
M_2_7(BH_idx_2_7(idx_2_7),10)

[a_3_1, idx_3_1] = min(abs(M_3_1(BH_idx_3_1,4)-9.1));
% M_3_1(BH_idx_3_1(idx_3_1),4)
M_3_1(BH_idx_3_1(idx_3_1),10)

[a_3_5, idx_3_5] = min(abs(M_3_5(BH_idx_3_5,4)-9.1));
% M_3_5(BH_idx_3_5(idx_3_5),4)
M_3_5(BH_idx_3_5(idx_3_5),10)

% PLOT
fs=16;
lw=2.0;
greyColor=0.7.*[1 1 1];

val_num = 4;
clf
subplot(2,2,1)
hold on
scatter(M_2_3(BH_idx_2_3,val_num),M_2_3(BH_idx_2_3,10),'filled')
scatter(M_2_7(BH_idx_2_7,val_num),M_2_7(BH_idx_2_7,10),'filled')
scatter(M_3_1(BH_idx_3_1,val_num),M_3_1(BH_idx_3_1,10),'filled')
scatter(M_3_5(BH_idx_3_5,val_num),M_3_5(BH_idx_3_5,10),'filled')
xline(9.1,'LineWidth',lw)
xline(8.1,'LineWidth',lw)
xline(10.1,'LineWidth',lw)

legend( 'NS_{bar}^{max}=2.3 Msun',...
        'NS_{bar}^{max}=2.7 Msun',...
        'NS_{bar}^{max}=3.1 Msun',...
        'NS_{bar}^{max}=3.5 Msun')

title('Kresse, Ertl & Janka (2021)')
xlabel('$M_{\rm{CO}}\ \rm{[Msun}]$','FontSize',fs,'Interpreter','Latex','FontName','Helvetica')
ylabel('$dM_{\nu}$\ \rm{[Msun}]','FontSize',fs,'Interpreter','Latex','FontName','Helvetica')

ax=gca;
ax.FontSize=fs;
box on

subplot(2,2,2)
hold on
scatter(M_2_3(BH_idx_2_3,val_num),M_2_3(BH_idx_2_3,9),'filled')
scatter(M_2_7(BH_idx_2_7,val_num),M_2_7(BH_idx_2_7,9),'filled')
scatter(M_3_1(BH_idx_3_1,val_num),M_3_1(BH_idx_3_1,9),'filled')
scatter(M_3_5(BH_idx_3_5,val_num),M_3_5(BH_idx_3_5,9),'filled')
xlabel('$M_{\rm{CO}}\ \rm{[Msun}]$','FontSize',fs,'Interpreter','Latex','FontName','Helvetica')
ylabel('$E_{\nu}^{\rm{tot}}$\ \rm{[erg}]','FontSize',fs,'Interpreter','Latex','FontName','Helvetica')

xline(9.1,'LineWidth',lw)
xline(8.1,'LineWidth',lw)
xline(10.1,'LineWidth',lw)

ax=gca;
ax.FontSize=fs;
box on

val_num=3;
subplot(2,2,3)
hold on
scatter(M_2_3(BH_idx_2_3,val_num),M_2_3(BH_idx_2_3,10),'filled')
scatter(M_2_7(BH_idx_2_7,val_num),M_2_7(BH_idx_2_7,10),'filled')
scatter(M_3_1(BH_idx_3_1,val_num),M_3_1(BH_idx_3_1,10),'filled')
scatter(M_3_5(BH_idx_3_5,val_num),M_3_5(BH_idx_3_5,10),'filled')
xlabel('$M_{\rm{HE}}\ \rm{[Msun}]$','FontSize',fs,'Interpreter','Latex','FontName','Helvetica')
ylabel('$dM_{\nu}$\ \rm{[Msun}]','FontSize',fs,'Interpreter','Latex','FontName','Helvetica')

pts = linspace(0,0.6,61);
ax=gca;
ax.FontSize=fs;
box on

% KDE calculator
bw=0.015;
[f_2_3,xi_2_3,bw_2_3] = ksdensity(M_2_3(BH_idx_2_3,10),pts,'Bandwidth',bw,'Function','cdf'); 
[f_2_7,xi_2_7,bw_2_7] = ksdensity(M_2_7(BH_idx_2_3,10),pts,'Bandwidth',bw,'Function','cdf'); 
[f_3_1,xi_3_1,bw_3_1] = ksdensity(M_3_1(BH_idx_2_3,10),pts,'Bandwidth',bw,'Function','cdf'); 
[f_3_5,xi_3_5,bw_3_5] = ksdensity(M_3_5(BH_idx_2_3,10),pts,'Bandwidth',bw,'Function','cdf'); 
% [f_2_3,xi_2_3,bw_2_3] = ksdensity(M_2_3(BH_idx_2_3,10),pts); 
% [f_2_7,xi_2_7,bw_2_7] = ksdensity(M_2_7(BH_idx_2_3,10),pts); 
% [f_3_1,xi_3_1,bw_3_1] = ksdensity(M_3_1(BH_idx_2_3,10),pts); 
% [f_3_5,xi_3_5,bw_3_5] = ksdensity(M_3_5(BH_idx_2_3,10),pts); 


subplot(2,2,4)
hold on

ax=gca;
ax.FontSize=fs;
box on
toc;

end