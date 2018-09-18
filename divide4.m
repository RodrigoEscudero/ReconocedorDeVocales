function [ cuadrantes ordinal]  = divide4( nube,x,y )

cuadrantes=zeros(1,length(nube));
ordinal=zeros(4,1);
for i = 1:length(nube)
    cmpx = i - x;
    cmpy = nube(i) - y ;
    
    if  (cmpx<0) && (cmpy<0)
        ind=3;
    else
        if  cmpx<0 && cmpy>0
            ind=2;
        else
            if  cmpx>0 && cmpy>0
                ind=1;
            else
                ind=4;
            end
        end
    end
    cuadrantes(1,i)=ind;
    ordinal(ind) = ordinal(ind) + 1;
end

end