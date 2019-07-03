%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Script Esercizio 2.11 Motion Analysis
% 
% (a) Considerare la sequenza traffic.avi Estrarre il frame n.35 e visualizzarlo; 
% visualizzare lo stesso convertito in livelli di grigio; lo stesso binarizzato con soglia thresh = 0.5. 
% Associare l’istogramma a ciascuna delle tre immagini;
% (b) Implementare l’algoritmo di segmentazione del moto (Lezione 2.4, par.3). 
% In particolare: in un ciclo sui frame, calcolare il valore assoluto delle differenze pixel per pixel tra due frame consecutivi; 
% binarizzare le immagini così ottenute, usando un valore di soglia threshDiff = 0.3. 
% Visualizzare la sequenza delle differenze prima e dopo la sogliatura.
% (c) Considerare la sequenza videoPersonal.X e ripetere le operazioni effettuate al punto (b).
%
% 
% Daniele Di Salvo --- 21 maggio 2019
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% implay('traffic.avi')
% Define video seq. object
videoSeq = VideoReader('C:\Users\utente\Documents\MATLAB\images\videoPersonal.mp4');
% Metadati: Extract video parameters as object attributes
infoVid = get(videoSeq);
nframes = videoSeq.NumberOfFrames;
disp('Number of frames');
disp(nframes);

% Explore frame content
% Extract and analyze a generic frame X, X here set to 35
frameX = read(videoSeq, 35);
% Frame format converted to grayscale
frameGray = rgb2gray(frameX);
threshEx = 0.5;
% Frame binarized
frameBW = imbinarize(frameGray,threshEx);

figure('Name', 'Preliminary analysis on the sequence')
subplot(3,2,1), imshow(frameX), title('Frame from the input sequence')
subplot(3,2,2), histogram(frameX)
subplot(3,2,3), imshow(frameGray), title('Frame converted to grayscale')
subplot(3,2,4), histogram(frameGray)
subplot(3,2,5), imshow(frameBW), title(['Frame binarized with threshold = ',  num2str(threshEx)])
subplot(3,2,6), histogram(frameBW)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
nfrm1 = nframes - 1;
videoDiffer = zeros([size(frameX,1), size(frameX, 2), 1,nfrm1], class(frameBW));
videoDiffer_2 = zeros([size(frameX,1), size(frameX, 2), 1,nfrm1], class(frameBW));
threshDiff = 0.2;

for k = 1 : nfrm1
    currentFrame = read(videoSeq, k);
    succFrame = read(videoSeq, k + 1);
    currentFrameGray = rgb2gray(currentFrame);
    succFrameGray = rgb2gray(succFrame);
    differ = abs(currentFrameGray - succFrameGray); 
    frame_BW = imbinarize(differ,threshDiff);
    videoDiffer_2(:,:,:,k) = differ;
    videoDiffer(:,:,:,k) = frame_BW;
end

h = implay(videoDiffer_2);
set(h.Parent, 'Name', 'Differenza non binarizzata') %// set title
k = implay(videoDiffer);
set(k.Parent, 'Name', 'Differenza binarizzata') %// set title


