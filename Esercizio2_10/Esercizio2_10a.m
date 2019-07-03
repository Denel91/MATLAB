%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Script Esercizio 2.10 a) Introduzione alla Motion Analysis
%
% Considerare la sequenza viplanedeparture.mp4
% (a) Riprodurre la sequenza con implay() e visualizzare i metadati. 
% Estrarre la durata in secondi e il numero di frame che compongono la sequenza;
% 
% Daniele Di Salvo --- 14 maggio 2019
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

video = 'C:\Users\utente\Documents\MATLAB\images\videoPersonal.mp4';
% Define video seq. object
videoSeq = VideoReader(video);
metadati = get(videoSeq);
duration = videoSeq.Duration;
frameRate = videoSeq.NumberOfFrames;  
disp('Durata della sequenza');
disp(duration);
disp('Numero dei Frame');
disp(frameRate);
% Play movies, videos, or image sequences
implay('C:\Users\utente\Documents\MATLAB\images\videoPersonal.mp4')

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% PARTE B
% Estrarre il frame n.50. Visualizzare il frame; lo stesso convertito in livelli di grigio; 
% lo stesso binarizzato. Associare l’istogramma a ciascuna delle tre immagini.
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Explore frame content
% Extract and analyze a generic frame X, X here set to 50
frameX = read(videoSeq, 50);
frameGray = rgb2gray(frameX);
threshEx = 0.5;
% Frame binarized
frameBW = imbinarize(frameGray,threshEx);

figure('Name', 'Preliminary analysis on the sequence')
subplot(2,3,1), imshow(frameX), title('Frame from the input sequence')
subplot(2,3,2), imshow(frameGray), title('Frame converted to grayscale')
subplot(2,3,3), imshow(frameBW), title(['Frame binarized with threshold = ',  num2str(threshEx)])
subplot(2,3,4), histogram(frameX), grid
subplot(2,3,5), histogram(frameGray), grid
subplot(2,3,6), histogram(frameBW), grid

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% PARTE C
% Acquisire con un dispositivo mobile (smartphone, tablet) una sequenza video di 6-7 secondi,
% rispettando le seguenti condizioni: 
% c1) La scena reale deve contenere un singolo oggetto in moto relativo rigido rispetto al dispositivo, 
% che deve essere tenuto fermo; 
% c2) durante l’acquisizione non devono esserci apprezzabili variazioni di illuminazione: 
% ad esempio, si deve evitare di inquadrare una sorgente luminosa o lo schermo di un computer;
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

