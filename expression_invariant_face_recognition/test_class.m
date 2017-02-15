function name = test_class(c,dim,trainingdata,lambda,phi)
    c = double(c);
    c = c(:);
    c = c - mean(c);
    if phi.low_dim == 1
        c = phi.phi * c;
        phi.test = 1;
    end
    answers = [];
    len = length(trainingdata);
    for i = 1:len
        temp1 = trainingdata(i).zc;
        temp2 = trainingdata(i).za;
        temp2 = double(temp2);
        cki = c - temp1;
        y = [];
        y = vertcat(y,cki);
        y = vertcat(y,temp2);
        w = generate_psibar(y,2,dim,lambda,phi);
        [zc,za] = store(w,2,dim,phi);
        ck_bar = temp1 + zc;
        diff = ck_bar - c;
        val = norm(diff,2);
        answers = [answers val];
%       phi.test = 0;
%         if i == 1
%             min_val = val;
%             name = trainingdata(i).name;
%         end
%         if min_val > val
%             min_val = val;
%             name = trainingdata(i).name;
%         end
        
    end
    [~,index] = min(answers);
    name = trainingdata(index).name;
    phi.test = 0;
end
        
    