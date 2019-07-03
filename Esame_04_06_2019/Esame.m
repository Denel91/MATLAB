%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Script Finale Esame 
%
% Usare l’immagine ‘eye.gif’.
% (a) Aggiungere rumore tipo ‘speckle’ usando la procedura imnoise() con varianza var=0.9. Visualizzare l’immagine
% sorgente; quella con rumore; i rispettivi istogrammi dei livelli di grigio;

% (b) Ridurre il rumore applicando un filtro di tipo ‘disk’ con tre valori del parametro radius=1,3,7. Visualizzare
% nuovamente l’immagine con rumore assieme alle filtrate, ciascuna con il rispettivo istogramma. Individuare il filtro con
% le prestazioni migliori usando il MSE e riportarlo nelle conclusioni. Riportare i risultati in tabella con uitable() ;
% 
% (c) Sull’immagine filtrata che è stata valutata migliore, calcolare due mappe di ampiezze di edge. Calcolare entrambe
% usando la edge() con filtraggio ‘LOG’ (Laplacian Of Gaussian) e due valori di soglia, threshold=0. e 0.015.
% Visualizzarle in un’unica figura. Riportare brevi osservazioni nelle conclusioni;
% 
% (d) Sulla stessa immagine selezionata al punto (c) individuare le regioni (oggetti) e i loro contorni usando la
% bwboundaries() con l’opzione ‘holes’. Visualizzare due immagini: quella delle regioni etichettate e la stessa con i
% contorni sovrapposti;
% 
% (e) Ripetere le operazioni richieste al punto (d) usando l’opzione ‘noholes’. Visualizzare in una nuova figura le due
% immagini come al punto (d).
%
% Daniele Di Salvo, matricola: 107753 --- 04 giugno 2019
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%% PARTE (a) %%%%%%%%
% Lettura dell'immagine sorgente
varImg = imread('C:\Users\utente\Documents\MATLAB\images\Eye.gif');
letImg = double(varImg);

% Add noise to image
noiseImg = imnoise(letImg,'speckle', 0.9);

% Visualizzazione dell'immagine sorgente e dell'immagine con rumore
subplot(2,2,1), imshow(letImg), title('Immagine Sorgente')
subplot(2,2,2), histogram(letImg)
subplot(2,2,3), imshow(noiseImg), title('Immagine con rumore')
subplot(2,2,4), histogram(noiseImg)

%%%%%%%% PARTE (b) %%%%%%%%
% Creazione dei tre filtri 
filtro_1 = fspecial('disk', 1);
filtro_2 = fspecial('disk', 3);
filtro_3 = fspecial('disk', 7);

% Filtraggio dell'immagine con rumore
filtraggio_1 = imfilter(noiseImg, filtro_1);
filtraggio_2 = imfilter(noiseImg, filtro_2);
filtraggio_3 = imfilter(noiseImg, filtro_3);

% Visualizzazione dei risultati
figure
subplot(4,2,1), imshow(noiseImg), title('Immagine con rumore')
subplot(4,2,2), histogram(noiseImg)
subplot(4,2,3), imshow(filtraggio_1), title('Filtro con raggio 1')
subplot(4,2,4), histogram(filtraggio_1)
subplot(4,2,5), imshow(filtraggio_2), title('Filtro con raggio 3')
subplot(4,2,6), histogram(filtraggio_2)
subplot(4,2,7), imshow(filtraggio_3), title('Filtro con raggio 7')
subplot(4,2,8), histogram(filtraggio_3)

% Calcolo l'errore quadratico medio MSE
mse_1 = immse(filtraggio_1,letImg);
mse_2 = immse(filtraggio_2,letImg);
mse_3 = immse(filtraggio_3,letImg);

% Visualizzazione dei risultati in forma tabellare
figure('Name', 'Tabella MSE')
uit = uitable;
uit.ColumnName = {'MSE_1', 'MSE_2','MSE_3'};
uit.ColumnEditable = false;
d = {mse_1,mse_2,mse_3};
uit.Data = d;
uit.Position = [30 30 550 200];

%%%%% CONCLUSIONI %%%%%
% Calcolando l'MSE in riferimento ai tre filtri, le presatazioni migliori si sono ottenute utilizzando 
% il filtro di tipo 'disk' con raggio 3. Le prestazioni sono notevolmente peggiorate utilizzando il filtro
% di raggio 7.

%%%%%%%% PARTE (c) %%%%%%%%
% Mappa di ampiezze di edge 
LoG_1 = edge(filtraggio_2, 'log', 0);
LoG_2 = edge(filtraggio_2, 'log', 0.015);

% Visualizzazione dei risultati
figure('Name', 'LoG')
subplot(1,2,1), imshow(LoG_1), title('Filtro LoG con soglia 0')
subplot(1,2,2), imshow(LoG_2), title('Filtro loG con soglia 0.015')

%%%%% CONCLUSIONI %%%%%
% Calcolando le due mappe delle ampiezze con soglia 0 e soglia 0.015 si può 
% concludere che tenendo la soglia a 0 il filtro derivativo Laplaciano- Gaussiano
% trova rapidamente le aree interessate da un rapido cambiamento. 
% Siccome il filtro derivativo è molto sensibile al rumore è stato necessario ridurlo prima 
% di appplicare il LoG. 

%%%%%%%% PARTE (d) %%%%%%%%
% Traccio i confini delle regioni nell'immagine binaria
[BoundObj,imgLabel,Nobj] = bwboundaries(filtraggio_2,'holes');

% Conversione di imgLabel in formato RGB
imgRGB = label2rgb(imgLabel, @jet, [.5 .5 .5]);

% Visualizzazione di imgLabel RGB
figure
subplot(1,2,1),imshow(imgRGB), title('imgLabel RGB')
% Overlay Region Boundaries on Image
subplot(1,2,2),imshow(imgRGB), title('imgLabel sovrapposta con i contorni degli oggetti')
hold on
for k = 1:length(BoundObj)
   boundary = BoundObj{k};
   plot(boundary(:,2), boundary(:,1), 'r', 'LineWidth', 2)
end

%%%%%%%% PARTE (e) %%%%%%%%
% Traccio i confini delle regioni nell'immagine binaria
[BoundObj,imgLabel,Nobj_2] = bwboundaries(filtraggio_2,'noholes');

% Conversione di imgLabel in formato RGB
imgRGB = label2rgb(imgLabel, @jet, [.5 .5 .5]);

% Visualizzazione di imgLabel RGB
figure
subplot(1,2,1),imshow(imgRGB), title('imgLabel RGB')
% Overlay Region Boundaries on Image
subplot(1,2,2),imshow(imgRGB), title('imgLabel sovrapposta con i contorni degli oggetti')
hold on
for k = 1:length(BoundObj)
   boundary = BoundObj{k};
   plot(boundary(:,2), boundary(:,1), 'r', 'LineWidth', 2)
end