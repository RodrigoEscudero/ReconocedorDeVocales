function dt = Grabar(vocal,name)
% Funci�n que graba y almacena la se�al. Posee dos par�metros de entrada:
% Si llamamos a la funci�n con 1 par�metro (vocal), la salida se almacenar� en la
% vocal que hayamos introducido como par�metro nombr�ndose por la fecha de
% grabaci�n(l�nea 12). Se utlilizar� para realizar el entrenamiento de las vocales.
% Cuando llamamos a la funci�n con dos par�metros,se va a utilizar para el m�dulo
% de reconocer y s�lo necesitaremos el audio una s�la vez por lo que podremos
% sobreescribir el fichero.

Fs=8000;                               %Frecuenca de muestreo a utilizar;doble del ancho de banda de la voz.
tiempoGrabacion=1;                     %Tiempo de grabaci�n en segundos.
y = wavrecord(tiempoGrabacion*Fs,Fs,1);% Grabaci�n en modo mono durante 1(s). Muestreadas a 8KHz (8000 muestras).
switch nargin
    case 1
        dt = datestr(now,'yyyymmddHHMMSS'); % LLamar un fichero por la fecha de creaci�n.
    case 2
        dt=name;
end

which=strcat(dirName,'\wavs\',vocal,'\',dt,'.wav');
wavwrite(y,Fs,16,which);                % Almacena la se�al en donde le hayamos ordenado en 'which'. (Los wavs).
sound(y,Fs);
end

