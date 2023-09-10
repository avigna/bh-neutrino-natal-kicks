function [X,Y,alpha_solved] = get_asymmetry_parameter(M_BH, min_E_nu, max_E_nu, v_nu_max, debug_flag)
% Based on the analysis from Janka (2013)
% https://ui.adsabs.harvard.edu/abs/2013MNRAS.434.1355J/abstract
% and
% the numerical results from Kresse, Ertl & Janka (2021)
% https://ui.adsabs.harvard.edu/abs/2021ApJ...909..169K/abstract

if debug_flag
    display('Mass BH:')
    M_BH
end

% CONSTANTS
c_cgs                           = 2.99792458*10^10;
solar_mass_to_gram              = 1.98847*10^33;
km_per_second_to_cm_per_second  = 100000;

% MACROS
index_Enu = 9;

% FUNCTIONS
alpha = @(mBH,v,E) mBH.*v.*c_cgs./E;

% CHECKS OF FUNCTION
if debug_flag
    display('Checking function:')
    alpha(9.1*solar_mass_to_gram,4.0.*km_per_second_to_cm_per_second,5.3614e+53)
    alpha(10.1*solar_mass_to_gram,100.*km_per_second_to_cm_per_second,10^53)
    alpha(8.1*solar_mass_to_gram,3.5.*km_per_second_to_cm_per_second,10^54)
    alpha(8.1*solar_mass_to_gram,3.5.*km_per_second_to_cm_per_second,10^53)
end

% ANALYSIS
min_dM_nu_Msun  = (min_E_nu./(c_cgs^2))./solar_mass_to_gram;
max_dM_nu_Msun  = (max_E_nu./(c_cgs^2))./solar_mass_to_gram;
energy          = linspace(min_E_nu,max_E_nu,101);
velocity        = logspace(0,log10(v_nu_max),101);
[X,Y]           = meshgrid(energy,velocity);
mass_BH_g       = M_BH.*ones(size(X)).*solar_mass_to_gram;
alpha_solved    = alpha(mass_BH_g,Y.*km_per_second_to_cm_per_second,X);

if debug_flag
    min_E_nu
    max_E_nu
    min_dM_nu_Msun
    max_dM_nu_Msun
    min(min(alpha_solved))
    max(max(alpha_solved))
end

end