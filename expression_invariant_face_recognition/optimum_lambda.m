filename = 'jaffeimage';
format = 'tiff';
n = 1;
%lambda = 70;
dim = 1024;
mat_size = 32;
max = 0;
opt_lambda = 0;
for lambda = 0:50:250
    [total , per] = cross_validation(filename,format,n,lambda,dim,mat_size);
    if max < total
        max = total;
        opt_lambda = lambda;
    end
end