function per = test_c(trainingdata,lambda,dim,mat_size,format,phi)
    s = pwd;
    a = dir;
    format = strcat('*.',format);
    index = 0;
    len = length(a);
    correct = 0;
    incorrect = 0;
    total = 0;
    for i = 1:len
        if strcmp(a(i).name,'.')
            a(i).name
        else if strcmp(a(i).name,'..')
                a(i).name
        else
            folder = a(i).name; 
            p = strcat(s,'/',a(i).name);
            cd(p);
            files = dir(format);
            for file = files'
                c = imread(file.name);
                [m,n,o] = size(c);
                if o > 1
                    c = rgb2gray(c);
                end
               
                c = imresize(c,[mat_size mat_size]);
                [name,min_val1,min_val2] = test_class_dummy(c,dim,trainingdata,lambda,phi);
                % name = test_class(c,dim,trainingdata,lambda,phi);
                
%                 if abs(min_val1 - min_val2) < 20
%                     name = test_class(c,dim,trainingdata,lambda);
%                 end
                if strcmp(name,folder)
                    correct = correct + 1;
                    total = total + 1;
                else
                    incorrect = incorrect + 1
                    total = total + 1
%                     min_val1
%                     min_val2
                end
                
            end
        end
    end
    per = correct/total;
    per = per * 100;
end