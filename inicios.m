function inicios(vocal,fileName)
% Funci�n que permite almacenar los coeficioentes Cepstrum de la vocal
% elegida.
%
[signalInicial,fs] = wavread(strcat (dirName,'\wavs\',vocal,'\',fileName,'.wav')); % Lectura en 'wavs'.
signal=preenfasis(signalInicial);       % Pre�nfasis de la se�al.
N=length(signal);                       % Longitud de la se�al.
duracionTrama=256;                      % Duraci�n de 32 (ms).
numeroTramas = floor(fs/duracionTrama); % Redondeo del n�mero de tramas.
SUP_signal=signal;                      % Se almacena la se�al entera.
INF_signal=signal(128:N);               % Se almacena la se�al desde la muestra 128 hasta el final. Solape de 16 ms.

CoefCesptrum_SUP = zeros(numeroTramas,10);  % Matriz para almacenar los coeficientes Cepstrum de cada trama de la se�al.
CoefCesptrum_INF = zeros(numeroTramas-1,10);% Igual que CoefCesptrum_SUP; se le resta 1 porque se empieza a almacenar en la muestra 128. Exceder�a los l�mites.

for i=1:numeroTramas
    CoefCesptrum_SUP (i,:) = CalculaCepstrum (SUP_signal((i-1)*256+1:i*256)); % Se llama a CalculaCepstrum y se le pasan tramas 256 muestras de la se�al.
    if i < numeroTramas
        CoefCesptrum_INF (i,:) = CalculaCepstrum (INF_signal((i-1)*256+1:i*256));
    end;
end
save (strcat (dirName,'\cps\',vocal,'\',fileName,'.cps'),'CoefCesptrum_SUP','CoefCesptrum_INF'); % Almacenamiento de todos los coeficientes Cepstrum de la se�al.(Los cps).
end