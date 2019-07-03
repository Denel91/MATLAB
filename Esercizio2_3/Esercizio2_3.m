%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Script Esercizio 2.3 a, b )
%
% (a) Usare l’immagine ‘blobs.png’. Calcolare la mappa di ampiezze di edge con l’operatore di Sobel usando la edge() di MATLAB. 
% Calcolare la stessa mappa di ampiezze di edge di Sobel usando fspecial(), imfilter(). 
% Binarizzare quest’ultima mappa per selezionare i massimi delle ampiezze (soglia = 0.9). 
% Visualizzare nella stessa finestra l’immagine sorgente e le due mappe di ampiezze.
%
% (b) Stimare la precisione delle mappe di ampiezze di Sobel calcolate al punto (a), usando il MSE. 
% Assumere come riferimento l’immagine sorgente. 
% Riportare i risultati usando la uitable(), e verbalmente nelle conclusioni.
% 
% Daniele Di Salvo --- 16 aprile 2019
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%% PARTE (a) %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Lettura dell'immagine sorgente
varImg = imread('blobs.png');
varImg = double(varImg);

% Mappa di ampiezze di edge 
ampiezzaSobelEdge = edge(varImg, 'Sobel');

% Filtro Sobel
sobelx = fspecial('sobel');
sobely = sobelx';

% Filtraggio dell'immagine con il filtro Sobel
immDerivx = imfilter(varImg,sobelx);
immDerivy = imfilter(varImg,sobely);

% Calcolo delle ampiezze di edge candidati con filtro di gradiente Sobel
immAmpGSobel = abs(immDerivx) + abs(immDerivy);

% Binarizzazione della mappa delle ampiezze degli edge candidati
BinarizeBW = im2bw(immAmpGSobel, 0.9); % soglia 0.9

% Visualizzazione dei risultati
subplot(1,3,1), imshow(varImg), title('Immagine Sorgente')
subplot(1,3,2), imshow(ampiezzaSobelEdge,[]), title('Mappa delle ampiezze edge()')
subplot(1,3,3), imshow(BinarizeBW, 'InitialMagnification', 'fit'), title('Mappa delle ampiezze gradiente Sobel')

%%%%%%%%%%%%%%%%%%%%%%%%%%%%% PARTE (b) %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Calcolare l’errore quadratico medio MSE
% Stima della precisione delle mappe di ampiezze di Sobel
mse_1 = immse(double(ampiezzaSobelEdge), varImg);
mse_2 = immse(double(BinarizeBW), varImg);

% Visualizzazione dei risultati in forma tabellare
figure('Name', 'Tabella MSE')
uit = uitable;
uit.ColumnName = {'MSE edge()', 'MSE Gradiente di Sobel'};
uit.ColumnEditable = false;
d = {mse_1,mse_2};
uit.Data = d;
uit.Position = [40 40 300 200];



