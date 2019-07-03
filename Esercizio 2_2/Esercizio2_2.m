%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Script Esercizio 2.2 a)
%
% Calcolare la mappa delle ampiezze e delle direzioni dei punti di edge 
% candidati, operando sull’immagine senza rumore con un filtraggio derivativo 
% tipo gradiente di Roberts e di Sobel.
% 
% *Daniele Di Salvo --- 9 aprile 2019
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Creo una matrice nera 30 x 30
img = zeros(30,30);

% Creo una barra bianca sottomatrice della matrice nera
img(5:24, 13:17)=1.;

% Maschere di Roberts
filtroRoberts1 = [-1,0; 0,1]; % immDerivx()
filtroRoberts2 = [0,-1; 1,0]; % immDerivy()

% Convoluzione (filtraggio) con la prima maschera
RobertsGradient = imfilter(img,filtroRoberts1);
% Convoluzione (filtraggio) con la seconda maschera
RobertsGradient2 = imfilter(img,filtroRoberts2);

% Calcolo delle ampiezze di edge candidati con filtro di gradiente Roberts
immAmpG = abs(RobertsGradient) + abs(RobertsGradient2);

% Filtro Sobel orizzontale per accentuare i bordi
sobelx = fspecial('sobel');
sobely = sobelx';

% Filtraggio dell'immagine con il filtro Sobel
immDerivx = imfilter(img,sobelx);
immDerivy = imfilter(img,sobely);

% Calcolo delle ampiezze di edge candidati con filtro di gradiente Sobel
immAmpGSobel = abs(immDerivx) + abs(immDerivy);

%%%%%%%% ROBERTS %%%%%%%%
subplot(2,4,1), imshow(RobertsGradient,[]), title('Derivata in x Roberts')
subplot(2,4,2), imshow(RobertsGradient2, []), title('Derivata in y Roberts')
% Visualizzazione delle ampiezze di edge candidati con filtro di gradiente
% Roberts
subplot(2,4,3), imshow(immAmpG), title('Ampiezza degli edge Roberts')
% Visualizzazione della mappa delle direzioni dei punti di edge candidati
% con filtro di gradiente Roberts
subplot(2,4,4), quiver(RobertsGradient,RobertsGradient2), title('Direzione degli edge Roberts')

%%%%%%%% SOBEL %%%%%%%%
subplot(2,4,5), imshow(immDerivx, []), title('Derivata in x Sobel')
subplot(2,4,6), imshow(immDerivy, []), title('Derivata in y Sobel')
% Visualizzazione delle ampiezze di edge candidati con filtro di gradiente
% Sobel
subplot(2,4,7), imshow(immAmpGSobel), title('Ampiezza degli edge Sobel')
% Visualizzazione della mappa delle direzioni dei punti di edge candidati
% con filtro di gradiente Sobel
subplot(2,4,8), quiver(immDerivx,immDerivy), title('Direzione degli edge Sobel')






