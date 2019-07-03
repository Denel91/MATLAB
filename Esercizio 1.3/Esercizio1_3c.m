%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Script Esercizio 1.3 c)
%
% Partizionare la scala dei livelli di grigio in 16 bande.
%
% Daniele Di Salvo --- 21 marzo 2019
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Lettura dell'immagine sorgente
westrgb = imread('westconcordaerial.png');

% Conversione dell'immagine sorgente a livelli di grigio
westgray = rgb2gray(westrgb);

% Partizionamento dei livelli di grigio in 16 bande
westgray16 = grayslice(westgray, 16);

% Visualizzazione dell'immagine a 16 bande con la colormap jet()
subplot(2,2,1), imshow(westgray16, jet(16)), colorbar, title('Immagine a 16 bande jet()')

% Visualizzazione dell'istogramma a 16 bande con la colormap jet()
subplot(2,2,2), imhist(westgray16), grid, title('Istogramma a 16 bande jet()')

% Visualizzazione dell'immagine a 16 bande con la colormap hot()
subplot(2,2,3), imshow(westgray16, hot(16)), colorbar, title('Immagine a 16 bande hot()')

% Visualizzazione dell'istogramma a 16 bande con la colormap hot()
subplot(2,2,4), imhist(westgray16), grid, title('Istogramma a 16 bande hot()')


