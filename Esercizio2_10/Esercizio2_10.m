%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Script Esercizio 2.10 Introduzione alla Motion Analysis
%
% 
% Daniele Di Salvo --- 14 maggio 2019
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

load mristack
%implay(mristack)
implay('traffic.avi')
% Define video seq. object
videoSeq = VideoReader('traffic.avi');
% Metadati: Extract video parameters as object attributes
infoVid = get(videoSeq);
nframes = videoSeq.NumberOfFrames;
disp('Number of frames');
disp(nframes);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Explore frame content
% Extract and analyze a generic frame X, X here set to 71
frameX = read(videoSeq, 71);
% Frame format converted to grayscale
frameGray = rgb2gray(frameX);
threshEx = 0.5;
% Frame binarized
frameBW = imbinarize(frameGray,threshEx);
%
figure('Name', 'Preliminary analysis on the sequence')
subplot(2,3,1), imshow(frameX), title('Frame from the input sequence')