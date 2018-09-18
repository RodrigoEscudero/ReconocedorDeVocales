function dt = Grabar(vocal,name)
% Función que graba y almacena la señal. Posee dos parámetros de entrada:
% Si llamamos a la función con 1 parámetro (vocal), la salida se almacenará en la
% vocal que hayamos introducido como parámetro nombrándose por la fecha de
% grabación(línea 12). Se utlilizará para realizar el entrenamiento de las vocales.
% Cuando llamamos a la función con dos parámetros,se va a utilizar para el módulo
% de reconocer y sólo necesitaremos el audio una sóla vez por lo que podremos
% sobreescribir el fichero.

Fs=8000;                               %Frecuenca de muestreo a utilizar;doble del ancho de banda de la voz.
tiempoGrabacion=1;                     %Tiempo de grabación en segundos.
y = wavrecord(tiempoGrabacion*Fs,Fs,1);% Grabación en modo mono durante 1(s). Muestreadas a 8KHz (8000 muestras).
switch nargin
    case 1
        dt = datestr(now,'yyyymmddHHMMSS'); % LLamar un fichero por la fecha de creación.
    case 2
        dt=name;
end

which=strcat(dirName,'\wavs\',vocal,'\',dt,'.wav');
wavwrite(y,Fs,16,which);                % Almacena la señal en donde le hayamos ordenado en 'which'. (Los wavs).
sound(y,Fs);
end

