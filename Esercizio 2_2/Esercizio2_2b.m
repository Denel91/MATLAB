%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Script Esercizio 2.2 b)
%
% All’immagine della barra aggiungere rumore gaussiano con varianza = 0.01. 
% Ripetere il calcolo delle mappe di edge candidati con filtraggi di Roberts e Sobel.
% 
% Daniele Di Salvo --- 9 aprile 2019
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Creo una matrice nera 30 x 30
var = zeros(30,30);

% Creo una barra bianca sottomatrice della matrice nera
var(5:24, 13:17)=1.;

% Aggiungo rumore gaussiano con media 0 e varianza 0.01
img = imnoise(var,'gaussian',0, 0.01);

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
subplot(2,5,1), imshow(img, 'InitialMagnification', 'fit'), title('Immagine Sorgente')
subplot(2,5,2), imshow(RobertsGradient,[]), title('Derivata in x Roberts')
subplot(2,5,3), imshow(RobertsGradient2, []), title('Derivata in y Roberts')
subplot(2,5,4), imshow(immAmpG), title('Ampiezza degli edge Roberts')
subplot(2,5,5), quiver(RobertsGradient,RobertsGradient2), title('Direzione degli edge Roberts')

%%%%%%%% SOBEL %%%%%%%%
subplot(2,5,6), imshow(immDerivx, []), title('Derivata in x Sobel')
subplot(2,5,7), imshow(immDerivy, []), title('Derivata in y Sobel')
subplot(2,5,8), imshow(immAmpGSobel), title('Ampiezza degli edge Sobel')
subplot(2,5,9), quiver(immDerivx,immDerivy), title('Direzione degli edge Sobel')




