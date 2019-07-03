%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Script Esercizio 2.8 a, b, c)
%
% Costruire l’immagine 'Rectangles' con il frammento di codice MATLAB riportato dopo la traccia.
% (a) Visualizzare: l’immagine originale e il suo istogramma;
% (b) Applicare la procedura MATLAB bwconncomp() per l’analisi di componenti 4-connesse. 
%     Visualizzare i risultati dell’analisi compiuta dalla bwconncomp().
% (c) Usare la regionprops() per la stima di caratteristiche geometriche delle regioni individuate 
% al passo (b): in particolare riportare le stime di perimetri e aree delle regioni individuate tramite bwconncomp(). 
% Visualizzare l’immagine binaria con sovrapposti i centroidi delle regioni individuate.
%
% Daniele Di Salvo --- 30 aprile 2019
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%% PARTE (a)%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Immagine sintetica con rettangoli
img = zeros(50,50);     % 50x50px neri
img(10:40, 10:16)=1.;   % rettangolo di px bianchi
img(41:45, 5:10)=1.;    % rettangolo di px bianchi
img(19:40, 20:30)=1.;   % rettangolo di px bianchi
img(41:45, 31:45)=1.;   % rettangolo di px bianchi
img(5:20, 35:45)=1.;    % rettangolo di px bianchi

% Visualizzazione dell'immagine sintetica e relativo istogramma
subplot(1,2,1), imshow(img), title('Immagine Sorgente')
subplot(1,2,2), histogram(img), grid, title('Istogramma Immagine Sorgente')

%%%%%%%%%%%%%%%%%%%%%%%%%%%%% PARTE (b)%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Find connected components in binary image
CC = bwconncomp(img,4);
disp(CC);

% Misurazione delle proprietà delle regioni dell'immagine
stats = regionprops(CC,'Area', 'Perimeter');
areaOggetti = cat(1, stats.Area);
perimetroOggetti = cat(1, stats.Perimeter);
disp(areaOggetti);
disp(perimetroOggetti);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%% PARTE (c)%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Calculate centroids for connected components in the image using regionprops.
s = regionprops(CC,'Centroid');
centroids = cat(1,s.Centroid);

% Display the binary image with the centroid locations superimposed.
figure
subplot(1,2,1), imshow(img), title('Immagine Sorgente')
subplot(1,2,2), imshow(img), title('Centroidi sovrapposti')
hold on
plot(centroids(:,1),centroids(:,2),'b*')
hold off