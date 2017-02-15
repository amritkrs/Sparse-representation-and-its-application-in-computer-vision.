%function[total, per] = cross_validation(filename,format,n,lambda,dim,mat_size)
total = 0;
filename = 'cohn-kanade';
format = 'png';
n = 3;
lambda = 100;
dim = 1024;
mat_size = 32;
num_of_training_images = 11;
cnt = 0;
per = [];
ED = 204;
phi = struct;
phi.low_dim = 1;
phi.test = 0;

for i = 1:n
    %generate_sample(filename,format,num_of_training_images);
    %cd('..');
    %cd('..');
    phi.phi = randn(ED,dim);   % ED is effective dimension.
    cd('test');
    trainingdata = train(lambda,dim,mat_size,format,phi);
    cd('..');
    cd('..');
    cd('sample');
    result = test_c(trainingdata,lambda,dim,mat_size,format,phi)
    per = [per result];
    cd('..');
    cd('..'); 
   % rmdir('sample','s');
   % rmdir('test','s');
    cnt = cnt + 1
end
total = sum(per)/n
