%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Script Esercizio 2.7 
%
% Considerare l’immagine geomTest.png e prestare attenzione alla sua forma di array nello spazio di lavoro.
% (a) Convertirla nella sua negativa. Visualizzare l’immagine e la negativa, ciascuna col proprio istogramma;
% 
% Daniele Di Salvo --- 30 aprile 2019
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Lettura dell'immagine sorgente
images = imread('C:\Users\utente\Documents\MATLAB\images\geomTest.png');
varImages = double(images);
geom = im2bw(varImages);

% Calcolo il negativo dell'immagine sorgente
imgComplement = imcomplement(geom);

% Visualizzazione dell'immagine sorgente e dell'immagine complementare
subplot(2,2,1), imshow(geom), title('Immagine Sorgente')
subplot(2,2,2), histogram(geom), grid, title('Istogramma Immagine Sorgente')
subplot(2,2,3), imshow(imgComplement), title('Immagine Negativa')
subplot(2,2,4), histogram(imgComplement), grid, title('Istogramma Immagine Negativa')

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Script Esercizio 2.7 
%
% (b) Usando la procedura bwboundaries() estrarre il numero di oggetti Nobj; i contorni di ciascun
% oggetto codificati in BoundObj; l’array di etichette imgLabel. Visualizzare soltanto l’immagine RGB
% delle etichette, con sovrapposti i contorni degli oggetti;
%
% Daniele Di Salvo --- 30 aprile 2019
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Calcolo i confini delle regioni nell'immagine
[BoundObj,imgLabel,Nobj] = bwboundaries(geom, 'holes');

% Conversione delle etichette in formato RGB
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

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Script Esercizio 2.7 
%
% (c) Usando la procedura regionprops() e la matrice delle etichette che si era ricavata al punto (b),
% estrarre le caratteristiche geometriche (features) 'Perimeter', 'Area' di ciascuna regione.
% I valori di perimetri e aree devono essere presentati in una tabella usando la uitable().
%
% Daniele Di Salvo --- 30 aprile 2019
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Misurazione delle proprietà delle regioni dell'immagine
stats = regionprops(imgLabel,'Area', 'Perimeter');
areaGlobale = cat(1, stats.Area);
perimetroGlobale = cat(1, stats.Perimeter);

% Visualizzazione dei risultati in forma tabellare
f = figure;
colnames = {'Area', 'Perimetro'};
t = uitable(f,'Data',[areaGlobale,perimetroGlobale],'ColumnName',colnames);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Script Esercizio 2.7 
%
% (d) Analogamente a quanto fatto al punto (c) estrarre i centroidi ('Centroids'), e visualizzare l’immagine
% RGB delle etichette con sovrapposti i centroidi degli oggetti.
%
% Daniele Di Salvo --- 30 aprile 2019
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Calculate centroids for connected components in the image using regionprops.
s = regionprops(imgLabel,'Centroid');
centroids = cat(1,s.Centroid);

% Display the binary image with the centroid locations superimposed.
figure, imshow(imgRGB), title('Centroidi sovrapposti')
hold on
plot(centroids(:,1),centroids(:,2),'b*')
hold off

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Script Esercizio 2.7 
%
% (e) Per ogni oggetto calcolare il fattore di forma di circolarità (roundness factor). 
% Individuare gli oggetti che più si avvicinano ad una forma circolare.
% Visualizzare l’immagine RGB coi contorni sovrapposti (punto (b)) a cui siano ulteriormente 
% sovrapposti i valori di roundness.
%
% Daniele Di Salvo --- 30 aprile 2019
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

figure, imshow(imgRGB)
hold on
for k = 1:length(BoundObj)
    boundary = BoundObj{k};
    plot(boundary(:,2), boundary(:,1), 'r', 'LineWidth', 2)
    area = stats(k).Area;
    perimeter = stats(k).Perimeter;
    roundness = (4 * pi * area / perimeter^2); % roundness
        if roundness > 0.94
             centroid = s(k).Centroid;
             plot(centroid(1),centroid(2),'ko');
             text(centroid(:,1),centroid(:,2), sprintf('%f',roundness),'Color', 'w', 'FontSize',12);
        end
end
title("Le metriche più vicine a 1 indicano che l'oggetto è approssimativamente rotondo")




