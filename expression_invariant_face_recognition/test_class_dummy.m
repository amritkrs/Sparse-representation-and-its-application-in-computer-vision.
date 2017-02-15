function [name,min_val1,min_val2] = test_class_dummy(c,dim,trainingdata,lambda,phi)
    c = double(c);
  %  c = ( c - min(c(:)) ) ./ ( max(c(:)) - min(c(:)) );
    c = c(:);
    c = c - mean(c);
    if phi.low_dim == 1
        c = phi.phi * c;
    end
    results = [];
    len = length(trainingdata);
    for i = 1:len
        temp1 = trainingdata(i).zc;
        temp2 = trainingdata(i).za;
        temp2 = double(temp2);
        cki = c - temp1;
        val = norm(cki);
        results = [results val];
        
    end
    [min_val1,index] = min(results);
    name = trainingdata(index).name;
    results = results(results~=min_val1);
    min_val2 = min(results);
    
        
    
end
        
    