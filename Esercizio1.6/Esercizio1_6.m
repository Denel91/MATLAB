%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Script Esercizio 1.6 a,b,c,d)
%
% Visualizzare due immagini;
% Di una delle due riportare i metadati;
% Convertire i due frame in immagini di intensità. 
% Visualizzare le due immagini di intensità ciascuna col proprio istogramma;
% Calcolare la differenza pixel per pixel tra le due immagini di intensità.
% Visualizzare l’istogramma dell’immagine differenza usando la procedura histogram();
% Stimare manualmente la deviazione standard stdev del rumore.
%
% Daniele Di Salvo --- 26 marzo 2019
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%% PARTE (a)%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Lettura delle due immagini sorgenti
img_1 = imread('C:\Users\utente\Documents\MATLAB\images\java11.jpg');
img_2 = imread('C:\Users\utente\Documents\MATLAB\images\java_11.jpg');

% Visualizzazione dei metadati dell'img_1
metadati = imfinfo('C:\Users\utente\Documents\MATLAB\images\java11.jpg');

% Visualizzazione dei metadati dell'img_2
info = imfinfo('C:\Users\utente\Documents\MATLAB\images\java_11.jpg');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%% PARTE (b)%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Converto i due frame RBG sorgenti in immagini di intensità in scala di grigi. 
I_1 = rgb2gray(img_1);
I_2 = rgb2gray(img_2);

% Visualizzazione dei due frame RGB sorgenti
subplot(4,2,1), imshow(img_1), title('Immagine sorgente 1')
subplot(4,2,2), imshow(img_2), title('Immagine sorgente 2')

% Visualizzazione dei due frame di intensità in scala di grigi. 
subplot(4,2,3), imshow(I_1), title('Grayscale image 1')
subplot(4,2,4), imshow(I_2), title('Grayscale image 2')

% Visualizzazione degli istogrammi dei due frame di intensità in scala di grigi. 
subplot(4,2,5), imhist(I_1), grid, title('Grayscale histogram image 1')
subplot(4,2,6), imhist(I_2), grid, title('Grayscale histogram image 2')

%%%%%%%%%%%%%%%%%%%%%%%%%%%%% PARTE (c)%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Calcolo la differenza pixel per pixel tra le due immagini di intensità
diff = double(I_1) - double(I_2);

% Visualizzazione dell'immagine differenza
subplot(4,2,7), imshow(diff), title('Immagine Differenza')

% Visualizzazione dell'istogramma dell'immagine differenza con la procedura histogram()
subplot(4,2,8), histogram(diff), title('Difference histogram')

%%%%%%%%%%%%%%%%%%%%%%%%%%%%% PARTE (d)%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
figure('Name','Difference histogram' ), histogram(diff)

% Calcolo manualmente la deviazione standard stdev del rumore:
% altezza dell'istogramma = 2
% larghezza (metà dell'altezza) = 3 --> FWHM
% stdev = 3 / 2.355 = 1,273



