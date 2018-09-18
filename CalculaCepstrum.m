function [ CoefCesptrum ] = CalculaCepstrum( frame )
% Funci�n que calcula los 10 primeros coeficientes Cepstrum de la trama que
% se le pase como par�metro.
%
TEMP=ifft(log(abs(fft(frame.*hamming(256))))); % Enventanado de Hamming de 256 muestras (32ms) de cada trama.
% CoefCesptrum = TEMP (1:10);
CoefCesptrum = TEMP (2:11); % Se desprecia el primer coeficiente por no ser significativo.
end