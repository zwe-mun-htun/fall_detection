clc;clear;close all
%step read mymov
mymov = vision.VideoFileReader('test.avi');
mymov1 =  VideoReader('test.avi');
nFrames = mymov1.NumberOfFrames;

foregroundDetector = vision.ForegroundDetector('NumGaussians',3,'NumTrainingFrames',20);


  for i = 1:nFrames-1
        frame = step(mymov);
        b = frame;
        pause(0.0005);
        frame = rgb2gray(frame);
        
        foreground = step(foregroundDetector, frame);
        mask = foreground;

        mask = medfilt2(mask,[11 11]);

        mask = imopen(mask, strel('rectangle', [11,11]));
        mask = imclose(mask, strel('rectangle', [21, 21])); 
        mask = imfill(mask, 'holes');  

%         axes(handles.axes1);
        imshow(b,[]);
        
  end
       
       