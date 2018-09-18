function RecCentroide (vocal,fileName)
% Función idéntica a centroide con la salvedad que aquí no hace falta el
% bucle for del listado, no se va a crear una base de datos, ya está hecha,
% sólo se va aemplear este audio para compararlo con la base de datos ya
% creada.
%
numeroTramas =31;
CoefCesptrum_SUP = zeros(numeroTramas,10);
CoefCesptrum_INF = zeros(numeroTramas-1,10);
Vm62=zeros(61,10);
fileNameCps = strcat(dirName,'\cps\',vocal,'\',fileName,'.cps');
load (fileNameCps,'-mat','CoefCesptrum_SUP','CoefCesptrum_INF');
for j = 1:31;
    Vm62(j*2-1,:)=CoefCesptrum_SUP(j,:);
    if j<31;
        Vm62(j*2,:)=CoefCesptrum_INF(j,:);
    end;
end
plot (Vm62,'.');

%[Vcentroide,Vctrs]=kmeans(Vm62,4);
Vctrs=getMeans(Vm62);
Vcentroide=zeros(1);
save (strcat (dirName,'\cps\',vocal,'\',fileName,'.cnt'),'Vcentroide','Vctrs','Vm62');
end