%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Script Esercizio 1.1 b)
% Visualizzazione dell'immagine 'peppers.png' e relativi metadati.
% Daniele Di Salvo --- 21 marzo 2019
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Lettura dell'immagine sorgente
imgPeppers = imread('peppers.png');
figure('Name', 'Visualizzazione immagine sorgente')

% Visualizzazione dell'immagine sorgente
imshow(imgPeppers)
title('Immagine sorgente')

% Visualizzazione dei metadati dell'immagine
metadati = imfinfo('peppers.png');
