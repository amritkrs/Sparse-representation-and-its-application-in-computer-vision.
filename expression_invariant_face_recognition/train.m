function trainingdata = train(lambda,dim,mat_size,format,phi)
trainingdata = struct;
s = pwd
a = dir
index = 0;
total_time = 0;
for i = a'
    if eq(i.name,'.')
        i.name
    else
        p = strcat(s,'/',i.name)
        disp 'making y'
        [y,cnt] = make_y(p,mat_size,format);
        size(y)
        disp 'calling generate_psibar'
        [w,time] = generate_psibar(y,cnt,dim,lambda,phi);
        total_time = total_time + time ;
        [zc,za] = store(w,cnt,dim,phi);
        index = index + 1;
        
        trainingdata(index).zc = zc;
        trainingdata(index).za = za;
        trainingdata(index).name = i.name;
        
        if phi.low_dim == 1
            trainingdata(index).zc = phi.phi * zc;
            trainingdata(index).za = phi.phi * za;
        end
        
        
        
    end

end
total_time