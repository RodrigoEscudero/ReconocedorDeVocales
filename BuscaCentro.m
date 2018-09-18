function [centroX centroY] = BuscaCentro (nube)


xMax=length(nube);
xMin=1;

while true
    centroX = floor((xMax + xMin)/2);
    %disp('ITERAMOS X');
    
    resultX=zeros(3,1);
    
    for i = 1:length(nube)
        if nube(i)<realmax
            if i > centroX
                ind=2;  %derecha
            else
                if i < centroX
                    ind=1; %izquierda
                else
                    ind=3; % Coincidentes
                end
            end
            resultX(ind) =  resultX(ind) +1;
        end
    end
    %if abs(resultX(1)-resultX(2)) <= (resultX(3)+1)
    if abs(resultX(1)-resultX(2)) <= 1
        
        %disp ('Nos vamos');
        break;
    end
    
    if resultX(1) < resultX(2)
        xMin=centroX;
    else
        xMax=centroX;
    end
end

%iteramos
elMx=-realmax;
for i =1:length(nube)
    if nube(i)<realmax
        if nube(i) > elMx
            elMx=nube(i);
        end
    end
end
elMn=min(nube);
while true
    centroY = (elMx + elMn)/2;
    %disp('ITERAMOS Y');
    %centro=[centroX, centroY];
    
    resultY=zeros(3,1);
    
    for i =1:length(nube)
        if nube(i)<realmax
            if nube(i) > centroY
                ind=1;
            else
                if nube(i) < centroY
                    ind=2;
                else
                    ind=3;
                end
            end
            resultY(ind) =  resultY(ind) +1;
        end
    end
    if abs(resultY(1)-resultY(2)) <= 1
        %  if abs(resultY(1)-resultY(2)) <= (resultY(3)+1)
        %disp ('Nos vamos');
        break;
    end
    
    if resultY(1) < resultY(2)
        elMx=centroY;
    else
        elMn=centroY;
    end
end
end