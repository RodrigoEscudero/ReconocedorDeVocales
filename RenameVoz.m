function RenameVoz(vocal)
% Función auxiliar
%

dt = datestr(now,'yyyymmddHHMMSS');
from=strcat(dirName,'\wavs\Voz\voz.wav');
to=strcat(dirName,'\wavs\',vocal,'\',dt,'.wav');

movefile(from,to);

inicios(vocal,dt);
centroide(vocal);

end