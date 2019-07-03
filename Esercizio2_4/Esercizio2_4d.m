%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Script Esercizio 2.4 d)
%
% Effettuare il filtraggio di Laplace dell’immagine reale 'coins.png'. 
% Visualizzare l’immagine sorgente; la mappa delle ampiezze; 
% la mappa stessa in modalità grafica usando la mesh(); 
% la mappa dopo aver eliminato i valori negativi
% 
% Daniele Di Salvo --- 16 aprile 2019
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Lettura dell'immagine sorgente
varImg = imread('coins.png');
varImgDouble = double(varImg); % Conversione nel tipo Double

% Filtro di Laplace
filterLaplace = fspecial('laplacian');

% Mappa delle ampiezze
imgLaplace = imfilter(varImgDouble, filterLaplace);

% Inverto l'immagine filtrata
imagesReverse = -imgLaplace;

% Binarizzazione dell'immagine inversa con soglia uguale a 1
positiveImgBW = imbinarize(imagesReverse, 1);

% Visualizzazione dei risultati
subplot(1,4,1), imshow(varImg), title('Immagine Sorgente')
subplot(1,4,2), imshow(imgLaplace, []), title('Mappa delle ampiezze')
subplot(1,4,3), imshow(positiveImgBW), title('Mappa senza valori negativi')
subplot(1,4,4), mesh(imgLaplace), title('Mappa delle ampiezze 3D')