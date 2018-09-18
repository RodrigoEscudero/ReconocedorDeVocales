function centroides = getMeans(m62result)

centroides=zeros(4,10);
for i=1:10
    %i=1
    [x y]=BuscaCentro(m62result(:,i));
    [cuadrantes,indices]=divide4(m62result(:,i),x,y);
    for j=1:4
        % j=1;
        [cx,cy]=extractCent( m62result(:,i), cuadrantes,j);
        centroides(j,i)=cy;
    end
end
end