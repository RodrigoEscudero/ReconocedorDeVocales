function [y]=preenfasis(x)
% Función que preenfatiza la señal. 
% Es un filtro IIR paso alto que amplifica las componentes de alta frecuencia
% de la señal con el fin de mantener una respuesta constante a través para
% todo el rango de frecuencias. 
%
b=[1 -0.95];
y=filter(b,1,x); % Filter utiliza la transpuesta de la segunda forma directa.
end