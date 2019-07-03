%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Script Esercizio 2.1 a)
%
% (a) L’immagine della scacchiera - checkerboard() - deve essere rappresentata in forma binaria 
% e risoluzione 256x256 pixel. Applicare alla scacchiera rumore additivo gaussiano a media nulla, 
% con varianza 0.1 (rumore basso); e con varianza 1. (rumore alto). Visualizzare l’immagine sorgente 
% della scacchiera e le due immagini con rumore, assieme ai rispettivi istogrammi dei livelli di grigio;
%
% Daniele Di Salvo --- 2 aprile 2019
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Create Square Checkerboard where the side of every square is 32 pixels in length.
scacchiera = double((checkerboard(32) > 0.5));

% Add noise to Checkerboard
rumoreBasso = imnoise(scacchiera,'gaussian', 0, 0.1); % adds Gaussian white noise with mean 0 and variance of 0.1.
rumoreAlto = imnoise(scacchiera,'gaussian', 0, 1); % adds Gaussian white noise with mean 0 and variance of 1.

% Visualizzazione dell'immagine sorgente
subplot(3,2,1), imshow(scacchiera, 'InitialMagnification', 'fit'), title('Immagine Sorgente')
% Istogramma dell'immagine sorgente
subplot(3,2,2), imhist(scacchiera), grid, title('Istogramma immagine sorgente')

% Visualizzazione della scacchiera con varianza 0.01
subplot(3,2,3), imshow(rumoreBasso, 'InitialMagnification', 'fit'), title('Scacchiera con varianza 0.01')
% Istogramma della scacchiera con varianza 0.01
subplot(3,2,4), imhist(rumoreBasso), grid, title('Istogramma scacchiera con varianza 0.01')

% Visualizzazione della scacchiera con varianza 1
subplot(3,2,5), imshow(rumoreAlto, 'InitialMagnification', 'fit'), title('Scacchiera con varianza 1')
% Istogramma della scacchiera con varianza 1
subplot(3,2,6), imhist(rumoreAlto), grid, title('Istogramma scacchiera con varianza 1')

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Script Esercizio 2.1 b, c, d)
%
% (b) Effettuare il filtraggio delle due immagini con rumore (non dell’immagine sorgente!) 
% tramite filtro di media (average) con maschera 3x3. 
% Visualizzare:
% b1) Immagine sorgente; con rumore basso; filtrata;
% b2) Immagine sorgente; con rumore alto; filtrata.
%
% (c) Stimare quantitativamente l’effetto del rumore e del filtraggio di media usando l’MSE, 
% avendo preso come riferimento l’immagine sorgente. In particolare:
% (c1) Stimare l’MSE delle immagini con rumore basso-alto, prima del filtraggio;
% (c2) Stimare l’MSE delle immagini che avevano rumore basso-alto, dopo il filtraggio;
% Riportare i risultati in un’unica tabella usando la procedura uitable().
%
% (d) Ripetere i calcoli effettuati ai punti (b), (c) con lo stesso operatore di media (average) e
% maschere di dimensioni 5x5, 9x9. Non visualizzare le immagini. 
% Usando la procedura uitable() riportare in un’unica tabella i seguenti dati:
% d1) Le stime dell’MSE per immagini con rumore basso-alto non filtrate 
% (riportare le stime già effettuate al punto (c1));
% d2) Le stime MSE per le immagini con rumore basso-alto, filtrate con le diverse 
% maschere: 3x3 (già al punto (c2)); 5x5 ; 9x9
%
% Daniele Di Salvo --- 2 aprile 2019
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Filtraggio delle due immagini con rumore

% Restituisce il filtraggio medio di dimensioni 3 x 3
filtro3x3 = fspecial('average',3);
% Filtra la matrice utilizzando il filtro 3x3
average = imfilter(rumoreBasso,filtro3x3);
average_2 = imfilter(rumoreAlto, filtro3x3);

% Restituisce il filtraggio medio di dimensioni 5 x 5
filtro5x5 = fspecial('average', 5);
% Filtra la matrice utilizzando il filtro 5 x 5
imm_filtro5x5 = imfilter(rumoreBasso,filtro5x5);
imm2_filtro5x5 = imfilter(rumoreAlto, filtro5x5);

% Restituisce il filtraggio medio di dimensioni 9 x 9
filtro9x9 = fspecial('average', 9);
% Filtra la matrice utilizzando il filtro 9 x 9
imm_fil9x9 = imfilter(rumoreBasso,filtro9x9);
imm2_fil9x9 = imfilter(rumoreAlto, filtro9x9);

figure('Name','Filtraggi')
% Sequenza immagini con rumore basso
subplot(2,5,1), imshow(scacchiera, 'InitialMagnification', 'fit'), title('Immagine Sorgente')
subplot(2,5,2), imshow(rumoreBasso, 'InitialMagnification', 'fit'), title('Immagine con rumore basso')
subplot(2,5,3), imshow(average, 'InitialMagnification', 'fit'), title('Immagine con filtro 3x3')
subplot(2,5,4), imshow(imm_filtro5x5, 'InitialMagnification', 'fit'), title('Immagine con filtro 5x5')
subplot(2,5,5), imshow(imm_fil9x9, 'InitialMagnification', 'fit' ), title('Immagine con filtro 9x9')
% Sequenza immagini con rumore alto
subplot(2,5,6), imshow(scacchiera, 'InitialMagnification', 'fit'), title('Immagine Sorgente')
subplot(2,5,7), imshow(rumoreAlto, 'InitialMagnification', 'fit'), title('Immagine con rumore alto')
subplot(2,5,8), imshow(average_2, 'InitialMagnification', 'fit'), title('Immagine con filtro 3x3')
subplot(2,5,9), imshow(imm2_filtro5x5, 'InitialMagnification', 'fit'), title('Immagine con filtro 5x5')
subplot(2,5,10),imshow(imm2_fil9x9, 'InitialMagnification', 'fit'), title('Immagine con filtro 9x9')

% calcolare l’errore quadratico medio MSE prima del filtraggio
mse_1 = immse(rumoreBasso, scacchiera);
mse_2 = immse(rumoreAlto, scacchiera);

% calcolare l’errore quadratico medio MSE dopo il filtraggio 3 x 3
mse_3 = immse(average, scacchiera);
mse_4 = immse(average_2, scacchiera);

% calcolare l’errore quadratico medio MSE dopo il filtraggio 5 x 5
mse_5 = immse(imm_filtro5x5, scacchiera);
mse_6 = immse(imm2_filtro5x5, scacchiera);

% calcolare l’errore quadratico medio MSE dopo il filtraggio 9 x 9
mse_7 = immse(imm_fil9x9, scacchiera);
mse_8 = immse(imm2_fil9x9, scacchiera );

% Visualizzazione dei risultati in forma tabellare
figure('Name', 'Tabella MSE')
uit = uitable;
uit.ColumnName = {'MSE senza filtro', 'MSE con filtro 3 x 3','MSE con filtro 5 x 5', 'MSE con filtro 9 x 9'};
uit.ColumnEditable = false;
d = {mse_1,mse_3,mse_5,mse_7; 
     mse_2, mse_4,mse_6,mse_8};
uit.RowName = {'Rumore Basso', 'Rumore Alto'};
uit.Data = d;
uit.Position = [30 30 550 200];

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Script Esercizio 2.1 e)
%
% (e) Riportare nelle osservazioni finali, brevemente:
% e1) Con riferimento al punto (c): quali effetti ha avuto il filtraggio di media?
% e2) Con riferimento al punto (d): quale delle maschere 3x3, 5x5, 9x9 dell’operatore di 
% media ha operato in modo più efficace?
%
% OSSERVAZIONI FINALI
%
% Daniele Di Salvo --- 2 aprile 2019
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Il filtraggio medio con filtro 3 x 3 ha ridotto notevolmente il livello di
% rumore nelle due immagini.

% Nell'immagine con rumore basso l'operatore di media ha operato meglio
% utilizzando il filtro 3 x 3 e ottenendo come risultato un valore 
% dell' errore quadratico medio migliore rispetto a tutti gli altri filtri.

% Nell'immagine con rumore alto l'operatore di media ha operato meglio
% utilizzando il filtro 5 x 5 e ottenendo come risultato un valore
% dell'errore quadratico medio migliore rispetto a tutti gli altri filtri.

























