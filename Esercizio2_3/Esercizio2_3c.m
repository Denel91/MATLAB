%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Script Esercizio 2.3 c)
%
% Effettuare tre filtraggi LoG dell’immagine ‘mri.tif’, usando la edge() rispettivamente con il parametro sigma = 0.5; 2; 3 della gaussiana. 
% Riportare le osservazioni nelle conclusioni.
% 
% Daniele Di Salvo --- 16 aprile 2019
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%% PARTE (c) %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Lettura dell'immagine sorgente
varPD = imread('mri.tif');
mri = double(varPD);

% Mappa di ampiezze di edge 
LoG_1 = edge(mri, 'log', 0.5);
LoG_2 = edge(mri, 'log', 2);
LoG_3 = edge(mri, 'log', 3);

% Visualizzazione dei risultati
subplot(1,4,1), imshow(varPD), title('Immagine Sorgente')
subplot(1,4,2), imshow(LoG_1), title('Operatore LoG sigma = 0.5')
subplot(1,4,3), imshow(LoG_2), title('Operatore LoG sigma = 2')
subplot(1,4,4), imshow(LoG_3), title('Operatore LoG sigma = 3')

