%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Script Esercizio 1.4 b)
%
% Effettuare ricostruzioni parziali dell’originale sommando soltanto 
% alcuni piani di bit.
%
% Daniele Di Salvo --- 19 marzo 2019
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Lettura dell'immagine sorgente
cameraTif = imread('cameraman.tif');

% Creo una matrice vuota della stessa dimensione e della stessa classe
% dell'immagine sorgente.
varImm = zeros(size(cameraTif), class(cameraTif));

% Visualizzazione dell'immagine originale 
subplot(1,6,1), imshow(cameraTif), title("Immagine Sorgente")

% Somma dei piani di bit dal piano immagine 8 al piano immagine 4
for bitPosition = 8:-1:4
    bitImm = bitget(cameraTif, bitPosition); % Seleziono i piani di bit dell'immagine sorgente
    varImm = varImm + bitImm;
    subplot(1,6, 10 - bitPosition)
    imshow(varImm, []) % Visualizzazione di ogni piano
    title("Piano Immagine " + bitPosition)   
end