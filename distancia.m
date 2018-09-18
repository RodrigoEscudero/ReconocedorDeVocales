function [retorno] = distancia(vocal)
% Funci�n que calcula la distancia eucl�dea entre dos matrices.
%
fileName = strcat (dirName,'\cps\Voz\voz.cnt');                     % Destinada a almacenar el centroide de la se�al a comparar (Vctrs).
vocalName= strcat (dirName,'\cps\',vocal,'\centroide.cnt');         % Destinada a almacenar el centroide de la base de datos creada (ctrs).
load (fileName,'-mat','Vcentroide','Vctrs','Vm62');                 % Carga de los datos necesarios. 
load (vocalName,'-mat','Rcentroide','ctrs','m62result');            % Carga de los datos necesarios.
diferenciaSimple = Vctrs - ctrs;                                    % Diferencia de los centroides.
retorno = sqrt(sum(diag(diferenciaSimple * diferenciaSimple')));    % Distancia de estas matrices. Se define como la ra�z cuadrada de la traza 
                                                                    % del producto de las matrices de los centroides. (Una conjugada)
end

