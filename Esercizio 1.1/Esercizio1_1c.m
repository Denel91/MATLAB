%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Script Esercizio 1.1 c)
% Visualizzazione componenti R, G, B a livelli di grigio
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
imgTogray = imgRGB; % Copia dell'immagine sorgente
R = imgTogray(:,:,1);
subplot(2,4,2), imshow(R)
title('Immagine componente Rossa')
subplot(2,4,6), imhist(R), grid
title('Istog. livello Rosso'), ylabel('Frequenza livelli')

% Estrazione della componente Verde
imgTogray = imgRGB; % Copia dell'immagine sorgente
G = imgTogray(:,:,2);
subplot(2,4,3), imshow(G)
title('Immagine componente Verde')
subplot(2,4,7), imhist(G), grid
title('Istog. livello Verde'), ylabel('Frequenza livelli')

% Estrazione della componente Blu
imgTogray = imgRGB; % Copia dell'immagine sorgente
B = imgTogray(:,:,3);
subplot(2,4,4), imshow(B)
title('Immagine componente Blu')
subplot(2,4,8), imhist(G), grid
title('Istog. livello Blu'), ylabel('Frequenza livelli')


   


