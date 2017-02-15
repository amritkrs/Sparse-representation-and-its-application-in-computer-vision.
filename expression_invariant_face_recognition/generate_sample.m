function generate_sample(filename,format,num_of_test_case)
    s = pwd;
    format = strcat('*.',format);
    mkdir('sample');
    mkdir('test');
    sample_path = strcat(s,'/','sample');
    test_path = strcat(s,'/','test');
    s = strcat(s, '/', filename);
    cd(s);
    a = dir;
    len = length(a);
    for i = 1:len
      if strcmp(a(i).name,'.')
             a(i).name
         else if strcmp(a(i).name,'..')
                    a(i).name
             else
                folder = a(i).name; 
                mkdir(sample_path,a(i).name);
                mkdir(test_path,a(i).name);
                dir_sample_path = strcat(sample_path,'/',a(i).name,'/');
                dir_test_path = strcat(test_path,'/',a(i).name,'/');
            
                p = strcat(s,'/',a(i).name);
                cd(p);
                
                files = dir(format);
                num_of_images = length(files);
                array = randperm(num_of_images);
                array = array(1:num_of_test_case);
                array = sort(array) ;
                cnt = 0;
                
                count_of_test_case = 1;
                for file = files'
                    cnt = cnt + 1;
                    if count_of_test_case > num_of_test_case
                            j = imread(file.name);
                            filename = strcat(dir_sample_path , file.name);
                            imwrite(j,filename); 
                    else if array(count_of_test_case) == cnt
                        j = imread(file.name);
                        filename = strcat(dir_test_path , file.name);
                        imwrite(j,filename);
                        count_of_test_case =  count_of_test_case + 1;
                        
                    else
                        j = imread(file.name);
                        filename = strcat(dir_sample_path , file.name);
                        imwrite(j,filename);  
                        end
                    end

%                     R = randsample('01',1,true,[0.9,0.1]);
%                     if R == '0'
%                         if count_of_test_case >= num_of_test_case
%                         
%                             j = imread(file.name);
%                             filename = strcat(dir_sample_path , file.name);
%                             imwrite(j,filename);  
%                         else
%                             j = imread(file.name);
%                             filename = strcat(dir_test_path , file.name);
%                             imwrite(j,filename);
%                             count_of_test_case =  count_of_test_case + 1;
%                         end
%                     else 
%                    
%                         
%                         j = imread(file.name);
%                         filename = strcat(dir_sample_path , file.name);
%                         imwrite(j,filename);  
%                    
%                     
%                     
%                     end
                end
             end
      end
    end
    disp('done')
end


