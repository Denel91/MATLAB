%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Script Esercizio 1.3 a)
%
% Convertire l’immagine in un’altra a livelli di grigio tramite la 
% procedura rgb2gray().
% Visualizzare l’immagine sorgente e quella convertita in livelli di grigio 
% con la propria scala e il proprio istogramma.
%
% Daniele Di Salvo --- 21 marzo 2019
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Lettura dell'immagine sorgente
westrgb = imread('westconcordaerial.png');

% Conversione dell'immagine sorgente a livelli di grigio
westgray = rgb2gray(westrgb);

% Visualizzazione dell'immagine RGB 
subplot(2,2,1), imshow(westrgb), colorbar, title('Immagine Sorgente RGB')

% Visualizzazione dell'istogramma dell'immagine RGB
subplot(2,2,2), imhist(westrgb), grid, title('Istogramma immagine RGB')

% Visualizzazione dell'immagine convertita in livelli di grigio
subplot(2,2,3), imshow(westgray), colorbar, title('Immagine convertita')

% Visualizzazione dell'istogramma dell'immagine a livelli di grigio
subplot(2,2,4), imhist(westgray), grid, title('Istogramma immagine convertita')
