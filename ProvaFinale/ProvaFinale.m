%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Script Prova Finale
% Considerare l’immagine ‘eight.tif’
% (a) Binarizzare l’immagine usando la procedura imbinarize() con una soglia = 0.7; 
% effettuare l’inversione oggetto-sfondo. Visualizzare: l’immagine originale; 
% l’immagine binarizzata, prima dell’inversione; l’immagine binarizzata dopo l’inversione oggetto-sfondo;
% i tre rispettivi istogrammi;
% 
% Daniele Di Salvo --- 28 maggio 2019
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%% PARTE (a)%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Lettura dell'immagine sorgente
img = imread('eight.tif');
threshold = 0.7;

% Binarizzazione dell'immagine sorgente
imgBinarizzata = imbinarize(img,threshold);

% Calcolo il negativo dell'immagine binarizzata
imgComplement = imcomplement(imgBinarizzata);

% Visualizzazione dei risultati
subplot(3,2,1), imshow(img), title('Immagine Sorgente')
subplot(3,2,2), histogram(img)
subplot(3,2,3), imshow(imgBinarizzata), title('Immagine Binarizzata')
subplot(3,2,4), histogram(imgBinarizzata)
subplot(3,2,5), imshow(imgComplement), title('Img Binarizzata dopo inversione')
subplot(3,2,6), histogram(imgComplement)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Script Prova Finale
%
% (b) Dall’immagine binaria dopo l’inversione estrarre gli edge usando la edge() con parametri di default; 
% estrarre i contorni usando la bwboundaries(). 
% In un’unica figura: 
% 1) visualizzare la mappa degli edge (solo ampiezze); 
% 2) visualizzare l’immagine delle etichette con sovrapposti i contorni; 
% dal confronto visivo di 1) con 2) riportare in breve le osservazioni nelle conclusioni;
% 
% Daniele Di Salvo --- 28 maggio 2019
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%% PARTE (b)%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Estrazione della mappa degli edge
edgeObject = edge(imgComplement);
 
[BoundObj,imgLabel,Nobj] = bwboundaries(imgComplement, 'noholes');

% Visualizzazione della mappa degli edge
figure
imshow(edgeObject), title('Mappa degli Edge')

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
   plot(boundary(:,2), boundary(:,1), 'w', 'LineWidth', 2)
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Script Prova Finale
%
% (c) Usando la regionprops() calcolare i centroidi nella 2). 
% Visualizzare i centroidi sovrapposti graficamente all’immagine 2); 
% visualizzare gli stessi centroidi in forma numerica tramite uitable() oppure table(); 
% riportare eventuali osservazioni nelle conclusioni;
% 
% Daniele Di Salvo --- 28 maggio 2019
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%% PARTE (c)%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Calculate centroids for connected components in the image using regionprops.
s = regionprops(imgComplement,'centroid');
centroids = cat(1,s.Centroid);

% Display the binary image with the centroid locations superimposed.
figure, imshow(imgRGB), title('Centroidi sovrapposti')
hold on
plot(centroids(:,1),centroids(:,2),'w*')
hold off

% Visualizzazione dei risultati in forma tabellare
f = figure;
colnames = {'Centroidi'};
t = uitable(f,'Data',[centroids],'ColumnName',colnames);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Script Prova Finale
%
% (d) Usando la regionprops() calcolare perimetri e aree delle regioni individuate.
% Visualizzare i risultati in forma di tabella usando la uitable() oppure la table().
% 
% Daniele Di Salvo --- 28 maggio 2019
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%% PARTE (d)%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Misurazione delle proprietà delle regioni dell'immagine
stats = regionprops(imgComplement,'Area', 'Perimeter');
areaGlobale = cat(1, stats.Area);
perimetroGlobale = cat(1, stats.Perimeter);

% Visualizzazione dei risultati in forma tabellare
f = figure;
colnames = {'Area', 'Perimetro'};
t = uitable(f,'Data',[areaGlobale,perimetroGlobale],'ColumnName',colnames);


