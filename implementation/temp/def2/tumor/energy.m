function [e] = energy(x,y,psi_rk)
esum=0;
for p=x-2:x+2
    for q=y-2:y+2
        esum=esum+psi_rk(p,q);
    end
end

e = esum/25;

end