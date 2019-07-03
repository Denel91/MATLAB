%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Script Esercizio 1.5 b - c)
%
% Calcolare l’errore quadratico medio MSE (funzione immse()); 
% il rapporto segnale-rumore di picco (PSNR); 
% il rapporto segnale rumore (SNR) per i tre livelli di rumore simulato.
% 
% Daniele Di Salvo --- 26 marzo 2019
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Creo una matrice nera 30 x 30
img = zeros(30,30);

% Creo una barra bianca 
img(5:24, 13:17)=1.;

% Visualizzazione della matrice nera e della barra bianca
imshow(img, 'InitialMagnification', 'fit')

j = imnoise(img,'gaussian', 0, 0.1); % adds Gaussian white noise with mean 0 and variance of 0.1.

h = imnoise(img,'gaussian', 0, 0.01); % adds Gaussian white noise with mean 0 and variance of 0.01.

q = imnoise(img,'gaussian', 0, 1); % adds Gaussian white noise with mean 0 and variance of 1. 

% calcolare l’errore quadratico medio MSE
err_1 = immse(j, img);
err_2 = immse(h, img);
err_3 = immse(q, img);

% Calcolare il rapporto segnale-rumore di picco (PSNR) e il rapporto segnale rumore (SNR)
[peaksnr,snr] = psnr(j, img);

% Visualizzazione dei risultati in forma tabellare
figure('Name', 'Tabella PSNR e SNR')
uit = uitable;
uit.ColumnName = {'PSNR','SNR'};
uit.ColumnEditable = false;
d = {peaksnr, snr};
uit.Data = d;
uit.Position = [20 20 262 204];




