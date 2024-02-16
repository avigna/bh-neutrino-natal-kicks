function figure_2_BH_binaries(save_flag, print_flag)
tic;

% FUNCTIONS
a_Keplerian_Rsun = @(M1_Msun, M2_Msun, P_days) AstroConstants.AU_to_Rsun.*(((P_days./AstroConstants.yr_to_d).^2).*(M1_Msun+M2_Msun)).^(1.0/3.0);
% Solving Kepler's equation

% DATA
% HD 130298 (Mahy et al. 2022)
% link: https://ui.adsabs.harvard.edu/abs/2022A%26A...664A.159M/abstract
HD130298_mass_primary_spectroscopic             = 24.2;     % solar mass
HD130298_mass_primary_spectroscopic_errors      = 3.8;      % solar mass
HD130298_mass_secondary                         = 8.9;      % solar mass
HD130298_mass_secondary_error_plus              = 1.7;      % solar mass
HD130298_mass_secondary_error_minus             = 2.2;      % solar mass
HD130298_eccentricity                           = 0.457;    % adim
HD130298_orbital_period                         = 14.62959; % days
HD130298_radius                                 = 10.0;     % solar radius
HD130298_effective_roche_radius                 = calculateRocheRadius(HD130298_mass_primary_spectroscopic,HD130298_mass_secondary);    % adim               
HD130298_separation_Rsol                        = a_Keplerian_Rsun(HD130298_mass_primary_spectroscopic,HD130298_mass_secondary,HD130298_orbital_period);    % solar radius
HD130298_roche_radius                           = HD130298_effective_roche_radius.*HD130298_separation_Rsol;    % solar radius
HD130298_roche_factor                           = HD130298_radius/HD130298_roche_radius; % adim

% VFTS 243 (Shenar et al. 2022a)
% link: https://ui.adsabs.harvard.edu/abs/2022NatAs...6.1085S/abstract
VFTS243_mass_primary                            = 25;       % solar mass
VFTS243_mass_primary_errors                     = 2.3;      % solar mass
VFTS243_mass_secondary                          = 10.1;     % solar mass
VFTS243_mass_secondary_error_plus               = 2.0;      % solar mass
VFTS243_mass_secondary_error_minus              = 2.0;      % solar mass
VFTS243_eccentricity                            = 0.017;    % adim
VFTS243_orbital_period                          = 10.4031;  % days
VFTS243_radius                                  = 10.3;     % solar radius
VFTS243_effective_roche_radius                  = calculateRocheRadius(VFTS243_mass_primary,VFTS243_mass_secondary);    % adim
VFTS243_separation_Rsol                         = a_Keplerian_Rsun(VFTS243_mass_primary,VFTS243_mass_secondary,VFTS243_orbital_period); % solar radius
VFTS243_roche_radius                            = VFTS243_effective_roche_radius.*VFTS243_separation_Rsol;  % solar radius
VFTS243_roche_factor                            = VFTS243_radius/VFTS243_roche_radius;  % adim

% VFTS 514 (Shenar et al. 2022b)
% link: https://ui.adsabs.harvard.edu/abs/2022A%26A...665A.148S/abstract
VFTS514_mass_primary_spectroscopic              = 19;       % solar mass
VFTS514_mass_primary_spectroscopic_errors       = 3;        % solar mass
VFTS514_mass_secondary_minimum                  = 4.5;      % solar mass
VFTS514_mass_secondary_minimum_error_plus       = 0.5;      % solar mass
VFTS514_mass_secondary_minimum_error_minus      = 0.5;      % solar mass    
VFTS514_eccentricity                            = 0.411;    % adim
VFTS514_orbital_period                          = 184.92;   % days
VFTS514_radius                                  = [];       % solar mass
VFTS514_effective_roche_radius                  = calculateRocheRadius(VFTS514_mass_primary_spectroscopic,VFTS514_mass_secondary_minimum);  % adim
VFTS514_separation_Rsol                         = a_Keplerian_Rsun(VFTS514_mass_primary_spectroscopic,VFTS514_mass_secondary_minimum,VFTS514_orbital_period);  % solar radius
VFTS514_roche_radius                            = VFTS514_effective_roche_radius.*VFTS514_separation_Rsol;  % solar radius
VFTS514_roche_factor                            = [];       % adim

% VFTS 779 (Shenar et al. 2022b)
% link: https://ui.adsabs.harvard.edu/abs/2022A%26A...665A.148S/abstract
VFTS779_mass_primary_spectroscopic              = 14;       % solar mass
VFTS779_mass_primary_spectroscopic_errors       = 4;        % solar mass
VFTS779_mass_secondary_minimum                  = 3.9;      % solar mass
VFTS779_mass_secondary_minimum_error_plus       = 0.6;      % solar mass
VFTS779_mass_secondary_minimum_error_minus      = 0.7;      % solar mass
VFTS779_eccentricity                            = 0.046;    % adim
VFTS779_orbital_period                          = 59.9;     % days

% CygnusX1 (Miller-Jones et al. 2022)
% link: https://ui.adsabs.harvard.edu/abs/2021Sci...371.1046M/abstract
CygnusX1_mass_primary_median                    = 40.6;     % solar mass   
CygnusX1_mass_primary_lower_bound               = 33.5;     % solar mass
CygnusX1_mass_primary_upper_bound               = 48.3;     % solar mass
CygnusX1_black_hole_mass_median                 = 21.2;     % solar mass
CygnusX1_black_hole_mass_lower_bound            = 18.9;     % solar mass
CygnusX1_black_hole_mass_upper_bound            = 23.4;     % solar mass
CygnusX1_eccentricity_median                    = 0.0189;   % adim
% link: https://ui.adsabs.harvard.edu/abs/1999A%26A...343..861B/abstract
CygnusX1_orbital_period                         = 5.599829; % days
CygnusX1_roche_factor                           = 0.99;     % adim

% M33 X-7 (Ramachandran et al. 2022)
% link: https://ui.adsabs.harvard.edu/abs/2022A%26A...667A..77R/abstract
M33_X_7_mass_primary_spectroscopic              = 38;       % solar mass 
M33_X_7_mass_primary_spectroscopic_error_plus   = 22;       % solar mass 
M33_X_7_mass_primary_spectroscopic_error_minus  = 10;       % solar mass 
M33_X_7_black_hole_mass                         = 11.4;     % solar mass 
M33_X_7_black_hole_mass_error_plus              = 3.3;      % solar mass 
M33_X_7_black_hole_mass_error_minus             = 1.7;      % solar mass 
M33_X_7_eccentricity                            = 0.0185;   % adim
M33_X_7_orbital_period                          = 3.45301;  % days
M33_X_7_radius                                  = 20.5;     % solar radius
M33_X_7_roche_factor                            = 0.84;     % adim

% HD 96670 (Gomez & Grindlay 2021)
% link: https://ui.adsabs.harvard.edu/abs/2021ApJ...913...48G/abstract
% Model 2
HD96670_mass_primary_spectroscopic              = 22.7;     % solar mass
HD96670_mass_primary_spectroscopic_error_plus   = 5.2;      % solar mass
HD96670_mass_primary_spectroscopic_error_minus  = 3.6;      % solar mass
HD96670_black_hole_mass                         = 6.2;      % solar mass
HD96670_black_hole_mass_error_plus              = 0.9;      % solar mass
HD96670_black_hole_mass_error_minus             = 0.7;      % solar mass
HD96670_eccentricity                            = 0.12;     % adim
HD96670_orbital_period                          = 5.28388;  % days
HD96670_radius                                  = 17.1;     % solar radius
HD96670_effective_roche_radius                  = calculateRocheRadius(HD96670_mass_primary_spectroscopic,HD96670_black_hole_mass); % adim
HD96670_separation_Rsol                         = a_Keplerian_Rsun(HD96670_mass_primary_spectroscopic,HD96670_black_hole_mass,HD96670_orbital_period);  % solar radius
HD96670_roche_radius                            = HD96670_effective_roche_radius.*HD96670_separation_Rsol;  % solar radius
HD96670_roche_factor                            = HD96670_radius/HD96670_roche_radius;  % adim

% LMC X-1
% link: https://ui.adsabs.harvard.edu/abs/2009ApJ...697..573O/abstract
% link: https://iopscience.iop.org/article/10.1088/1538-3873/aa7407
% link: https://ui.adsabs.harvard.edu/abs/2009ApJ...697..573O/abstract
LMC_X_1_mass_primary                            = 30.62;    % solar mass
LMC_X_1_mass_primary_error_plus                 = 3.17;     % solar mass
LMC_X_1_mass_primary_error_minus                = 3.17;     % solar mass
LMC_X_1_eccentricity                            = 0.0256;   % adim
LMC_X_1_black_hole_mass                         = 10.30;    % solar mass
LMC_X_1_black_hole_mass_error_plus              = 1.18;     % solar mass
LMC_X_1_black_hole_mass_error_minus             = 1.18;     % solar mass
LMC_X_1_orbital_period                          = 3.90917;  % days
LMC_X_1_radius                                  = 17.0;     % solar radius
LMC_X_1_roche_factor                            = 0.886;    % adim

% SS 433 (Picchi et al. 2020)
% link: https://ui.adsabs.harvard.edu/abs/2020A%26A...640A..96P/abstract
SS_433_mass_primary                             = 11.3;     % solar mass
SS_433_mass_primary_error_plus                  = 0.6;      % solar mass
SS_433_mass_primary_error_minus                 = 0.6;      % solar mass
SS_433_eccentricity                             = 0.05;     % adim
SS_433_black_hole_mass                          = 4.2;      % solar mass
SS_433_black_hole_mass_error_plus               = 0.4;      % solar mass
SS_433_black_hole_mass_error_minus              = 0.4;      % solar mass
SS_433_orbital_period                           = 13.08;    % days
SS_433_radius                                   = [];       % solar mass
SS_433_roche_factor                             = 1;        % adim

% Gaia BH1 (El-Badry et al. 2023)
% link: https://ui.adsabs.harvard.edu/abs/2023MNRAS.518.1057E/abstract
Gaia_BH1_mass_primary                           = 0.93;     % solar mass
Gaia_BH1_mass_primary_error_plus                = 0.05;     % solar mass
Gaia_BH1_mass_primary_error_minus               = 0.05;     % solar mass
Gaia_BH1_eccentricity                           = 0.451;    % adim
Gaia_BH1_black_hole_mass                        = 9.62;     % solar mass
Gaia_BH1_black_hole_mass_error_plus             = 0.18;     % solar mass
Gaia_BH1_black_hole_mass_error_minus            = 0.18;     % solar mass
Gaia_BH1_orbital_period                         = 185.59;   % days
Gaia_BH1_radius                                 = 0.99;     % solar radius
Gaia_BH1_effective_roche_radius                 = calculateRocheRadius(Gaia_BH1_mass_primary,Gaia_BH1_black_hole_mass); % adim
Gaia_BH1_separation_Rsol                        = a_Keplerian_Rsun(Gaia_BH1_mass_primary,Gaia_BH1_black_hole_mass,Gaia_BH1_orbital_period); % solar radius
Gaia_BH1_roche_radius                           = Gaia_BH1_effective_roche_radius.*Gaia_BH1_separation_Rsol; % solar radius
Gaia_BH1_roche_factor                           = Gaia_BH1_radius/Gaia_BH1_roche_radius; % adim

% Gaia BH2 (El-Badry et al. 2023)
% link: https://ui.adsabs.harvard.edu/abs/2023arXiv230207880E/abstract
Gaia_BH2_mass_primary                           = 1.07;     % solar mass
Gaia_BH2_mass_primary_error_plus                = 0.19;     % solar mass
Gaia_BH2_mass_primary_error_minus               = 0.19;     % solar mass
Gaia_BH2_eccentricity                           = 0.518;    % adim
Gaia_BH2_black_hole_mass                        = 8.93;     % solar mass
Gaia_BH2_black_hole_mass_error_plus             = 0.33;     % solar mass
Gaia_BH2_black_hole_mass_error_minus            = 0.33;     % solar mass
Gaia_BH2_orbital_period                         = 1276.7;   % days
Gaia_BH2_radius                                 = 7.7;      % solar radius
Gaia_BH2_effective_roche_radius                 = calculateRocheRadius(Gaia_BH2_mass_primary,Gaia_BH2_black_hole_mass); % adim
Gaia_BH2_separation_Rsol                        = a_Keplerian_Rsun(Gaia_BH2_mass_primary,Gaia_BH2_black_hole_mass,Gaia_BH2_orbital_period); % solar radius
Gaia_BH2_roche_radius                           = Gaia_BH2_effective_roche_radius.*Gaia_BH2_separation_Rsol;    % solar radius
Gaia_BH2_roche_factor                           = Gaia_BH2_radius/Gaia_BH2_roche_radius;    % adim

% 2MASS J05215658+4359220 (Thompson et al. 2019)
% link: https://ui.adsabs.harvard.edu/abs/2019Sci...366..637T
MASS_mass_primary                               = 3.0;      % solar mass
MASS_mass_primary_error_plus                    = 1.0;      % solar mass
MASS_mass_primary_error_minus                   = 1.0;      % solar mass
MASS_eccentricity                               = 0.00476;  % adim
MASS_black_hole_mass                            = 3.3;      % solar mass
MASS_black_hole_mass_error_plus                 = 2.8;      % solar mass
MASS_black_hole_mass_error_minus                = 0.7;      % solar mass
MASS_orbital_period                             = 83.205;   % days
MASS_radius                                     = 20.0;     % solar radius
MASS_effective_roche_radius                     = calculateRocheRadius(MASS_mass_primary,MASS_black_hole_mass); % adim
MASS_separation_Rsol                            = a_Keplerian_Rsun(MASS_mass_primary,MASS_black_hole_mass,MASS_orbital_period); % solar radius
MASS_roche_radius                               = MASS_effective_roche_radius.*MASS_separation_Rsol;    % solar radius
MASS_roche_factor                               = MASS_radius/MASS_roche_radius;    % adim

% PRINT
if print_flag
    display('HD130298')
    HD130298_mass_secondary+HD130298_mass_primary_spectroscopic
    HD130298_eccentricity
    HD130298_roche_factor

    display('VFTS 243')
    VFTS243_mass_secondary+VFTS243_mass_primary
    VFTS243_eccentricity
    VFTS243_roche_factor

    display('VFTS 514')
    VFTS514_mass_secondary_minimum+VFTS514_mass_primary_spectroscopic
    VFTS514_eccentricity
    VFTS514_roche_factor

    display('VFTS 779')
    VFTS779_mass_secondary_minimum+VFTS779_mass_primary_spectroscopic
    VFTS779_eccentricity

    display('Cyg X-1')
    CygnusX1_black_hole_mass_median+CygnusX1_mass_primary_median
    CygnusX1_eccentricity_median

    display('M33 X-7')
    M33_X_7_black_hole_mass+M33_X_7_mass_primary_spectroscopic
    M33_X_7_eccentricity
    M33_X_7_roche_factor

    display('HD96670')
    HD96670_black_hole_mass+HD96670_mass_primary_spectroscopic
    HD96670_eccentricity
    HD96670_roche_factor

    display('LMC X-1')
    LMC_X_1_black_hole_mass+LMC_X_1_mass_primary
    LMC_X_1_eccentricity
    LMC_X_1_roche_factor

    display('SS 433')
    SS_433_black_hole_mass+SS_433_mass_primary
    SS_433_eccentricity
    SS_433_roche_factor

    display('Gaia BH-1')
    Gaia_BH1_black_hole_mass+Gaia_BH1_mass_primary
    Gaia_BH1_eccentricity
    Gaia_BH1_roche_factor

    display('Gaia BH-2')
    Gaia_BH2_black_hole_mass+Gaia_BH2_mass_primary
    Gaia_BH2_eccentricity
    Gaia_BH2_roche_factor

    display('2MASS J05215658+4359220')
    MASS_black_hole_mass+MASS_mass_primary
    MASS_eccentricity
    MASS_roche_factor
end

% PLOT
sz          = 125;
sz2         = 10;
szVFTS243   = 260;
fs          = 18;
fs2         = 13;
grey        = 0.5.*[1 1 1];

clf
hold on
ylabel('$M_{*}\ [M_{\odot}]$','FontSize',fs,'FontName','Helvetica','Interpreter','latex')
xlabel('$M_{\rm{BH}}\ [M_{\odot}]$','FontSize',fs,'FontName','Helvetica','Interpreter','latex')
ylim([-0.5 60.5])
xticks([0:2:24]);
ax=gca;
ax.FontSize=fs;
box on

plot([0 13],[0 13],'k','HandleVisibility','off')
plot([19 25],[19 25],'k','HandleVisibility','off')
h=text(13.5,13.5,'$M_{*}=M_{\rm{BH}}$','Interpreter','latex','FontName','Helvetica','FontSize',fs);
set(h,'Rotation',20);

plot(100,100,'o','MarkerSize',sz2,'Color','k')
plot(100,100,'^','MarkerSize',sz2,'Color','k')
legend( 'HMXB','Inert BHB',...
        'FontSize',fs,...
        'Location','SouthEast',...
        'Box','off',...
        'FontName','Helvetica',...
        'Interpreter','latex')

xaxisproperties= get(gca, 'XAxis');
xaxisproperties.TickLabelInterpreter = 'latex'; % latex for x-axis
yaxisproperties= get(gca, 'YAxis');
yaxisproperties.TickLabelInterpreter = 'latex'; % latex for y-axis

cbar=colorbar;
cbar.TickLabelInterpreter='latex';    
cbar.Label.Interpreter = 'latex';
cbar.Label.FontSize=fs;    


% HD130298
errorbar(   HD130298_mass_secondary,...
            HD130298_mass_primary_spectroscopic,...
            HD130298_mass_primary_spectroscopic_errors,...
            HD130298_mass_primary_spectroscopic_errors,...
            HD130298_mass_secondary_error_minus,...
            HD130298_mass_secondary_error_plus,'k','HandleVisibility','off')
text(7.5,19,'HD130298',FontSize=fs2);

% VFTS243
errorbar(   VFTS243_mass_secondary,...
            VFTS243_mass_primary,...
            VFTS243_mass_primary_errors,...
            VFTS243_mass_primary_errors,...
            VFTS243_mass_secondary_error_minus,...
            VFTS243_mass_secondary_error_plus,'k','HandleVisibility','off')
text(12.5,25.1,'VFTS 243',FontSize=fs2);

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

% CHOOSE
msg = "Choose the quantity you want to plot";
opts = ["eccentricity" "Roche-filling factor" "Orbital period"];
choice = menu(msg,opts);

if choice == 1
    % Eccentricity
    scatter(HD130298_mass_secondary,HD130298_mass_primary_spectroscopic,sz,HD130298_eccentricity,'^','filled','HandleVisibility','off')
    scatter(VFTS243_mass_secondary,VFTS243_mass_primary,szVFTS243,VFTS243_eccentricity,'^','filled','HandleVisibility','off')
    scatter(VFTS514_mass_secondary_minimum,VFTS514_mass_primary_spectroscopic,sz,VFTS514_eccentricity,'^','filled','HandleVisibility','off')
    scatter(VFTS779_mass_secondary_minimum,VFTS779_mass_primary_spectroscopic,sz,VFTS779_eccentricity,'^','filled','HandleVisibility','off')
    scatter(CygnusX1_black_hole_mass_median,CygnusX1_mass_primary_median,sz,CygnusX1_eccentricity_median,'o','filled','HandleVisibility','off')
    scatter(M33_X_7_black_hole_mass,M33_X_7_mass_primary_spectroscopic,sz,M33_X_7_eccentricity,'o','filled','HandleVisibility','off')
    scatter(HD96670_black_hole_mass,HD96670_mass_primary_spectroscopic,sz,HD96670_eccentricity,'o','filled','HandleVisibility','off')
    scatter(LMC_X_1_black_hole_mass,LMC_X_1_mass_primary,sz,LMC_X_1_eccentricity,'o','filled','HandleVisibility','off')
    scatter(SS_433_black_hole_mass,SS_433_mass_primary,sz,SS_433_eccentricity,'o','filled','HandleVisibility','off')
    scatter(Gaia_BH1_black_hole_mass,Gaia_BH1_mass_primary,sz,Gaia_BH1_eccentricity,'^','filled','HandleVisibility','off')
    scatter(Gaia_BH2_black_hole_mass,Gaia_BH2_mass_primary,sz,Gaia_BH2_eccentricity,'^','filled','HandleVisibility','off')
    scatter(MASS_black_hole_mass,MASS_mass_primary,sz,MASS_eccentricity,'^','filled','HandleVisibility','off')

    % Colorbar
    cbar.Label.String='$e$';
    set(gca,'ColorScale','log');
    colormap(copper);
    clim([0.01 0.5]);
    cbar.Ticks = [0.01 0.02 0.04 0.05 0.1 0.2 0.4 0.5];
    
    % SAVE
    if save_flag
        saveas(gcf,strcat('../plots/pdf/Figure_2.pdf'))
        saveas(gcf,strcat('../plots/png/Figure_2.png'))
    end

elseif choice==2
    % Roche-filling factor
    scatter(HD130298_mass_secondary,HD130298_mass_primary_spectroscopic,sz,HD130298_roche_factor,'^','filled','HandleVisibility','off')
    scatter(VFTS243_mass_secondary,VFTS243_mass_primary,szVFTS243,VFTS243_roche_factor,'^','filled','HandleVisibility','off')
    scatter(VFTS514_mass_secondary_minimum,VFTS514_mass_primary_spectroscopic,sz,grey,'^','filled','HandleVisibility','off')
    scatter(VFTS779_mass_secondary_minimum,VFTS779_mass_primary_spectroscopic,sz,grey,'^','filled','HandleVisibility','off')
    scatter(CygnusX1_black_hole_mass_median,CygnusX1_mass_primary_median,sz,CygnusX1_roche_factor,'o','filled','HandleVisibility','off')
    scatter(M33_X_7_black_hole_mass,M33_X_7_mass_primary_spectroscopic,sz,M33_X_7_roche_factor,'o','filled','HandleVisibility','off')
    scatter(HD96670_black_hole_mass,HD96670_mass_primary_spectroscopic,sz,HD96670_roche_factor,'o','filled','HandleVisibility','off')
    scatter(LMC_X_1_black_hole_mass,LMC_X_1_mass_primary,sz,LMC_X_1_roche_factor,'o','filled','HandleVisibility','off')
    scatter(SS_433_black_hole_mass,SS_433_mass_primary,sz,SS_433_roche_factor,'o','filled','HandleVisibility','off')
    scatter(Gaia_BH1_black_hole_mass,Gaia_BH1_mass_primary,sz,Gaia_BH1_roche_factor,'^','filled','HandleVisibility','off')
    scatter(Gaia_BH2_black_hole_mass,Gaia_BH2_mass_primary,sz,Gaia_BH2_roche_factor,'^','filled','HandleVisibility','off')
    scatter(MASS_black_hole_mass,MASS_mass_primary,sz,MASS_roche_factor,'^','filled','HandleVisibility','off')
    
    cbar.Label.String='$f_{\rm{RL}}=R/R_{\rm{RL}}$';
    colormap(sky);
    
    % SAVE
    saveas(gcf,strcat('../plots/pdf/Figure_SM_roche_lobe_factor.pdf'))
    saveas(gcf,strcat('../plots/png/Figure_SM_roche_lobe_factor.png'))   

elseif choice==3
    % Orbital period
    scatter(HD130298_mass_secondary,HD130298_mass_primary_spectroscopic,sz,HD130298_orbital_period,'^','filled','HandleVisibility','off')
    scatter(VFTS243_mass_secondary,VFTS243_mass_primary,szVFTS243,VFTS243_orbital_period,'^','filled','HandleVisibility','off')
    scatter(VFTS514_mass_secondary_minimum,VFTS514_mass_primary_spectroscopic,sz,VFTS514_orbital_period,'^','filled','HandleVisibility','off')
    scatter(VFTS779_mass_secondary_minimum,VFTS779_mass_primary_spectroscopic,sz,VFTS779_orbital_period,'^','filled','HandleVisibility','off')
    scatter(CygnusX1_black_hole_mass_median,CygnusX1_mass_primary_median,sz,CygnusX1_orbital_period,'o','filled','HandleVisibility','off')
    scatter(M33_X_7_black_hole_mass,M33_X_7_mass_primary_spectroscopic,sz,M33_X_7_orbital_period,'o','filled','HandleVisibility','off')
    scatter(HD96670_black_hole_mass,HD96670_mass_primary_spectroscopic,sz,HD96670_orbital_period,'o','filled','HandleVisibility','off')
    scatter(LMC_X_1_black_hole_mass,LMC_X_1_mass_primary,sz,LMC_X_1_orbital_period,'o','filled','HandleVisibility','off')
    scatter(SS_433_black_hole_mass,SS_433_mass_primary,sz,SS_433_orbital_period,'o','filled','HandleVisibility','off')
    scatter(Gaia_BH1_black_hole_mass,Gaia_BH1_mass_primary,sz,Gaia_BH1_orbital_period,'^','filled','HandleVisibility','off')
    scatter(Gaia_BH2_black_hole_mass,Gaia_BH2_mass_primary,sz,Gaia_BH2_orbital_period,'^','filled','HandleVisibility','off')
    scatter(MASS_black_hole_mass,MASS_mass_primary,sz,MASS_orbital_period,'^','filled','HandleVisibility','off')
    
    cbar.Label.String='$P_{\rm{orb}}\ \rm{[d]}$';
    cbar.Ticks = [1,10,50];
    cbar.TickLabels = {'$1$','$10$','$> 50$'};
    caxis([1 50])
    colormap(flip(pink));
    set(gca,'ColorScale','log')
    
    % SAVE
    saveas(gcf,strcat('../plots/pdf/Figure_SM_orbital_period.pdf'))
    saveas(gcf,strcat('../plots/png/Figure_SM_orbital_period.png'))
else
    display('Warning:odd choice.')
end


toc;
end