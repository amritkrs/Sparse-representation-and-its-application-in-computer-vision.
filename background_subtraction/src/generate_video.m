workingDir = cd;
outputVideo = VideoWriter(fullfile(workingDir,'shuttle_out.avi'));
outputVideo.FrameRate = 10;
open(outputVideo)

cd('Images');
cd('1');
format = strcat('*.','jpg');
files = dir(format);
y = []; % array to hold the ensemble of images of the subject
cnt = 0; %track the number of images for a person
l = length(files);
acell = struct2cell(files);
acell = acell';
name = sort_nat(acell(:,1));

% loop through the images , resize , and add to y.
for i = 1:l
    cnt = cnt + 1;
    j = imread(name{i});
    j = imresize(j,[150 150]);
    writeVideo(outputVideo,j)
end
cd('..');
cd('2');
format = strcat('*.','jpg');
files = dir(format);
y = []; % array to hold the ensemble of images of the subject
cnt = 0; %track the number of images for a person
l = length(files);
acell = struct2cell(files);
acell = acell';
name = sort_nat(acell(:,1));

% loop through the images , resize , and add to y.
for i = 1:l
    cnt = cnt + 1;
    j = imread(name{i});
    j = imresize(j,[150 150]);
    writeVideo(outputVideo,j)
end

cd('..');
cd('3');
format = strcat('*.','jpg');
files = dir(format);
y = []; % array to hold the ensemble of images of the subject
cnt = 0; %track the number of images for a person
l = length(files);
acell = struct2cell(files);
acell = acell';
name = sort_nat(acell(:,1));

% loop through the images , resize , and add to y.
for i = 1:l
    cnt = cnt + 1;
    j = imread(name{i});
    j = imresize(j,[150 150]);
    writeVideo(outputVideo,j)
end

cd('..');
cd('4');
format = strcat('*.','jpg');
files = dir(format);
y = []; % array to hold the ensemble of images of the subject
cnt = 0; %track the number of images for a person
l = length(files);
acell = struct2cell(files);
acell = acell';
name = sort_nat(acell(:,1));

% loop through the images , resize , and add to y.
for i = 1:l
    cnt = cnt + 1;
    j = imread(name{i});
    j = imresize(j,[150 150]);
    writeVideo(outputVideo,j)
end

cd('..');
cd('5');
format = strcat('*.','jpg');
files = dir(format);
y = []; % array to hold the ensemble of images of the subject
cnt = 0; %track the number of images for a person
l = length(files);
acell = struct2cell(files);
acell = acell';
name = sort_nat(acell(:,1));

% loop through the images , resize , and add to y.
for i = 1:l
    cnt = cnt + 1;
    j = imread(name{i});
    j = imresize(j,[150 150]);
    writeVideo(outputVideo,j)
end

cd('..');
cd('6');
format = strcat('*.','jpg');
files = dir(format);
y = []; % array to hold the ensemble of images of the subject
cnt = 0; %track the number of images for a person
l = length(files);
acell = struct2cell(files);
acell = acell';
name = sort_nat(acell(:,1));

% loop through the images , resize , and add to y.
for i = 1:l
    cnt = cnt + 1;
    j = imread(name{i});
    j = imresize(j,[150 150]);
    writeVideo(outputVideo,j)
end

cd('..');
cd('7');
format = strcat('*.','jpg');
files = dir(format);
y = []; % array to hold the ensemble of images of the subject
cnt = 0; %track the number of images for a person
l = length(files);
acell = struct2cell(files);
acell = acell';
name = sort_nat(acell(:,1));

% loop through the images , resize , and add to y.
for i = 1:l
    cnt = cnt + 1;
    j = imread(name{i});
    j = imresize(j,[150 150]);
    writeVideo(outputVideo,j)
end

cd('..');
cd('8');
format = strcat('*.','jpg');
files = dir(format);
y = []; % array to hold the ensemble of images of the subject
cnt = 0; %track the number of images for a person
l = length(files);
acell = struct2cell(files);
acell = acell';
name = sort_nat(acell(:,1));

% loop through the images , resize , and add to y.
for i = 1:l
    cnt = cnt + 1;
    j = imread(name{i});
    j = imresize(j,[150 150]);
    writeVideo(outputVideo,j)
end

close(outputVideo)
%shuttleAvi = VideoReader(fullfile(workingDir,'shuttle_out.avi'));
