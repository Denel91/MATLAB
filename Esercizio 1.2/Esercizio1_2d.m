%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Script Esercizio 1.2 d)
% Desaturare l’immagine HSV e riconvertire l’immagine alla codifica RGB 
% Visualizzare gli istogrammi della HSV desaturata;
% Daniele Di Salvo --- 21 marzo 2019
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Lettura dell'immagine sorgente
peprgb = imread('peppers.png');

% Codifica HSV
pephsv = rgb2hsv(peprgb); % converto l'immagine da RGB a HSV

% Visualizzo l'immagine HSV dell'immagine sorgente
subplot(3,2,1), imshow(pephsv), title('Immagine HSV')
% Visualizzo l'istogramma HSV dell'immagine sorgente
subplot(3,2,2), imhist(pephsv), grid, title('Istogramma HSV')

% Desaturo l'immagine HSV
pephsv(:,:,1)=0; % azzero il canale H
pephsv(:,:,2)=0; % azzero il canale S

% Converto l'immagine da HSV in RGB
newpep = hsv2rgb(pephsv);

% Visualizzazione dell'immagine HSV con H e S uguali a 0
subplot(3,2,3), imshow(pephsv), title('Immagine HSV con H e S = 0')

% Visualizzazione dell'istogramma HSV con H e S uguali a 0
subplot(3,2,4), imhist(pephsv),grid, title('Istogramma con H e S = 0')

% Visualizzazione dell'immagine RGB desaturata
subplot(3,2,5), imshow(newpep), title('Immagine RGB desaturata')

% Visualizzazione dell'istogramma dell'immagine RGB desaturata
subplot(3,2,6), imhist(newpep), grid, title('Istogramma immagine RGB desaturata')
