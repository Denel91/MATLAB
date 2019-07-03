%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Script Esercizio 1.2 b)
% Visualizzare i singoli canali H, S, V in livelli di grigio
% Daniele Di Salvo --- 21 marzo 2019
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Lettura dell'immagine sorgente
peprgb = imread('peppers.png');

% Codifica HSV
pephsv = rgb2hsv(peprgb);

% Estrazione del canale H
peph = pephsv(:,:,1);
% Estrazione del canale S
peps = pephsv(:,:,2);
% Estrazione del canale V
pepv = pephsv(:,:,3);

% Visualizzazione del canale H
subplot(3,2,1), imshow(peph)
title('Canale H')
% Visualizzazione dell'istogramma del canale H
subplot(3,2,2), imhist(peph), grid
title('Istogramma del canale H')

% Visualizzazione del canale S
subplot(3,2,3), imshow(peps)
title('Canale S')
% Visualizzazione dell'istogramma del canale S
subplot(3,2,4), imhist(peps), grid
title('Istogramma del canale S')

% Visualizzazione del canale V
subplot(3,2,5), imshow(pepv)
title('Canale V')
% Visualizzazione dell'istogramma del canale V
subplot(3,2,6), imhist(pepv), grid
title('Istogramma del canale V')