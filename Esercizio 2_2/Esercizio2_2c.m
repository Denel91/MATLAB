%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Script Esercizio 2.2 c)
%
% Considerare l’immagine 'blobs.png' a cui aggiungere rumore gaussiano additivo con varianza = 0.1. 
% Effettuare il calcolo delle sole ampiezze degli edge candidati, usando l’operatore di gradiente di Sobel.
% 
% Daniele Di Salvo --- 9 aprile 2019
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Lettura dell'immagine sorgente
varImg = imread('blobs.png');

% Aggiungo rumore gaussiano con media 0 e varianza 0.1
noiseImg = imnoise(double(varImg),'gaussian', 0, 0.1);

% Filtro Sobel orizzontale per accentuare i bordi
sobelx = fspecial('sobel');
sobely = sobelx';

% Filtraggio dell'immagine con il filtro Sobel
immDerivx = imfilter((noiseImg),sobelx);
immDerivy = imfilter((noiseImg),sobely);

% Calcolo delle ampiezze di edge candidati con filtro di gradiente Sobel
immAmpGSobel = abs(immDerivx) + abs(immDerivy);

%%%%%%%% SOBEL %%%%%%%%
% Visualizzazione dei risultati ottenuti
subplot(1,3,1), imshow(varImg, 'InitialMagnification', 'fit'), title('Immagine Sorgente')
subplot(1,3,2), imshow(noiseImg, 'InitialMagnification', 'fit'), title('Immagine con rumore gaussiano')
subplot(1,3,3), imshow(immAmpGSobel, []), title('Ampiezza degli edge Sobel')
