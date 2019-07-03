%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Script Esercizio 1.3 b)
%
% Partizionare la scala dei livelli di grigio in 128 e in 64 bande.
%
% Daniele Di Salvo --- 21 marzo 2019
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Lettura dell'immagine sorgente
westrgb = imread('westconcordaerial.png');

% Conversione dell'immagine sorgente a livelli di grigio
westgray = rgb2gray(westrgb);

% Partizionamento dei livelli di grigio in 128 bande
westgray128 = grayslice(westgray, 128);

% Partizionamento dei livelli di grigio in 64 bande
westgray64 = grayslice(westgray, 64);

% Visualizzazione dell'immagine sorgente a livelli di grigio
subplot(3,2,1), imshow(westgray), colorbar, title('Immagine gray level')

% Visualizzazione dell'istogramma dell'immagine sorgente a livelli di grigio
subplot(3,2,2), imhist(westgray), grid, title('Istogramma gray level')

% Visualizzazione dell'immagine a 128 bande
subplot(3,2,3), imshow(westgray128), colorbar, title('Immagine a 128 bande')

% Visualizzazione dell'istogramma a 128 bande
subplot(3,2,4), imhist(westgray128), grid, title('Istogramma a 128 bande')

% Visualizzazione dell'immagine a 64 bande
subplot(3,2,5), imshow(westgray64), colorbar, title('Immagine a 64 bande')

% Visualizzazione dell'istogramma a 64 bande
subplot(3,2,6), imhist(westgray64), grid, title('Istogramma a 64 bande')