%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Script Esercizio 2.9 
%
% Considerare l’immagine ‘circlesBrightDark.png’
% (a) Effettuare l’inversione oggetto-sfondo; binarizzare l’immagine; aggiungere alla immagine binarizzata
% tre rettangoli pieni disgiunti tra loro e dagli altri oggetti dell’immagine. 
% Visualizzare: l’immagine originale; il suo istogramma; 
% l’immagine binarizzata; l’immagine modificata con l’aggiunta dei rettangoli;
%
% Daniele Di Salvo --- 07 maggio 2019
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Lettura dell'immagine sorgente
imgSorg = imread('circlesBrightDark.png');

% Calcolo il negativo dell'immagine sorgente
imgComplement = imcomplement(imgSorg);

% Binarizzazione dell'immagine negativa
imgBW = imbinarize(imgComplement);
varBW = imgBW;

% Add rettangoli bianchi all'immagine negativa
varBW(10:60, 20:110)=1.;    % rettangolo di px bianchi
varBW(100:140, 70:150)=1.;  % rettangolo di px bianchi
varBW(200:250, 80:170)=1.;  % rettangolo di px bianchi

% Rappresentazione dei risultati
figure
subplot(2,2,1), imshow(imgSorg), title('Immagine Sorgente')
subplot(2,2,2), histogram(imgSorg),grid, title('Istogramma Immagine Sorgente')
subplot(2,2,3), imshow(imgBW), title('Immagine Binarizzata')
subplot(2,2,4), imshow(varBW), title('Immagine Modificata')

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Script Esercizio 2.9 
%
% (b) All’ultima immagine applicare la procedura MATLAB bwconncomp() per l’analisi di componenti
% connesse. Visualizzare, usando la fprintf(), i risultati dell’analisi compiuta dalla bwconncomp().
% In particolare: la connettività; la risoluzione dell’immagine; il numero di oggetti individuati; 
% la dimensione dell’array di celle contenenti i pixel appartenenti a ciascun oggetto.
%
% Daniele Di Salvo --- 07 maggio 2019
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

CC = bwconncomp(varBW);
disp(CC);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Script Esercizio 2.9 
%
% (c) Usare la regionprops() per la stima di caratteristiche geometriche (geometric features) delle regioni
% individuate al passo (b): in particolare riportare in una tabella uitable() le stime di perimetri, aree, 
% centroidi delle regioni individuate tramite bwconncomp(). Visualizzare l’immagine binaria modificata come 
% al punto (a), con sovrapposti i centroidi delle regioni individuate.
%
% Daniele Di Salvo --- 07 maggio 2019
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Misurazione delle proprietà delle regioni dell'immagine
stats = regionprops(CC,'Area', 'Perimeter', 'Centroid');
area = cat(1, stats.Area);
perimetro = cat(1, stats.Perimeter);
centroidi = cat(1, stats.Centroid);

% Visualizzazione dei risultati in forma tabellare
f = figure;
colnames = {'Area', 'Perimetro', 'Centroidi'};
t = uitable(f,'Data',[area,perimetro,centroidi],'ColumnName',colnames);

% Visualizzazione dei centroidi delle regioni individuate
figure
imshow(varBW), title('Centroidi sovrapposti')
hold on
plot(centroidi(:,1),centroidi(:,2),'b*')
hold off

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Script Esercizio 2.9 
%
% (d) Visualizzare la stessa immagine con sovrapposti i centroidi delle sole regioni di forma circolare.
%
% Daniele Di Salvo --- 07 maggio 2019
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Display the binary image with the centroid locations superimposed.
figure
imshow(varBW), title('Centroidi sovrapposti delle sole regioni circolari')
threshold = 0.95;
hold on
for k = 1:CC.NumObjects
    kArea = stats(k).Area;
    kPerimetro = stats(k).Perimeter;
    % compute the roundness metric
      metric = 4*pi*kArea/ kPerimetro^2;
        if  metric > threshold
              centroid = stats(k).Centroid;
              plot(centroid(1),centroid(2),'b*');
              text(centroid(:,1),centroid(:,2), sprintf('%f',metric),'Color', 'r', 'FontSize',12);
        end
end
hold off
title("Le metriche più vicine a 1 indicano che l'oggetto è approssimativamente rotondo")



