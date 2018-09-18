function [sol,min]= Reconoce()
%Función que devuelve la vocal reconocida.
%
inicios('Voz','voz');               % Características del
RecCentroide('Voz','voz');          % Audio a comparar.
vocales='aeiou';                    % Array de posibles soluciones
min= intmax('int64');               % Mayor valor integer (64 bit)
sol='a';
for rv=1:length(vocales)            % Bucle que devuelve la vocal más cercana
    dist=distancia(vocales(rv));    % a la señal grabada.
    if dist< min
        min=dist;
        sol=vocales(rv);
    end
end

% plot( ctrs(:,1),ctrs(:,2),ctrs(:,3),ctrs(:,4),'r.');
% hold on;
% plot( Vctrs(:,1),Vctrs(:,2),Vctrs(:,3),Vctrs(:,4),'b.');
% hold;