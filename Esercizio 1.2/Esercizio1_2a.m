%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Script Esercizio 1.2 a)
% Converto l'immagine da codifica RGB in codifica HSV (Hue, Saturation, Value)
% Daniele Di Salvo --- 21 marzo 2019
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Lettura dell'immagine sorgente
peprgb = imread('peppers.png');

% Codifica HSV
pephsv = rgb2hsv(peprgb);

% Visualizzazione dell'immagine sorgente
subplot(2,2,1), imshow(peprgb), title('Immagine Sorgente')
% Visualizzazione dell'istogramma dell'immagine sorgente
subplot(2,2,2), imhist(peprgb),grid, title('Istogramma Immagine sorgente')

% Visualizzazione dell'immagine HSV
subplot(2,2,3), imshow(pephsv), title('Immagine HSV')
% Visualizzazione dell'istogramma dell'immagine HSV
subplot(2,2,4), imhist(pephsv), grid, title('Istogramma Immagine HSV')





