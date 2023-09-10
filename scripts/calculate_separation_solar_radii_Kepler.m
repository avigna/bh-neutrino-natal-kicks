function a_Rsol = calculate_separation_solar_radii_Kepler(M1_Msun,M2_Msun,P_days)
% Solving Kepler's equation

AU_to_Rsol  = 215.032;
year_to_day = 365;
a_AU = (((P_days./year_to_day).^2).*(M1_Msun+M2_Msun)).^(1.0/3.0);
a_Rsol = a_AU.*AU_to_Rsol;

end