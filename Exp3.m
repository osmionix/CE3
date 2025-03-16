clc; clear all; close all;

d0 = 100;
d = 0:10:250;
n = [2.2 1.8 3 2.4 2.6 2.0 2.1 1.8 1.6 3.0 2.1 3.3];
f = [914 914 1500 900 1900 1300 4000 1300 1300 900 4000 1300];
s = [8.7 5.2 7 9.6 14.1 3 7 6 5.8 7 9.7 6.8];

v = 3e8 ./ f;
PL_d0 = 20 * log10(v ./ (4 * pi * d0));
X = s .* randn(size(PL_d0));

PL = PL_d0' + 10 * n' * log10(d / d0) + X';

plot(d, PL);
xlabel('Distance (in m)'); ylabel('Path Loss (dB)');
title('Distance vs Path Loss');
legend('Retail Store', 'Grocery Store', 'Office-Hard Partition', 'Office-Soft Partition', 'Textile/Chemical');
