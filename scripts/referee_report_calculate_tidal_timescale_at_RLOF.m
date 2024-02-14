function referee_report_calculate_tidal_timescale_at_RLOF(print_flag)
tic;

% Estimate of the e-folding circularization timescale from energy dissipation via the dynamical tide.
% Based on Hurley et al. (2002)
% link: https://ui.adsabs.harvard.edu/abs/2002MNRAS.329..897H/abstract
E2 = @(M) (1.592*10^-9)*M.^(2.84); % Eq. 43 from Hurley et al. (2002)
q2 = @(M,Mcomp) Mcomp./M;
tau_circ_dyn_yr = @(M,Mcomp,R,a) 1.0/((21.0/2).*sqrt(AstroConstants.G_AUMsunyr.*M./(R.^3)).*q2(M,Mcomp).*((1+q2(M,Mcomp)).^(11.0/6)).*E2(M)*(R./a).^(21.0/2)); % Eq. 41 from Hurley et al. (2002)

% Estimate of the main-sequence lifetime for a massive star
% Fit from Farr & Mandel (2018)
% link: https://ui.adsabs.harvard.edu/abs/2018Sci...361.6506F/abstract
tauMainSequence_Myr = @(M) exp(9.1973 - (3.8955*log(M)) + (0.6107*log(M).^2) ...
                        - (0.0332*log(M).^3));  % Eq. 1 from Farr & Mandel (2018)

% VFTS 243 progenitor according to Supplementary Figure 13 of Shenar et al.
% (2022)
% link: https://ui.adsabs.harvard.edu/abs/2022NatAs...6.1085S/abstract
M1_Msun             = 30.1;
M2_Msun             = 21.9;
P_day               = 3.71;
separation_AU       = 0.17507;
separation_Rsun     = separation_AU*AstroConstants.AU_to_Rsun;
radius_1_AU         = separation_AU*calculateRocheRadius(M1_Msun,M2_Msun); % Limit when R=R_{RL}
radius_2_AU         = separation_AU/2; % Limit when R=a/2
radius_1_Rsun       = radius_1_AU*AstroConstants.AU_to_Rsun;
radius_2_Rsun       = radius_2_AU*AstroConstants.AU_to_Rsun;
tau_circ_dyn_yr_1   = tau_circ_dyn_yr(M1_Msun,M2_Msun,radius_1_AU,separation_AU);
tau_circ_dyn_yr_2   = tau_circ_dyn_yr(M1_Msun,M2_Msun,radius_2_AU,separation_AU);
tau_MS_30_Msun_yr  = tauMainSequence_Myr(30)*10^6;

% Print
if print_flag
    M1_Msun
    M2_Msun
    P_day
    separation_Rsun
    radius_1_Rsun
    radius_2_Rsun
    tau_circ_dyn_yr_1
    tau_circ_dyn_yr_2
    tau_MS_30_Msun_yr
end

toc;
end