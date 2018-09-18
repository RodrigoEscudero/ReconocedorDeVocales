function coeficientesVocal(vocal)
% Función que calcula los centroides del parámetro pasado.
%
dt = Grabar (vocal); % Se graba y almacena la señal.
inicios (vocal,dt);  % Se extraen y almacenan los cepstrum.
centroide (vocal);   % Se extraen y almacenan los centroides.
end