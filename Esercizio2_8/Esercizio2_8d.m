%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Script Esercizio 2.8
%
% (d) Ripetere i passi (b) e (c) effettuando l’analisi delle componenti 8-connesse.
%
% Daniele Di Salvo --- 30 aprile 2019
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

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

% Find connected components in binary image
CC = bwconncomp(img,8);
disp(CC);

% Misurazione delle proprietà delle regioni dell'immagine
stats = regionprops(CC,'Area', 'Perimeter');
areaOggetti = cat(1, stats.Area);
perimetroOggetti = cat(1, stats.Perimeter);
disp(areaOggetti);
disp(perimetroOggetti);

% Calculate centroids for connected components in the image using regionprops.
s = regionprops(CC,'centroid');
centroids = cat(1,s.Centroid);

% Display the binary image with the centroid locations superimposed.
figure
subplot(1,2,1), imshow(img), title('Immagine Sorgente')
subplot(1,2,2), imshow(img), title('Centroidi sovrapposti')
hold on
plot(centroids(:,1),centroids(:,2),'b*')
hold off