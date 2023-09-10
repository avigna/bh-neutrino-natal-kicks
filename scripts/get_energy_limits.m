function [min_E_nu,max_E_nu] = get_energy_limits(M)
% Get energy limits from the numerical results from Kresse, Ertl & Janka (2021)
% https://ui.adsabs.harvard.edu/abs/2021ApJ...909..169K/abstract

% MACROS
index_Enu = 9;

% ANALYSIS
BH_idx = find(~isnan(M(:,end))==1);
min_E_nu = (10^53).*min(M(BH_idx,index_Enu));
max_E_nu = (10^53).*max(M(BH_idx,index_Enu));
end