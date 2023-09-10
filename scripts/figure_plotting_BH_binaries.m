function figure_plotting_BH_binaries(save_flag, debug_flag)
tic;

% DATA

% HD 130298
% Mahy et al. (2022)
% Orbital period 14.6 days
% spectroscopicmass of 24.2±3.8Msun. 
% The parameters predicted from BONN-SAI give an evolutionary mass of 28.0+5.2−4.1 Msun. 
% With aminimum mass estimated to 7.7Msun for the secondary
HD130298_mass_primary_spectroscopic         = 24.2;
HD130298_mass_primary_spectroscopic_errors  = 3.8;
HD130298_mass_primary_BONNSAI               = 28.0;
HD130298_mass_primary_BONNSAI_error_plus    = 5.2;
HD130298_mass_primary_BONNSAI_error_minus   = 4.1;
HD130298_mass_secondary_minimum             = 7.7;
HD130298_mass_secondary_minimum_error_plus  = 1.5;
HD130298_mass_secondary_minimum_error_minus = 1.5;
HD130298_eccentricity                       = 0.457;

HD130298_orbital_period_days        = 14.62959;
HD130298_radius                     = 10.0;
HD130298_effective_roche_radius     = calculateRocheRadius(HD130298_mass_primary_spectroscopic,HD130298_mass_secondary_minimum);
HD130298_separation_Rsol            = calculate_separation_solar_radii_Kepler(HD130298_mass_primary_spectroscopic,HD130298_mass_secondary_minimum,HD130298_orbital_period_days);
HD130298_roche_radius               = HD130298_effective_roche_radius.*HD130298_separation_Rsol;
HD130298_roche_factor               = HD130298_radius/HD130298_roche_radius;

if debug_flag
    display('HD130298')
    HD130298_mass_secondary_minimum+HD130298_mass_primary_spectroscopic
    HD130298_eccentricity
    HD130298_roche_factor
end

% VFTS 243
% Shenar et al. (2022a)
% https://ui.adsabs.harvard.edu/abs/2022NatAs...6.1085S/abstract
VFTS243_mass_primary_spectroscopic          = 27;
VFTS243_mass_primary_spectroscopic_errors   = 4;
VFTS243_mass_primary_BONNSAI                = 26;
VFTS243_mass_primary_BONNSAI_error_plus     = 2;
VFTS243_mass_primary_BONNSAI_error_minus    = 2;
VFTS243_mass_secondary_minimum              = 9.1;
VFTS243_mass_secondary_minimum_error_plus   = 1.0;
VFTS243_mass_secondary_minimum_error_minus  = 1.0;
VFTS243_eccentricity                        = 0.017;
VFTS243_eccentricity_error_plus             = 0.012;
VFTS243_eccentricity_error_minus            = 0.012;

VFTS243_orbital_period_days        = 10.4031;
VFTS243_radius                     = 10.3;
VFTS243_effective_roche_radius     = calculateRocheRadius(VFTS243_mass_primary_spectroscopic,VFTS243_mass_secondary_minimum);
VFTS243_separation_Rsol            = calculate_separation_solar_radii_Kepler(VFTS243_mass_primary_spectroscopic,VFTS243_mass_secondary_minimum,VFTS243_orbital_period_days);
VFTS243_roche_radius               = VFTS243_effective_roche_radius.*VFTS243_separation_Rsol;
VFTS243_roche_factor               = VFTS243_radius/VFTS243_roche_radius;
% 0.33

if debug_flag
    display('VFTS 243')
    VFTS243_mass_secondary_minimum+VFTS243_mass_primary_spectroscopic
    VFTS243_eccentricity
    VFTS243_roche_factor
end

% VFTS 514
% Shenar et al. (2022b)
% https://ui.adsabs.harvard.edu/abs/2022A%26A...665A.148S/abstract
VFTS514_mass_primary_spectroscopic          = 19;
VFTS514_mass_primary_spectroscopic_errors   = 3;
VFTS514_mass_primary_BONNSAI                = 15;
VFTS514_mass_primary_BONNSAI_error_plus     = 2;
VFTS514_mass_primary_BONNSAI_error_minus    = 2;
VFTS514_mass_secondary_minimum              = 4.5;
VFTS514_mass_secondary_minimum_error_plus   = 0.5;
VFTS514_mass_secondary_minimum_error_minus  = 0.5;
VFTS514_eccentricity                        = 0.411;
VFTS514_eccentricity_error_plus             = 0.019;
VFTS514_eccentricity_error_minus            = 0.019;

VFTS514_orbital_period_days        = 184.92;
% VFTS514_radius                     = ;
% VFTS514_effective_roche_radius     = calculateRocheRadius(VFTS514_mass_primary_spectroscopic,VFTS514_mass_secondary_minimum);
% VFTS514_separation_Rsol            = calculate_separation_solar_radii_Kepler(VFTS514_mass_primary_spectroscopic,VFTS514_mass_secondary_minimum,VFTS514_orbital_period_days);
% VFTS514_roche_radius               = VFTS514_effective_roche_radius.*VFTS514_separation_Rsol;
VFTS514_roche_factor               = [];
% 
% if debug_flag
% end
if debug_flag
    display('VFTS 514')
    VFTS514_mass_secondary_minimum+VFTS514_mass_primary_spectroscopic
    VFTS514_eccentricity
    VFTS514_roche_factor
    
end

% VFTS 779
% Shenar et al. (2022b)
% https://ui.adsabs.harvard.edu/abs/2022A%26A...665A.148S/abstract
VFTS779_mass_primary_spectroscopic          = 14;
VFTS779_mass_primary_spectroscopic_errors   = 4;
VFTS779_mass_primary_BONNSAI                = 12;
VFTS779_mass_primary_BONNSAI_error_plus     = 3;
VFTS779_mass_primary_BONNSAI_error_minus    = 2;
VFTS779_mass_secondary_minimum              = 3.9;
VFTS779_mass_secondary_minimum_error_plus   = 0.6;
VFTS779_mass_secondary_minimum_error_minus  = 0.7;
VFTS779_eccentricity                        = 0.046;
VFTS779_eccentricity_error_plus             = 0.011;
VFTS779_eccentricity_error_minus            = 0.011;

VFTS779_orbital_period_days        = 59.9;

if debug_flag
    display('VFTS 779')
    VFTS779_mass_secondary_minimum+VFTS779_mass_primary_spectroscopic
    VFTS779_eccentricity
end

% CygnusX1
% Miller-Jones et al. (2022)
% https://ui.adsabs.harvard.edu/abs/2021Sci...371.1046M/abstract
CygnusX1_mass_primary_median                = 40.6;
CygnusX1_mass_primary_mode                  = 39.8;
CygnusX1_mass_primary_lower_bound           = 33.5;
CygnusX1_mass_primary_upper_bound           = 48.3;
CygnusX1_black_hole_mass_median             = 21.2;
CygnusX1_black_hole_mass_mode               = 21.4;
CygnusX1_black_hole_mass_lower_bound        = 18.9;
CygnusX1_black_hole_mass_upper_bound        = 23.4;
CygnusX1_eccentricity_median                = 0.0189;
CygnusX1_eccentricity_mode                  = 0.0186;
CygnusX1_eccentricity_lower_bound           = 0.0163;
CygnusX1_eccentricity_upper_bound           = 0.0217;

% https://ui.adsabs.harvard.edu/abs/1999A%26A...343..861B/abstract
CygnusX1_orbital_period_days                = 5.599829;
CygnusX1_roche_factor                       = 0.99;

if debug_flag
    display('Cyg X-1')
    CygnusX1_black_hole_mass_median+CygnusX1_mass_primary_median
    CygnusX1_eccentricity_median
end

% M33 X-7
% Ramachandran et al. (2022)
% https://ui.adsabs.harvard.edu/abs/2022A%26A...667A..77R/abstract
M33_X_7_mass_primary_spectroscopic              = 38;
M33_X_7_mass_primary_spectroscopic_error_plus   = 22;
M33_X_7_mass_primary_spectroscopic_error_minus  = 10;
M33_X_7_black_hole_mass                         = 11.4;
M33_X_7_black_hole_mass_error_plus              = 3.3;
M33_X_7_black_hole_mass_error_minus             = 1.7;
M33_X_7_eccentricity                            = 0.0185;
M33_X_7_eccentricity_error_plus                 = 0.0077;
M33_X_7_eccentricity_error_minus                = 0.0077;

M33_X_7_orbital_period_days        = 3.45301;
M33_X_7_radius                     = 20.5;
% M33_X_7_effective_roche_radius     = calculateRocheRadius(M33_X_7_mass_primary_spectroscopic,M33_X_7_black_hole_mass);
% M33_X_7_separation_Rsol            = calculate_separation_solar_radii_Kepler(M33_X_7_mass_primary_spectroscopic,M33_X_7_black_hole_mass,M33_X_7_orbital_period_days);
% M33_X_7_roche_radius               = M33_X_7_effective_roche_radius.*M33_X_7_separation_Rsol;
% M33_X_7_roche_factor               = M33_X_7_radius/M33_X_7_roche_radius;

M33_X_7_roche_factor = 0.84;

if debug_flag
    display('M33 X-7')
    M33_X_7_black_hole_mass+M33_X_7_mass_primary_spectroscopic
    M33_X_7_eccentricity
    M33_X_7_roche_factor
end

% HD 96670
% Gomez & Grindlay (2021)
% https://ui.adsabs.harvard.edu/abs/2021ApJ...913...48G/abstract
% % Model 1
% HD96670_mass_primary_spectroscopic              = 22.0;
% HD96670_mass_primary_spectroscopic_error_plus   = 6.5;
% HD96670_mass_primary_spectroscopic_error_minus  = 6.5;
% HD96670_black_hole_mass                         = 4.6;
% HD96670_black_hole_mass_error_plus              = 0.1;
% HD96670_black_hole_mass_error_minus             = 0.1;
% HD96670_eccentricity                            = 0.28;
% HD96670_eccentricity_error_plus                 = 0.01;
% HD96670_eccentricity_error_minus                = 0.01;
% Model 2
HD96670_mass_primary_spectroscopic              = 22.7;
HD96670_mass_primary_spectroscopic_error_plus   = 5.2;
HD96670_mass_primary_spectroscopic_error_minus  = 3.6;
HD96670_black_hole_mass                         = 6.2;
HD96670_black_hole_mass_error_plus              = 0.9;
HD96670_black_hole_mass_error_minus             = 0.7;
HD96670_eccentricity                            = 0.12;
HD96670_eccentricity_error_plus                 = 0.01;
HD96670_eccentricity_error_minus                = 0.01;

HD96670_orbital_period_days        = 5.28388;
HD96670_radius                     = 17.1;
HD96670_effective_roche_radius     = calculateRocheRadius(HD96670_mass_primary_spectroscopic,HD96670_black_hole_mass);
HD96670_separation_Rsol            = calculate_separation_solar_radii_Kepler(HD96670_mass_primary_spectroscopic,HD96670_black_hole_mass,HD96670_orbital_period_days);
HD96670_roche_radius               = HD96670_effective_roche_radius.*HD96670_separation_Rsol;
HD96670_roche_factor               = HD96670_radius/HD96670_roche_radius;

if debug_flag
    display('HD96670')
    HD96670_black_hole_mass+HD96670_mass_primary_spectroscopic
    HD96670_eccentricity
    HD96670_roche_factor
end

% LMC X-1
% https://ui.adsabs.harvard.edu/abs/2009ApJ...697..573O/abstract
% https://iopscience.iop.org/article/10.1088/1538-3873/aa7407
LMC_X_1_mass_primary                            = 30.62;
LMC_X_1_mass_primary_error_plus                 = 3.17;
LMC_X_1_mass_primary_error_minus                = 3.17;
LMC_X_1_eccentricity                            = 0.0256;
LMC_X_1_eccentricity_error_plus                 = 0.0066;
LMC_X_1_eccentricity_error_minus                = 0.0066;
LMC_X_1_black_hole_mass                         = 10.30;
LMC_X_1_black_hole_mass_error_plus              = 1.18;
LMC_X_1_black_hole_mass_error_minus             = 1.18;

LMC_X_1_roche_factor                = 0.886;
LMC_X_1_orbital_period_days         = 3.90917;

if debug_flag
    display('LMC X-1')
    LMC_X_1_black_hole_mass+LMC_X_1_mass_primary
    LMC_X_1_eccentricity
    LMC_X_1_roche_factor
end

% SS 433
% Picchi et al. (2020)
% https://ui.adsabs.harvard.edu/abs/2020A%26A...640A..96P/abstract
SS_433_mass_primary                             = 11.3;
SS_433_mass_primary_error_plus                  = 0.6;
SS_433_mass_primary_error_minus                 = 0.6;
SS_433_eccentricity                             = 0.05;
SS_433_eccentricity_error_plus                  = 0.01;
SS_433_eccentricity_error_minus                 = 0.01;
SS_433_black_hole_mass                          = 4.2;
SS_433_black_hole_mass_error_plus               = 0.4;
SS_433_black_hole_mass_error_minus              = 0.4;

SS_433_orbital_period_days        = 13.08;
% SS_433_radius                     = [];
% SS_433_effective_roche_radius     = calculateRocheRadius(SS_433_mass_primary,SS_433_black_hole_mass);
% SS_433_separation_Rsol            = 58.3;
% SS_433_roche_radius               = SS_433_effective_roche_radius.*SS_433_separation_Rsol
SS_433_roche_factor               = 1;

if debug_flag
    display('SS 433')
    SS_433_black_hole_mass+SS_433_mass_primary
    SS_433_eccentricity
    SS_433_roche_factor
end

% Gaia BH1
% El-Badry et al. (2023)
% https://ui.adsabs.harvard.edu/abs/2023MNRAS.518.1057E/abstract
Gaia_BH1_mass_primary                             = 0.93;
Gaia_BH1_mass_primary_error_plus                  = 0.05;
Gaia_BH1_mass_primary_error_minus                 = 0.05;
Gaia_BH1_eccentricity                             = 0.451;
Gaia_BH1_eccentricity_error_plus                  = 0.005;
Gaia_BH1_eccentricity_error_minus                 = 0.005;
Gaia_BH1_black_hole_mass                          = 9.62;
Gaia_BH1_black_hole_mass_error_plus               = 0.18;
Gaia_BH1_black_hole_mass_error_minus              = 0.18;

Gaia_BH1_orbital_period_days        = 185.59;
Gaia_BH1_radius                     = 0.99;
Gaia_BH1_effective_roche_radius     = calculateRocheRadius(Gaia_BH1_mass_primary,Gaia_BH1_black_hole_mass);
Gaia_BH1_separation_Rsol            = calculate_separation_solar_radii_Kepler(Gaia_BH1_mass_primary,Gaia_BH1_black_hole_mass,Gaia_BH1_orbital_period_days);
Gaia_BH1_roche_radius               = Gaia_BH1_effective_roche_radius.*Gaia_BH1_separation_Rsol;
Gaia_BH1_roche_factor               = Gaia_BH1_radius/Gaia_BH1_roche_radius;

if debug_flag
    display('Gaia BH-1')
    Gaia_BH1_black_hole_mass+Gaia_BH1_mass_primary
    Gaia_BH1_eccentricity
    Gaia_BH1_roche_factor
end

% Gaia BH2
% El-Badry et al.
% https://ui.adsabs.harvard.edu/abs/2023arXiv230207880E/abstract
Gaia_BH2_mass_primary                             = 1.07;
Gaia_BH2_mass_primary_error_plus                  = 0.19;
Gaia_BH2_mass_primary_error_minus                 = 0.19;
Gaia_BH2_eccentricity                             = 0.518;
Gaia_BH2_eccentricity_error_plus                  = 0.002;
Gaia_BH2_eccentricity_error_minus                 = 0.002;
Gaia_BH2_black_hole_mass                          = 8.93;
Gaia_BH2_black_hole_mass_error_plus               = 0.33;
Gaia_BH2_black_hole_mass_error_minus              = 0.33;

Gaia_BH2_orbital_period_days        = 1276.7;
Gaia_BH2_radius                     = 7.7;
Gaia_BH2_effective_roche_radius     = calculateRocheRadius(Gaia_BH2_mass_primary,Gaia_BH2_black_hole_mass);
Gaia_BH2_separation_Rsol            = calculate_separation_solar_radii_Kepler(Gaia_BH2_mass_primary,Gaia_BH2_black_hole_mass,Gaia_BH2_orbital_period_days);
Gaia_BH2_roche_radius               = Gaia_BH2_effective_roche_radius.*Gaia_BH2_separation_Rsol;
Gaia_BH2_roche_factor               = Gaia_BH2_radius/Gaia_BH2_roche_radius;

if debug_flag
    display('Gaia BH-2')
    Gaia_BH2_black_hole_mass+Gaia_BH2_mass_primary
    Gaia_BH2_eccentricity
    Gaia_BH2_roche_factor
end

% 2MASS J05215658+4359220
% Thompson et al.
% https://ui.adsabs.harvard.edu/abs/2019Sci...366..637T
MASS_mass_primary                             = 3.0;
MASS_mass_primary_error_plus                  = 1.0;
MASS_mass_primary_error_minus                 = 1.0;
MASS_eccentricity                             = 0.00476;
MASS_eccentricity_error_plus                  = 0.00255;
MASS_eccentricity_error_minus                 = 0.00255;
MASS_black_hole_mass                          = 3.3;
MASS_black_hole_mass_error_plus               = 2.8;
MASS_black_hole_mass_error_minus              = 0.7;

MASS_orbital_period_days        = 83.205; % ± 0.064
MASS_radius                     = 30.0;
MASS_effective_roche_radius     = calculateRocheRadius(MASS_mass_primary,MASS_black_hole_mass);
MASS_separation_Rsol            = calculate_separation_solar_radii_Kepler(MASS_mass_primary,MASS_black_hole_mass,MASS_orbital_period_days);
MASS_roche_radius               = MASS_effective_roche_radius.*MASS_separation_Rsol;
MASS_roche_factor               = MASS_radius/MASS_roche_radius;

if debug_flag
    display('2MASS J05215658+4359220')
    MASS_black_hole_mass+MASS_mass_primary
    MASS_eccentricity
    MASS_roche_factor
end

% % NGC1850 BH1 
% % Saracino et al.
% % https://ui.adsabs.harvard.edu/abs/2023MNRAS.521.3162S/abstract
% NGC1850_BH1_mass_primary                             = ;
% NGC1850_BH1_mass_primary_error_plus                  = ;
% NGC1850_BH1_mass_primary_error_minus                 = ;
% NGC1850_BH1_eccentricity                             = ;
% NGC1850_BH1_eccentricity_error_plus                  = ;
% NGC1850_BH1_eccentricity_error_minus                 = ;
% NGC1850_BH1_black_hole_mass                          = ;
% NGC1850_BH1_black_hole_mass_error_plus               = ;
% NGC1850_BH1_black_hole_mass_error_minus              = ;
% 
% NGC1850_BH1_orbital_period_days        = ;
% NGC1850_BH1_radius                     = ;
% NGC1850_BH1_effective_roche_radius     = calculateRocheRadius(NGC1850_BH1_mass_primary,NGC1850_BH1_black_hole_mass);
% NGC1850_BH1_separation_Rsol            = calculate_separation_solar_radii_Kepler(NGC1850_BH1_mass_primary,NGC1850_BH1_black_hole_mass,NGC1850_BH1_orbital_period_days);
% NGC1850_BH1_roche_radius               = NGC1850_BH1_effective_roche_radius.*NGC1850_BH1_separation_Rsol;
% NGC1850_BH1_roche_factor               = NGC1850_BH1_radius/NGC1850_BH1_roche_radius;
% 
% if debug_flag
%     display('NGC1850 BH1')
%     NGC1850_BH1_black_hole_mass+NGC1850_BH1_mass_primary
%     NGC1850_BH1_eccentricity
%     NGC1850_BH1_roche_factor
% end

% PLOT
sz=100;
fs=16;
sz2=10;
fs2=13;
lw=1.0;
grey = 0.5.*[1 1 1];
blue1 = [0    0.4470    0.7410];
gaiagreen = [0.4660    0.6740    0.1880];
% errorbar(x,y,yneg,ypos,xneg,xpos,'o')

clf
hold on
ylabel('$M_{*}\ [M_{\odot}]$','FontSize',fs,'FontName','Helvetica','Interpreter','latex')
xlabel('$M_{\rm{BH}}\ [M_{\odot}]$','FontSize',fs,'FontName','Helvetica','Interpreter','latex')
ylim([-0.5 60.5])
xticks([0:2:24]);
ax=gca;
ax.FontSize=fs;
box on

plot([0 14],[0 14],'k','HandleVisibility','off')
plot([19 25],[19 25],'k','HandleVisibility','off')
h=text(14.25,14.25,'$M_{*}=M_{\rm{BH}}$','Interpreter','latex','FontName','Helvetica','FontSize',fs);
set(h,'Rotation',20);

plot(100,100,'o','MarkerSize',sz2,'Color','k')
plot(100,100,'^','MarkerSize',sz2,'Color','k')
plot(100,100,'hexagram','MarkerSize',sz2,'Color','k')
plot(100,100,'s','MarkerSize',sz2,'Color','k')
legend( 'HMXB','SB1','Astrometry','Photometry',...
        'FontSize',fs,...
        'Location','SouthEast',...
        'Box','off',...
        'FontName','Helvetica',...
        'Interpreter','latex')

% HD130298
errorbar(   HD130298_mass_secondary_minimum,...
            HD130298_mass_primary_spectroscopic,...
            HD130298_mass_primary_spectroscopic_errors,...
            HD130298_mass_primary_spectroscopic_errors,...
            HD130298_mass_secondary_minimum_error_minus,...
            HD130298_mass_secondary_minimum_error_plus,'k','HandleVisibility','off')
text(7.5,19,'HD130298',FontSize=fs2);

% VFTS243
errorbar(   VFTS243_mass_secondary_minimum,...
            VFTS243_mass_primary_spectroscopic,...
            VFTS243_mass_primary_spectroscopic_errors,...
            VFTS243_mass_primary_spectroscopic_errors,...
            VFTS243_mass_secondary_minimum_error_minus,...
            VFTS243_mass_secondary_minimum_error_plus,'k','HandleVisibility','off')
text(10,24,'VFTS 243',FontSize=fs2);

% VFTS514
errorbar(   VFTS514_mass_secondary_minimum,...
            VFTS514_mass_primary_spectroscopic,...
            VFTS514_mass_primary_spectroscopic_errors,...
            VFTS514_mass_primary_spectroscopic_errors,...
            VFTS514_mass_secondary_minimum_error_minus,...
            VFTS514_mass_secondary_minimum_error_plus,'k','HandleVisibility','off')
text(1,23.5,'VFTS 514',FontSize=fs2);

% VFTS779
errorbar(   VFTS779_mass_secondary_minimum,...
            VFTS779_mass_primary_spectroscopic,...
            VFTS779_mass_primary_spectroscopic_errors,...
            VFTS779_mass_primary_spectroscopic_errors,...
            VFTS779_mass_secondary_minimum_error_minus,...
            VFTS779_mass_secondary_minimum_error_plus,'k','HandleVisibility','off')
text(0.15,16,'VFTS 779',FontSize=fs2);

% CygnusX1
errorbar(   CygnusX1_black_hole_mass_median,...
            CygnusX1_mass_primary_median, ...
            CygnusX1_mass_primary_median-CygnusX1_mass_primary_lower_bound,...
            CygnusX1_mass_primary_upper_bound-CygnusX1_mass_primary_median,...
            CygnusX1_black_hole_mass_median-CygnusX1_black_hole_mass_lower_bound,...
            CygnusX1_black_hole_mass_upper_bound-CygnusX1_black_hole_mass_median,'Color',grey,'HandleVisibility','off')
text(20,32,'Cyg X-1','Color','k','FontSize',fs2);

% M33_X_7
errorbar(   M33_X_7_black_hole_mass,...
            M33_X_7_mass_primary_spectroscopic, ...
            M33_X_7_mass_primary_spectroscopic_error_minus,...
            M33_X_7_mass_primary_spectroscopic_error_plus,...
            M33_X_7_black_hole_mass_error_minus,...
            M33_X_7_black_hole_mass_error_plus,'Color',grey,'HandleVisibility','off')
text(12,41,'M33 X-7','Color','k','FontSize',fs2);

% HD 96670
errorbar(   HD96670_black_hole_mass,...
            HD96670_mass_primary_spectroscopic, ...
            HD96670_mass_primary_spectroscopic_error_minus,...
            HD96670_mass_primary_spectroscopic_error_plus,...
            HD96670_black_hole_mass_error_minus,...
            HD96670_black_hole_mass_error_plus,'Color',grey,'HandleVisibility','off')
text(2.95,29.5,'HD96670','Color','k','FontSize',fs2);

% LMC X-1
errorbar(   LMC_X_1_black_hole_mass,...
            LMC_X_1_mass_primary, ...
            LMC_X_1_mass_primary_error_minus,...
            LMC_X_1_mass_primary_error_plus,...
            LMC_X_1_black_hole_mass_error_minus,...
            LMC_X_1_black_hole_mass_error_plus,'Color',grey,'HandleVisibility','off')
text(6.75,34,'LMC X-1','Color','k','FontSize',fs2);

% SS 433
errorbar(   SS_433_black_hole_mass,...
            SS_433_mass_primary, ...
            SS_433_mass_primary_error_minus,...
            SS_433_mass_primary_error_plus,...
            SS_433_black_hole_mass_error_minus,...
            SS_433_black_hole_mass_error_plus,'Color',grey,'HandleVisibility','off')
text(5,11.3,'SS 433','Color','k','FontSize',fs2);

% Gaia BH1
errorbar(   Gaia_BH1_black_hole_mass,...
            Gaia_BH1_mass_primary, ...
            Gaia_BH1_mass_primary_error_minus,...
            Gaia_BH1_mass_primary_error_plus,...
            Gaia_BH1_black_hole_mass_error_minus,...
            Gaia_BH1_black_hole_mass_error_plus,'Color',grey,'HandleVisibility','off')
text(10,1.25,'Gaia BH1','Color','k','FontSize',fs2);

% Gaia BH2
errorbar(   Gaia_BH2_black_hole_mass,...
            Gaia_BH2_mass_primary, ...
            Gaia_BH2_mass_primary_error_minus,...
            Gaia_BH2_mass_primary_error_plus,...
            Gaia_BH2_black_hole_mass_error_minus,...
            Gaia_BH2_black_hole_mass_error_plus,'Color',grey,'HandleVisibility','off')
text(5,1.25,'Gaia BH2','Color','k','FontSize',fs2);

% 2MASS J05215658+4359220
errorbar(   MASS_black_hole_mass,...
            MASS_mass_primary, ...
            MASS_mass_primary_error_minus,...
            MASS_mass_primary_error_plus,...
            MASS_black_hole_mass_error_minus,...
            MASS_black_hole_mass_error_plus,'Color',grey,'HandleVisibility','off')
text(2,6,'2MASS','Color','k','FontSize',fs2);

% NGC1850 BH1 

% CHOOSE
msg = "Choose the quantity you want to plot";
opts = ["eccentricity" "Roche-filling factor" "Orbital period"];
choice = menu(msg,opts);

if choice == 1
    % Eccentricity
    scatter(HD130298_mass_secondary_minimum,HD130298_mass_primary_spectroscopic,sz,HD130298_eccentricity,'^','filled','HandleVisibility','off')
    scatter(VFTS243_mass_secondary_minimum,VFTS243_mass_primary_spectroscopic,5*sz,VFTS243_eccentricity,'^','filled','HandleVisibility','off')
    scatter(VFTS514_mass_secondary_minimum,VFTS514_mass_primary_spectroscopic,sz,VFTS514_eccentricity,'^','filled','HandleVisibility','off')
    scatter(VFTS779_mass_secondary_minimum,VFTS779_mass_primary_spectroscopic,sz,VFTS779_eccentricity,'^','filled','HandleVisibility','off')
    scatter(CygnusX1_black_hole_mass_median,CygnusX1_mass_primary_median,sz,CygnusX1_eccentricity_median,'o','filled','HandleVisibility','off')
    scatter(M33_X_7_black_hole_mass,M33_X_7_mass_primary_spectroscopic,sz,M33_X_7_eccentricity,'o','filled','HandleVisibility','off')
    scatter(HD96670_black_hole_mass,HD96670_mass_primary_spectroscopic,sz,HD96670_eccentricity,'o','filled','HandleVisibility','off')
    scatter(LMC_X_1_black_hole_mass,LMC_X_1_mass_primary,sz,LMC_X_1_eccentricity,'o','filled','HandleVisibility','off')
    scatter(SS_433_black_hole_mass,SS_433_mass_primary,sz,SS_433_eccentricity,'o','filled','HandleVisibility','off')
    scatter(Gaia_BH1_black_hole_mass,Gaia_BH1_mass_primary,sz,Gaia_BH1_eccentricity,'hexagram','filled','HandleVisibility','off')
    scatter(Gaia_BH2_black_hole_mass,Gaia_BH2_mass_primary,sz,Gaia_BH2_eccentricity,'hexagram','filled','HandleVisibility','off')
    scatter(MASS_black_hole_mass,MASS_mass_primary,sz,MASS_eccentricity,'s','filled','HandleVisibility','off')
    
    % Colorbar
    cbar=colorbar;
    cbar.Label.String='$e$';
    cbar.Label.FontSize=fs;
    cbar.Label.Interpreter = 'latex';
    set(gca,'ColorScale','log');
    colormap(copper);
    clim([0.01 0.5]);
    cbar.Ticks = [0.01 0.02 0.04 0.05 0.1 0.2 0.4 0.5];
    
    if save_flag
        saveas(gcf,strcat('../plots/pdf/Figure_2.pdf'))
        saveas(gcf,strcat('../plots/png/Figure_2.png'))
    end

elseif choice==2
    % Roche-filling factor
    scatter(HD130298_mass_secondary_minimum,HD130298_mass_primary_spectroscopic,sz,HD130298_roche_factor,'^','filled','HandleVisibility','off')
    scatter(VFTS243_mass_secondary_minimum,VFTS243_mass_primary_spectroscopic,5*sz,VFTS243_roche_factor,'^','filled','HandleVisibility','off')
    scatter(VFTS514_mass_secondary_minimum,VFTS514_mass_primary_spectroscopic,sz,grey,'^','filled','HandleVisibility','off')
    scatter(VFTS779_mass_secondary_minimum,VFTS779_mass_primary_spectroscopic,sz,grey,'^','filled','HandleVisibility','off')
    scatter(CygnusX1_black_hole_mass_median,CygnusX1_mass_primary_median,sz,CygnusX1_roche_factor,'o','filled','HandleVisibility','off')
    scatter(M33_X_7_black_hole_mass,M33_X_7_mass_primary_spectroscopic,sz,M33_X_7_roche_factor,'o','filled','HandleVisibility','off')
    scatter(HD96670_black_hole_mass,HD96670_mass_primary_spectroscopic,sz,HD96670_roche_factor,'o','filled','HandleVisibility','off')
    scatter(LMC_X_1_black_hole_mass,LMC_X_1_mass_primary,sz,LMC_X_1_roche_factor,'o','filled','HandleVisibility','off')
    scatter(SS_433_black_hole_mass,SS_433_mass_primary,sz,SS_433_roche_factor,'o','filled','HandleVisibility','off')
    scatter(Gaia_BH1_black_hole_mass,Gaia_BH1_mass_primary,sz,Gaia_BH1_roche_factor,'hexagram','filled','HandleVisibility','off')
    scatter(Gaia_BH2_black_hole_mass,Gaia_BH2_mass_primary,sz,Gaia_BH2_roche_factor,'hexagram','filled','HandleVisibility','off')
    scatter(MASS_black_hole_mass,MASS_mass_primary,sz,MASS_roche_factor,'s','filled','HandleVisibility','off')
    
    cbar=colorbar;
    cbar.Label.String='$f_{\rm{RL}}=R/R_{\rm{RL}}$';
    cbar.Label.FontSize=fs;
    cbar.Label.Interpreter = 'latex';
    colormap(sky);
    
    saveas(gcf,strcat('../plots/pdf/Figure_App_roche_lobe_factor.pdf'))
    saveas(gcf,strcat('../plots/png/Figure_App_roche_lobe_factor.png'))   

elseif choice==3
    % Orbital period
    scatter(HD130298_mass_secondary_minimum,HD130298_mass_primary_spectroscopic,sz,HD130298_orbital_period_days,'^','filled','HandleVisibility','off')
    scatter(VFTS243_mass_secondary_minimum,VFTS243_mass_primary_spectroscopic,5*sz,VFTS243_orbital_period_days,'^','filled','HandleVisibility','off')
    scatter(VFTS514_mass_secondary_minimum,VFTS514_mass_primary_spectroscopic,sz,VFTS514_orbital_period_days,'^','filled','HandleVisibility','off')
    scatter(VFTS779_mass_secondary_minimum,VFTS779_mass_primary_spectroscopic,sz,VFTS779_orbital_period_days,'^','filled','HandleVisibility','off')
    scatter(CygnusX1_black_hole_mass_median,CygnusX1_mass_primary_median,sz,CygnusX1_orbital_period_days,'o','filled','HandleVisibility','off')
    scatter(M33_X_7_black_hole_mass,M33_X_7_mass_primary_spectroscopic,sz,M33_X_7_orbital_period_days,'o','filled','HandleVisibility','off')
    scatter(HD96670_black_hole_mass,HD96670_mass_primary_spectroscopic,sz,HD96670_orbital_period_days,'o','filled','HandleVisibility','off')
    scatter(LMC_X_1_black_hole_mass,LMC_X_1_mass_primary,sz,LMC_X_1_orbital_period_days,'o','filled','HandleVisibility','off')
    scatter(SS_433_black_hole_mass,SS_433_mass_primary,sz,SS_433_orbital_period_days,'o','filled','HandleVisibility','off')
    scatter(Gaia_BH1_black_hole_mass,Gaia_BH1_mass_primary,sz,Gaia_BH1_orbital_period_days,'hexagram','filled','HandleVisibility','off')
    scatter(Gaia_BH2_black_hole_mass,Gaia_BH2_mass_primary,sz,Gaia_BH2_orbital_period_days,'hexagram','filled','HandleVisibility','off')
    scatter(MASS_black_hole_mass,MASS_mass_primary,sz,MASS_orbital_period_days,'s','filled','HandleVisibility','off')
    
    cbar=colorbar;
    cbar.Label.Interpreter = 'latex';
    cbar.Label.String='$P_{\rm{orb}}\ \rm{[d]}$';
    cbar.Label.FontSize=fs;
    cbar.Ticks = [1,10,50];
    cbar.TickLabels = {'1','10','> 50'};
    caxis([1 50])
    colormap(flip(pink));
    set(gca,'ColorScale','log')
    
    saveas(gcf,strcat('../plots/pdf/Figure_App_orbital_period.pdf'))
    saveas(gcf,strcat('../plots/png/Figure_App_orbital_period.png'))

else
    display('Warning:odd choice.')
end


toc;
end