function [y,cnt] = make_y(addr,mat_size,format)
    % read all the file name in the current directory
cd(addr);
format = strcat('*.',format);
files = dir(format);
y = []; % array to hold the ensemble of images of the subject
cnt = 0; %track the number of images for a person

% loop through the images , resize , and add to y.
for file = files'
    cnt = cnt + 1;
    j = imread(file.name);      % j is 64 * 64 int matrix
    [m,n,o] = size(j);
    if o > 1
        j = rgb2gray(j);
    end
    j = imresize(j,[mat_size mat_size]);      % resize j to 16 * 16 matrix
    k = double(j);          % convert the pixel matrix to double matrix
    
    k = k(:);                   % make k to a 1D image to get 256*1 vector
    k = k - mean(k);
    y = vertcat(y,k);           % vertically concatenate k to y
end