%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Script Esercizio 2.4 a)
%
% Definire un’immagine sintetica binaria costituita da soli tre punti bianchi isolati. 
% Applicare rumore gaussiano additivo a media nulla e varianza 0.01. 
% Applicare un filtro derivativo di Laplace alla sola immagine col rumore, 
% per ottenere la mappa delle ampiezze di edge candidati. 
% Usare fspecial() con parametro alpha di default e imfilter(). 
% Visualizzare le due immagini iniziali senza e con rumore; 
% nella stessa finestra visualizzare la mappa di ampiezze col rumore, anche in modalità grafica 3D 
% usando la procedura mesh().
% 
% Daniele Di Salvo --- 16 aprile 2019
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Definizione di una immagine sintetica binaria costituita da tre punti
% bianchi isolati.
img = zeros(60,60);
img(6:6, 17:17)= 1;
img(19:19, 30:30)= 1;
img(45:45, 35:35)= 1;
img = double(img);

% Add gaussian noise to imagine
imgNoise = imnoise(img,'gaussian', 0, 0.01); % adds Gaussian white noise with mean 0 and variance of 0.01.

% Filtro di Laplace
filterLaplace = fspecial('laplacian');

% Mappa delle ampiezze
imgLaplace = imfilter(imgNoise, filterLaplace);

% Visualizzazione dei risultati
subplot(1,4,1), imshow(img), title('Immagine Sorgente')
subplot(1,4,2), imshow(imgNoise), title('Immagine con rumore')
subplot(1,4,3), imshow(imgLaplace, []), title('Mappa delle ampiezze')
subplot(1,4,4), mesh(imgLaplace), title('Mappa delle ampiezze 3D')

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Script Esercizio 2.4 b)
%
% Calcolare psnr, snr e MSE per stimare il rapporto segnale-rumore dell’immagine prima e dopo il filtraggio di Laplace. 
% Prima del filtraggio prendere come riferimento l’immagine sorgente senza rumore; 
% dopo il filtraggio ricalcolare le tre stime prendendo come riferimento l’immagine iniziale con rumore. 
% Riportare i risultati in un’unica tabella usando uitable().
% 
% Daniele Di Salvo --- 16 aprile 2019
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Calcolare il rapporto segnale-rumore di picco (PSNR) e il rapporto segnale rumore (SNR)
[peaksnr,snr] = psnr(imgNoise, img);
[peaksnr2,snr2] = psnr(imgLaplace, img);

% Calcolare l’errore quadratico medio MSE
mseR = immse(imgNoise,img); % MSE prima del filtraggio del'immagine
mseF = immse(imgLaplace, img); % MSE dopo il filtraggio dell'immagine

% Visualizzazione dei risultati in forma tabellare
figure('Name', 'Tabella')
uit = uitable;
uit.ColumnName = {'peaksnr', 'snr', 'MSE'};
uit.RowName = {'Img con rumore','Img filtrata'};
uit.ColumnEditable = false;
d = {peaksnr,snr,mseR;
     peaksnr2,snr2,mseF};
uit.Data = d;
uit.Position = [40 40 400 200];

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Script Esercizio 2.4 c)
%
% Invertire l’immagine filtrata (negativo-->positivo) ed eliminare i valori negativi mediante sogliatura 
% usando imbinarize(); 
% Visualizzare la nuova immagine anche in modalità grafica.
% 
% Daniele Di Salvo --- 16 aprile 2019
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Inverto l'immagine filtrata
imagesReverse = -imgLaplace;

% Binarizzazione dell'immagine inversa con soglia uguale a 1
positiveImgBW = imbinarize(imagesReverse, 1);

% Visualizzazione dei risultati 
figure('Name','Data');
subplot(1,2,1), imshow(positiveImgBW)
subplot(1,2,2), mesh(positiveImgBW) % Visualizzazione grafica
