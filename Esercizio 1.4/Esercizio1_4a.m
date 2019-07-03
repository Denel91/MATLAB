%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Script Esercizio 1.4 a)
%
% Selezionare gli otto piani di bit con la procedura bitget().
%
% Daniele Di Salvo --- 19 marzo 2019
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Lettura dell'immagine sorgente
cameraTif = imread('cameraman.tif');

% Visualizzazione degli otto piani di bit
for bitPosition = 1:8
    bitImm = bitget(cameraTif, bitPosition); % Seleziono gli otto piani di bit dell'immagine sorgente
    subplot(2,4,bitPosition), imshow(bitImm, gray(2));
    title("Piano Immagine " + bitPosition)   
end