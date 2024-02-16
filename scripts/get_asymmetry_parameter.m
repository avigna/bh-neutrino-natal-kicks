function [X,Y,alpha_solved] = get_asymmetry_parameter(M_BH, min_E_nu, max_E_nu, v_nu_max, print_flag)
% Based on the analysis from Janka (2013)
% link: https://ui.adsabs.harvard.edu/abs/2013MNRAS.434.1355J/abstract
% and
% the numerical results from Kresse, Ertl & Janka (2021)
% link: https://ui.adsabs.harvard.edu/abs/2021ApJ...909..169K/abstract
% Request accest to data: https://wwwmpa.mpa-garching.mpg.de/ccsnarchive/

if print_flag
    disp('Begin get_asymmetry_parameter function')
    disp('Mass BH [Msun]:')
    M_BH
end

% MACROS
index_Enu = 9;

% FUNCTIONS
alpha = @(mBH,v,E) mBH.*v.*AstroConstants.c_cgs./E;
% mBH is mass of the black hole in g
% v is kick magnitude in cm/s
% E is explosion energy in erg

% CHECKS OF FUNCTION
if print_flag
    disp('Checking function (test of alpha):')
    alpha(9.1*AstroConstants.Msun_g,4.0.*AstroConstants.km_to_cm,5.3614e+53)
    alpha(10.1*AstroConstants.Msun_g,100.*AstroConstants.km_to_cm,1e+53)
    alpha(8.1*AstroConstants.Msun_g,3.5.*AstroConstants.km_to_cm,1e+54)
    alpha(8.1*AstroConstants.Msun_g,3.5.*AstroConstants.km_to_cm,1e+53)
end

% ANALYSIS
min_dM_nu_Msun      = (min_E_nu./(AstroConstants.c_cgs^2))./AstroConstants.Msun_g;
max_dM_nu_Msun      = (max_E_nu./(AstroConstants.c_cgs^2))./AstroConstants.Msun_g;
energy              = linspace(min_E_nu,max_E_nu,101);
velocity            = logspace(0,log10(v_nu_max),101);
[X,Y]               = meshgrid(energy,velocity);
mass_BH_g           = M_BH.*ones(size(X)).*AstroConstants.Msun_g;
alpha_solved        = alpha(mass_BH_g,Y.*AstroConstants.km_to_cm,X);
min_alpha_solved    = min(min(alpha_solved));
max_alpha_solved    = max(max(alpha_solved));

% PRINT
if print_flag
    min_E_nu
    max_E_nu
    min_dM_nu_Msun
    max_dM_nu_Msun
    min_alpha_solved
    max_alpha_solved
    disp('End get_asymmetry_parameter function')    
end

end