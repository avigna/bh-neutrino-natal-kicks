classdef AstroConstants
   properties (Constant)
   c_mks        = 2.99792458e8  % m/s 
   G_mks        = 6.67259e-11   % m/kgs
   G_AUMsunyr   = 4*pi*pi   % AU^3 yr^-2 M^-1  
   Msun_kg      = 1.9891e30     % Sun mass (kg)
   Rsun_m       = 6.957e+8      % Sun radius (m)
   AU_to_m      = 1.496e+11     % AU in m
   AU_to_Rsun   = 215.032       % AU in Rsun
   s_to_yr      = 3.171e-8;     % s in yr   
   yr_to_Myr    = 10^-6;        % yr in Myr
   end
end