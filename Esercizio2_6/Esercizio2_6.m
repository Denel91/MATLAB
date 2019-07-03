%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Script Esercizio 2.6 
%
% (a) Studiare la documentazione MATLAB sulla procedura bwboundaries() per l段nseguimento di contorni 
% (contour following) in immagini binarie;
% (b) Visualizzare l段mmagine sorgente e il suo istogramma dei livelli di grigio;
% (c) Usando la bwboundaries() senza considerare le lacune (holes), ricavare dall段mmagine: 
% Nobj, numero di oggetti; 
% imgLabel, immagine delle etichette; 
% BoundObj, array con le posizioni dei pixel dei contorni degli oggetti; 
% visualizzare Nobj e BoundObj;
% (d) Visualizzare l段mmagine delle etichette imgLabel in formato sorgente e in formato RGB; 
% sovrapporre a questa i contorni degli oggetti dell誕rray BoundObj calcolato al punto (c), 
% e visualizzare questa immagine assieme alle prime due nella stessa finestra;
% (e) Ripetere i passi al punto (c) e (d) considerando anche le lacune.
%
% Daniele Di Salvo --- 30 aprile 2019
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%% PARTE (b) %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Lettura dell'immagine sorgente
images = imread('C:\Users\utente\Documents\MATLAB\images\phantX.gif');
varImages = double(images);

% Visualizzazione dell'immagine sorgente e dell'istogramma dei livelli di
% grigio
figure
subplot(1,2,1), imshow(varImages),title('Immagine Sorgente')
subplot(1,2,2), imhist(varImages), grid, title('Istogramma')

%%%%%%%%%%%%%%%%%%%%%%%%%%%%% PARTE (c) %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Traccio i confini delle regioni nell'immagine binaria
[BoundObj,imgLabel,Nobj] = bwboundaries(varImages,'noholes');

% Visualizzazione di Nobj e BoundObj
disp(Nobj);
disp(BoundObj);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%% PARTE (d) %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Visualizzazione di imgLabel sorgente
figure
subplot(1,3,1), imshow(imgLabel), title('imgLabel sorgente')

% Conversione di imgLabel in formato RGB
imgRGB = label2rgb(imgLabel, @jet, [.5 .5 .5]);

% Visualizzazione di imgLabel RGB
subplot(1,3,2),imshow(imgRGB), title('imgLabel RGB')

% Overlay Region Boundaries on Image
subplot(1,3,3),imshow(imgRGB),title('imgLabel sovrapposta')
hold on
for k = 1:length(BoundObj)
   boundary = BoundObj{k};
   plot(boundary(:,2), boundary(:,1), 'w', 'LineWidth', 2)
end

