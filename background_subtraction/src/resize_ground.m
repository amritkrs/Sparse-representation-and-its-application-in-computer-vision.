function im_array = resize_ground(data,dim)
total = size(data,3);
filename = '/home/amrit/Videos/background_subtraction/video/ground/';
for i = 1:total
    %j = imread(data(:,:,i));
    j = data(:,:,i);
    j = imresize(j,[dim,dim]);
    name = strcat(filename,num2str(i),'.jpg');
    imwrite(j,name);
end
end
