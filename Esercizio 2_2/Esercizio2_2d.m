%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Script Esercizio 2.2 d)
%
% Calcolare la mappa delle ampiezze e delle direzioni degli edge candidati tramite gradiente di Sobel;
% 
% Daniele Di Salvo --- 9 aprile 2019
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Lettura dell'immagine sorgente
varImg = imread('circuit.tif');

% Filtro Sobel orizzontale per accentuare i bordi
sobelx = fspecial('sobel');
sobely = sobelx';

% Filtraggio dell'immagine con il filtro Sobel
immDerivx = imfilter((varImg),sobelx);
immDerivy = imfilter((varImg),sobely);

% Calcolo delle ampiezze di edge candidati con filtro di gradiente Sobel
immAmpGSobel = abs(immDerivx) + abs(immDerivy);

%%%%%%%% SOBEL %%%%%%%%
% Visualizzazione dei risultati ottenuti
subplot(1,3,1), imshow(varImg, 'InitialMagnification', 'fit'), title('Immagine Sorgente')
subplot(1,3,2), imshow(immAmpGSobel, []), title('Ampiezza degli edge Sobel')
subplot(1,3,3), quiver(immDerivx,immDerivy), title('Direzione degli edge Sobel')

