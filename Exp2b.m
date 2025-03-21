clc
clear all;
close all;
hte=input('Enter the RX Height:');
hre=1:10;
d=input('Enter the Distance between TX and RX:');
f=input('Enter the Frequency:');
% MEDIUM-SMALL CITY (SUB URBAN AREA)
ahre_1=(1.1*log10(f)-0.7)*hre-(1.56*log10(f)-0.8);
L50_1=69.55+26.16*log10(f)-13.82*log10(hte)+(44.9-6.55*log10(hte))*log10(d)-ahre_1;
L50_dB_1=L50_1-(2*log10(f/28)*log10(f/28))-5.4;
% MEDIUM-SMALL CITY (RURAL/OPEN AREA)
ahre_2=(1.1*log10(f)-0.7)*hre-(1.56*log10(f)-0.8);
L50_2=69.55+26.16*log10(f)-13.82*log10(hte)+(44.9-6.55*log10(hte))*log10(d)-ahre_2;
L50_dB_2=L50_2-(4.78*log10(f)*log10(f))+18.33*log10(f)-40.98;
% LARGE CITY (URBAN AND SUBURBAN AREA)
if f<300000000
ahre_3=8.29*(log10(1.54*hre)).*(log10(1.54*hre))-1.1;
else
ahre_3=3.2*(log10(11.75*hre)).*(log10(11.75*hre))-4.97;
end
L50_3=69.55+26.16*log10(f)-13.82*log10(hte)+(44.9-6.55*log10(hte))*log10(d)-ahre_3;
L50_dB_3=L50_3-(2*log10(f/28)*log10(f/28))-5.4;
% rx height vs path loss
figure
plot(hre,L50_dB_1,'r',hre,L50_dB_2,'g',hre,L50_3,'b',hre,L50_dB_3,'m');
legend('L_5_0(dB)(Medium-Small City (Suburban Area))','L_5_0(dB)(Medium-Small City (Rural/Open Area))','L_5_0(dB)(Large City (Urban Area))','L_5_0(dB)(large City (Suburban Area))');
xlabel('RX Height (in m)');
ylabel('Path Loss (in dBm)');
title('HATA MODEL');
grid on
