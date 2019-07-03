%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Script Esercizio 1.1 a)
% Visualizzazione dell'immagine 'cameraman.tif', metadati, look-up table e
% istogramma dei livelli di grigio.
% Daniele Di Salvo --- 21 marzo 2019
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Lettura dell'immagine sorgente
imgCamera = imread('cameraman.tif');
figure('Name', 'Visualizzazione immagine cameraman')

% Visualizzazione dell'immagine con relativa colormap
subplot(1,2,1),imshow(imgCamera), colorbar
title('Immagine sorgente')

% Visualizzazione dei metadati dell'immagine
metadati = imfinfo('cameraman.tif');

% Visualizzazione dell'istogramma dei livelli di grigio dell'immagine
subplot(1,2,2), imhist(imgCamera), grid,
title('Istogramma')