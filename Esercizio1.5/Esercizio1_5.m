%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Script Esercizio 1.5 a)
%
% Aggiungere rumore gaussiano a media nulla, con tre livelli diversi di varianza: 0.01, 0.1, 1.
% 
% Daniele Di Salvo --- 26 marzo 2019
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Creo una matrice nera 30 x 30
img = zeros(30,30);

% Creo una barra bianca sottomatrice della matrice nera
img(5:24, 13:17)=1.;

% Visualizzazione della matrice nera e della barra bianca
imshow(img, 'InitialMagnification', 'fit')

% Add noise to image
j = imnoise(img,'gaussian', 0, 0.1); % adds Gaussian white noise with mean 0 and variance of 0.1.

h = imnoise(img,'gaussian', 0, 0.01); % adds Gaussian white noise with mean 0 and variance of 0.01.

q = imnoise(img,'gaussian', 0, 1); % adds Gaussian white noise with mean 0 and variance of 1. 

% Visualizzazione dell'immagine sorgente
subplot(4,2,1), imshow(img, 'InitialMagnification', 'fit')
title('Immagine Sorgente')

% Visualizzazione dell'istogramma dell'immagine sorgente
subplot(4,2,2), imhist(img), grid
title('Istogramma immagine sorgente') % Istogramma immagine sorgente

% Visualizzazione dell'immagine con varianza 0.1 e relativo istogramma 
subplot(4,2,3), imshow(j)
title('Immagine con varianza 0.1')
subplot(4,2,4), imhist(j), grid
title('Istogramma immagine con varianza 0.1') % Istogramma immagine j

% Visualizzazione dell'immagine con varianza 0.01 e relativo istogramma 
subplot(4,2,5), imshow(h)
title('Immagine con varianza 0.01')
subplot(4,2,6), imhist(h), grid
title('Istogramma immagine con varianza 0.01') % Istogramma immagine h

% Visualizzazione dell'immagine con varianza 1 e relativo istogramma 
subplot(4,2,7), imshow(q)
title('Immagine con varianza 1')
subplot(4,2,8), imhist(q), grid
title('Istogramma immagine con varianza 1') % Istogramma immagine q


