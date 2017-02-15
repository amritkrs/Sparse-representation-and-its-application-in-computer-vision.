function [zc,za,mean_intensity] = store(w,cnt,dim,phi,mean_intensity,num_start,num_frames)
    if phi.test == 1
        dim = size(phi.phi,1);
    end
    size(w);
    filename = '/home/amrit/Videos/background_subtraction/video/result_zodiac/';
    mean_intensity = [mean(mean_intensity) mean_intensity];
      zc = w(1:dim,1);
      m = sqrt(dim);
%      temp = zc;
%      temp = temp + mean_intensity(1);
%      temp = reshape(temp,m,m);
%      temp = abs(temp);
%      temp = uint8(temp);
%       common_name = strcat(filename,'common.jpg');
%       imwrite(temp,common_name);
%      imshow(temp);
    % pause;
    %imresize(temp,[1024 1024]);
    
   % index = dim+1;
   index = 1;
   start = num_start*num_frames;
    za = w(index:2*dim,1);
    for i = 2:cnt
        index = index + dim;
         temp = w(index:i*dim,1);
         temp = temp + mean_intensity(i-1) - 10;
         temp = reshape(temp,m,m);
         % temp = abs(temp);
         temp = uint8(temp);
         temp = averaging_filter(temp);
         imshow(temp);
         name = strcat(filename,num2str(i+start-1),'.jpg');
         imwrite(temp,name);
%           pause;
     %  za = za + temp;
        
    end
%     if phi.test == 1
%         zc = phi.phi * zc;
%         za = phi.phi * za;
%     end
%         temp = za;
%         temp = reshape(temp,m,m);
%         temp = abs(temp);
%         temp = uint8(temp);
%         imshow(temp);
%         pause;
%         temp = za + zc;
%         temp = reshape(temp,m,m);
%         temp = abs(temp);
%         temp = uint8(temp);
%         imshow(temp);