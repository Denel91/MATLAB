%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Script Esercizio 2.6 e)
%
% (e) Ripetere i passi al punto (c) e (d) considerando anche le lacune.
% 
% Daniele Di Salvo --- 30 aprile 2019
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Lettura dell'immagine sorgente
images = imread('C:\Users\utente\Documents\MATLAB\images\phantX.gif');
varImages = double(images);

% Traccio i confini delle regioni nell'immagine binaria
[BoundObj,imgLabel,Nobj] = bwboundaries(varImages,'holes');

% Visualizzazione di Nobj e BoundObj
disp(Nobj);
disp(BoundObj);

% Visualizzazione di imgLabel sorgente
figure
subplot(1,3,1), imshow(imgLabel), title('imgLabel sorgente')

% Conversione delle etichette in formato RGB
imgRGB = label2rgb(imgLabel, @jet, [.5 .5 .5]);

% Visualizzazione di imgLabel RGB
subplot(1,3,2),imshow(imgRGB), title('imgLabel RGB')

% Overlay Region Boundaries on Image
subplot(1,3,3),imshow(imgRGB), title('imgLabel sovrapposta')
hold on
for k = 1:length(BoundObj)
   boundary = BoundObj{k};
   plot(boundary(:,2), boundary(:,1), 'w', 'LineWidth', 2)
end
