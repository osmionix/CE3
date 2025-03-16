clc; clear all; close all;

% Input parameters
hte = input('Enter the TX Height:');
hre = input('Enter the RX Height:');
f = input('Enter the Frequency:');
d = input('Enter the Distance between the Antennas:');

% Constants
ame = 43; garea = 9; eirp = 60; garea2=17; garea3=23;
lam = 3e8 / f;
ghte = 20 * log10(hte / 200);
ghre = 20 * log10(hre / 3);
lf = -10 * log10((lam^2) / ((4 * pi * d)^2));
l50 = lf + ame - ghte - ghre - garea;
pr = eirp - l50;

d_vals = 1000:100:50000;
hre_vals = 0:10;
hte_vals = 0:100;

ghre_vals = 20 * log10(hre_vals / 3);
ghte_vals = 20 * log10(hte_vals / 200);
lf_d = -10 * log10((lam^2) ./ ((4 * pi * d_vals).^2));
l50_d = lf_d + ame - ghte - ghre - garea;
pr_d = eirp - l50_d;

lf_hre = -10 * log10((lam^2) / ((4 * pi * d)^2));
l50_hre = lf_hre + ame - ghte - ghre_vals - garea;
pr_hre = eirp - l50_hre;

lf_hte = -10 * log10((lam^2) / ((4 * pi * d)^2));
l50_hte = lf_hte + ame - ghte_vals - ghre - garea;
pr_hte = eirp - l50_hte;

% Plot results
figure;
subplot(2,3,1); plot(d_vals, l50_d); xlabel('Distance (m)'); ylabel('Path Loss (dBm)'); title('Suburban Area');
subplot(2,3,2); plot(hre_vals, l50_hre); xlabel('RX Height (m)'); ylabel('Path Loss (dBm)'); title('Suburban Area');
subplot(2,3,3); plot(d_vals, pr_d); xlabel('Distance (m)'); ylabel('Power Received (dBm)'); title('Suburban Area');
subplot(2,3,4); plot(hre_vals, pr_hre); xlabel('RX Height (m)'); ylabel('Power Received (dBm)'); title('Suburban Area');
subplot(2,3,5); plot(hte_vals, pr_hte); xlabel('TX Height (m)'); ylabel('Power Received (dBm)'); title('Suburban Area');
subplot(2,3,6); plot(hte_vals, l50_hte); xlabel('TX Height (m)'); ylabel('Path Loss (dBm)'); title('Suburban Area');
