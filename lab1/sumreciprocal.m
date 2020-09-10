function result=sumreciprocal(m,k)
        format long;
        s=0;
        for i=1:m
            s=s+(1/i);
        end
        scf=0;
        for i=1:m
            scf=chop(scf+chop(1/i,k),k);
        end
        scb=0;
        for i=m:-1:1
            scb=chop(scb+chop(1/i,k),k);
        end
        result=[s,scf,scb];
        
end
