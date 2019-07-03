%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Script Esercizio 2.5 a,b,c,d)
%
% Usare l’immagine ‘text.png’.
% (a) Usando la procedura imtool() individuare una regione rettangolare dell’immagine che corrisponda al carattere ‘e’. 
% Ritagliare la sottoimmagine corrispondente usando la procedura imcrop(). 
% Visualizzare l’immagine sorgente e l’immagine ritagliata.
%
% (b) Calcolare la correlazione normalizzata tra le due immagini usando la procedura normxcorr2(); 
% visualizzare la correlazione rappresentandola in livelli di grigio assieme al proprio istogramma, 
% e in grafica 3D tramite la procedura surf()
%
% (c) Binarizzare l’immagine della correlazione tramite sogliatura usando la imbinarize() con valore di soglia thresh = 0.8. 
% Visualizzare l’immagine binarizzata.
%
% (d) Ripetere i calcoli della correlazione (passo (b)) e della binarizzazione (passo (c)) avendo ruotato di 90° 
% l'immagine ritagliata del carattere ‘e’ con la imrotate(). 
% Visualizzare i nuovi risultati come già fatto per la consegna (b).
% 
% Daniele Di Salvo --- 16 aprile 2019
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%% PARTE (a) %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Lettura dell'immagine sorgente
varText = imread('text.png');
letText = double(varText);

%txt = imtool(letText);

% Ritaglio della sottoimmagine corrispondente al carattere 'e'
txt2 = imcrop(letText,[140, 33, 12,12]);

% Visualizzazione dell'immagine sorgente e dell'immagine ritagliata
subplot(1,2,1), imshow(letText), title('Immagine Sorgente')
subplot(1,2,2), imshow(txt2), title('Crop image')

%%%%%%%%%%%%%%%%%%%%%%%%%%%%% PARTE (b) %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Correlazione incrociata normalizzata
crossCorrelation = normxcorr2(txt2, letText);

% Visualizzazione dei risultati
figure
subplot(1,2,1), imhist(crossCorrelation), grid, title('Normalized cross-correlation histogram')
subplot(1,2,2), surf(crossCorrelation), shading flat, title('Three-dimensional surface plot')

%%%%%%%%%%%%%%%%%%%%%%%%%%%%% PARTE (c) %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Binarizzazione della correlazione incrociata normalizzata con soglia 0.8
normalizedCrossBin = imbinarize(crossCorrelation, 0.8);

% Visualizzazione della correlazione binarizzata
figure, imshow(normalizedCrossBin), title('Cross-correlation binarizzata')

%%%%%%%%%%%%%%%%%%%%%%%%%%%%% PARTE (d) %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Rotazione del carattere 'e' di 90° in senso orario
charRotation = imrotate(txt2,-90);

% % Correlazione incrociata normalizzata
normaCrossCorrelation = normxcorr2(charRotation, letText);

% Visualizzazione dei risultati
figure('Name','Parte D')
subplot(1,2,1), imhist(normaCrossCorrelation), grid, title('Normalized cross-correlation histogram')
subplot(1,2,2), surf(normaCrossCorrelation), shading flat, title('Three-dimensional surface plot')

% Binarizzazione della correlazione incrociata normalizzata con soglia 0.8
normalizedCrossCorrelationBin = imbinarize(normaCrossCorrelation, 0.8);

% Visualizzazione della correlazione binarizzata
figure('Name','Parte D')
imshow(normalizedCrossCorrelationBin), title('Cross-correlation binarizzata')
