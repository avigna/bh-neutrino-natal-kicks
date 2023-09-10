function data_Kresse
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

index_M_ZAMS    = 1;
index_M_He_ini  = 2;
index_M_He_fin  = 3;
index_M_CO_core = 4;

index_Enu = 9;
min_E_nu = min([min(M_2_3(BH_idx_2_3,index_Enu)) min(M_2_7(BH_idx_2_7,index_Enu)) min(M_3_1(BH_idx_3_1,index_Enu)) min(M_3_5(BH_idx_3_5,index_Enu))])
max_E_nu = max([max(M_2_3(BH_idx_2_3,index_Enu)) max(M_2_7(BH_idx_2_7,index_Enu)) max(M_3_1(BH_idx_3_1,index_Enu)) max(M_3_5(BH_idx_3_5,index_Enu))])

index_dM_nu = 10;
min_dM_nu = min([min(M_2_3(BH_idx_2_3,index_dM_nu)) min(M_2_7(BH_idx_2_7,index_dM_nu)) min(M_3_1(BH_idx_3_1,index_dM_nu)) min(M_3_5(BH_idx_3_5,index_dM_nu))])
max_dM_nu = max([max(M_2_3(BH_idx_2_3,index_dM_nu)) max(M_2_7(BH_idx_2_7,index_dM_nu)) max(M_3_1(BH_idx_3_1,index_dM_nu)) max(M_3_5(BH_idx_3_5,index_dM_nu))])

index_t_BH  = 11;

M_2_3_reduced   = [ M_2_3(BH_idx_2_3,index_M_ZAMS) ...
                    M_2_3(BH_idx_2_3,index_M_He_ini) ...
                    M_2_3(BH_idx_2_3,index_M_He_ini) ...
                    M_2_3(BH_idx_2_3,index_M_CO_core) ...
                    M_2_3(BH_idx_2_3,index_Enu) ...
                    M_2_3(BH_idx_2_3,index_dM_nu) ...
                    M_2_3(BH_idx_2_3,index_t_BH)];

M_2_7_reduced   = [ M_2_7(BH_idx_2_7,index_M_ZAMS) ...
                    M_2_7(BH_idx_2_7,index_M_He_ini) ...
                    M_2_7(BH_idx_2_7,index_M_He_ini) ...
                    M_2_7(BH_idx_2_7,index_M_CO_core) ...
                    M_2_7(BH_idx_2_7,index_Enu) ...
                    M_2_7(BH_idx_2_7,index_dM_nu) ...
                    M_2_7(BH_idx_2_7,index_t_BH)];

xnames = {'M_{ZAMS}','M_{He,ini}','M_{He,fin}','M_{CO,core}','E_{nu}^{tot}','dM_{nu}','t_{BH}'};

clf
hold on
gplotmatrix([M_2_3_reduced]);


toc;
end