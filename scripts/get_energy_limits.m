function [min_E_nu,max_E_nu] = get_energy_limits(M)
% Get energy limits from the numerical results from Kresse, Ertl & Janka (2021)
% link: https://ui.adsabs.harvard.edu/abs/2021ApJ...909..169K/abstract
% Request accest to data: https://wwwmpa.mpa-garching.mpg.de/ccsnarchive/

% MACROS
index_Enu = 9;

% ANALYSIS
BH_idx = find(~isnan(M(:,end))==1);
min_E_nu = 1e+53.*min(M(BH_idx,index_Enu));
max_E_nu = 1e+53.*max(M(BH_idx,index_Enu));

end