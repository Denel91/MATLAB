%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Script Esercizio 1.1 d)
% Visualizzazione componenti R, G, B in forma di immagini a colori
% Daniele Di Salvo --- 21 marzo 2019
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Lettura e visualizzazione immagine sorgente
imgRGB = imread('peppers.png');
figure('Name', 'Componenti R,G,B, di una immagine a colori')
subplot(2,4,1)
imshow(imgRGB)
title('Immagine sorgente')

% Estrazione di ogni componente di colore in livelli di grigio

% Estrazione della componente Rossa
imgRed = imgRGB;    % copia dell'immagine sorgente
imgRed(:,:,2)=0.;   % azzeramento componente verde
imgRed(:,:,3)=0.;   % azzeramento componente blu
subplot(2,4,2), imshow(imgRed)
title('Immagine componente Rossa')
subplot(2,4,6), imhist(imgRed), grid
title('Istog. livello Rosso'), ylabel('Frequenza livelli')

% Estrazione della componente Verde
imgGreen = imgRGB;  % copia dell'immagine sorgente
imgGreen(:,:,1)=0.; % azzeramento componente rossa
imgGreen(:,:,3)=0.; % azzeramento componente blu
subplot(2,4,3), imshow(imgGreen)
title('Immagine componente Verde')
subplot(2,4,7), imhist(imgGreen), grid
title('Istog. livello Verde'), ylabel('Frequenza livelli')

% Estrazione della componente Blu
imgBlue = imgRGB;   % copia dell'immagine originale
imgBlue(:,:,1)=0.;  % azzeramento componente rossa
imgBlue(:,:,2)=0.;  % azzeramento componente verde
subplot(2,4,4), imshow(imgBlue)
title('Immagine componente Blu')
subplot(2,4,8), imhist(imgBlue), grid
title('Istog. livello Blu'), ylabel('Frequenza livelli')


   


