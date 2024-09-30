clc
close all

a = [0.05 0.1 0.15 0.2 0.25 0.3 0.35 0.4 0.45 0.5]; % Radius of loudspeaker cone
rho_0 = 1.204; % Air density
c = 343; % Speed of sound in air at normal conditions

ka = logspace(-2,2, 1000);
Zac = (pi * a.^2 * rho_0 * c)' .* ...
    ((1 - besselj(1,2*ka)./ka) + 1i*(StruveH1(2*ka)./ka));

t = tiledlayout(2, 1,'TileSpacing','Compact','Padding','Compact');
nexttile
% title(t, 'Acoustic radiation impedance of a piston')
%f = figure('Position', [100, 100, 800, 600], 'Name', 'Acoustic radiation impedance of a piston');
loglog(ka, real(Zac))
xlabel("ka")
ylabel("Re\{Z_{ac}\}")
grid on
legend("a = 0.05 m", "a = 0.1 m", "a = 0.15 m", "a = 0.2 m", "a = 0.25 m", ...
    "a = 0.3 m", "a = 0.35 m", "a = 0.4 m", "a = 0.45 m", "a = 0.5 m", ...
    'Location', 'eastoutside')

nexttile
loglog(ka, imag(Zac))
xlabel("ka")
ylabel("Im\{Z_{ac}\}")
grid on
legend("a = 0.05 m", "a = 0.1 m", "a = 0.15 m", "a = 0.2 m", "a = 0.25 m", ...
    "a = 0.3 m", "a = 0.35 m", "a = 0.4 m", "a = 0.45 m", "a = 0.5 m", ...
    'Location', 'eastoutside')
