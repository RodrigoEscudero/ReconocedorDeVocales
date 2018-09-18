function centroide (vocalName)
%C�lculo de los centroides de un directorio vocal.
numeroTramas = 31;                                             % Resultado del floor de 'inicios'.
CoefCesptrum_SUP = zeros(numeroTramas,10);                     % Coeficientes Cepstrum rama superior.
CoefCesptrum_INF = zeros(numeroTramas-1,10);                   % Coeficientes Cepstrum rama inferior.
dirlist = dir(strcat (dirName,'\cps\',vocalName,'\*.cps'));    % Listado del directorio de cada vocal.
m62=zeros(61,10);                                              % Matriz donde se guardar�n los Cepstrum tanto de la rama superior como de la inferior.
m62result= zeros(61,10);                                       % Matriz donde se guardar� la media de los Cepstrum de cada cocal que se haya grabado.
for i = 1:length(dirlist)
    filename=dirlist(i).name;                                  % Extracci�n del nombre del fichero.
    load (strcat (dirName,'\cps\',vocalName,'\',filename),'-mat','CoefCesptrum_SUP','CoefCesptrum_INF'); % Se cargan los Cepstrum.
    
    for j = 1:31;
        m62(j*2-1,:)=CoefCesptrum_SUP(j,:);                    % Se cargan en m62, en las filas impares, los
        if j<31;                                               % CoefCepstrum_SUP, y en las pares los
            m62(j*2,:)=CoefCesptrum_INF(j,:);                  % CoefCepstrum_INF. Se ordenan en el tiempo. 
        end;
    end;
    
    m62result = m62result+m62;                                 % Suma de todas las matrices de cada elemento de dirList.
end
m62result=m62result/i;                                         % Media del bucle anteior.
%plot (m62result,'.');      
ctrs=zeros(4,10);                                              % Matriz donde se guardar�n los centroides.
%[Rcentroide, ctrs]=kmeans(m62result,4);                        % Extracci�n de los 4 centroides de todos los coeficientes Cepstrum. Rcentroide: qu� puntos pertenecen a qu� K.
%Mi solucion
ctrs=getMeans(m62result);
Rcentroide=zeros(1);
save (strcat (dirName,'\cps\',vocalName,'\centroide.cnt'),'Rcentroide','ctrs','m62result'); % Almacenamiento datos de inter�s.
end