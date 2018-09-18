function [ cx cy ] = extractCent( vector,indices,cuadrante )

nube(1:length(vector),1) = realmax;%nube trabajo

for i=1:length(nube)
    
    if indices(i)== cuadrante
        nube(i)=vector(i);
    end
end

[cx cy]=BuscaCentro(nube);

end

