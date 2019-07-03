%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Script Esercizio 1.2 c)
% Desaturare l’immagine HSV e riconvertire l’immagine alla codifica RGB 
% Visualizzare gli istogrammi della HSV desaturata;
% Daniele Di Salvo --- 21 marzo 2019
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Lettura dell'immagine sorgente
peprgb = imread('peppers.png');

% Codifica HSV
pephsv = rgb2hsv(peprgb); % converto l'immagine da RGB a HSV

% Visualizzo l'immagine HSV dell'immagine sorgente
subplot(2,2,1), imshow(pephsv), title('Immagine HSV')

% Visualizzo l'istogramma HSV dell'immagine sorgente
subplot(2,2,2), imhist(pephsv), title('Istogramma HSV')

% Desaturo l'immagine HSV
pephsv(:,:,2)=0; % azzero il canale S

% Converto l'immagine da HSV in RGB
newpep = hsv2rgb(pephsv);

% Visualizzo l'immagine HSV con il canale S uguale a 0
subplot(2,2,3), imshow(pephsv), title('Immagine HSV con S = 0')

% Visualizzo l'istogramma dell'immagine HSV con il canale S uguale a 0
subplot(2,2,4), imhist(pephsv), grid, title('Istogramma HSV con S = 0')
