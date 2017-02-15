function [zc,za] = store(w,cnt,dim,phi)
    if phi.test == 1
        dim = size(phi.phi,1);
    end
    zc = w(1:dim,1);
%     m = sqrt(dim);
%     zc = reshape(z,m,m);
    index = dim+1;
    size(w);
    za = w(index:2*dim,1);
    for i = 3:cnt+1
        index = index + dim;
        temp = w(index:i*dim,1);
        za = za + temp;
    end
%     if phi.test == 1
%         zc = phi.phi * zc;
%         za = phi.phi * za;
%     end
        