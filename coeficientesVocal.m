function coeficientesVocal(vocal)
% Funci�n que calcula los centroides del par�metro pasado.
%
dt = Grabar (vocal); % Se graba y almacena la se�al.
inicios (vocal,dt);  % Se extraen y almacenan los cepstrum.
centroide (vocal);   % Se extraen y almacenan los centroides.
end