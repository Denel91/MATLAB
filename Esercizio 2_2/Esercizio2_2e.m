%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Script Esercizio 2.2 e)
%
% Sulla sola mappa delle ampiezze degli edge candidati effettuare una sogliatura (binarizzazione) 
% tramite la im2bw(); sperimentare tre diversi valori di soglia: 0.4, 0.6, 0.9.
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

% Binarizzazione della mappa delle ampiezze degli edge candidati con tre
% livelli di soglia
BW = im2bw(immAmpGSobel, 0.4);   % soglia 0.4
BW_2 = im2bw(immAmpGSobel, 0.6); % soglia 0.6
BW_3 = im2bw(immAmpGSobel, 0.9); % soglia 0.9

% Visualizzazione dei risultati ottenuti
subplot(1,3,1), imshow(BW, 'InitialMagnification', 'fit'), title('Mappa binaria con soglia 0.4')
subplot(1,3,2), imshow(BW_2, 'InitialMagnification', 'fit'), title('Mappa binaria con soglia 0.6')
subplot(1,3,3), imshow(BW_3, 'InitialMagnification', 'fit'), title('Mappa binaria con soglia 0.9')